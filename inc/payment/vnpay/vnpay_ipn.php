<?php
/* Payment Notify
 * IPN URL: Ghi nhận kết quả thanh toán từ VNPAY
 * Các bước thực hiện:
 * Kiểm tra checksum 
 * Tìm giao dịch trong database
 * Kiểm tra số tiền giữa hai hệ thống
 * Kiểm tra tình trạng của giao dịch trước khi cập nhật
 * Cập nhật kết quả vào Database
 * Trả kết quả ghi nhận lại cho VNPAY
 */
if(!defined('ABSPATH')){
	define('ABSPATH',$_SERVER['DOCUMENT_ROOT']);
}
if(!defined('DS')){
	define("DS", DIRECTORY_SEPARATOR);
}
require(ABSPATH.DS.'config.php');
define("DIR_INCLUDES", ABSPATH."/inc");
define("DIR_COMMON", DIR_INCLUDES."/iso");
define("DIR_ADODB", DIR_INCLUDES."/adodb");
define("DIR_CLASSES", ABSPATH."/classes");
#- Connect to DB
require_once DIR_ADODB. '/adodb.inc.php';
$dbconn = &ADONewConnection(DB_TYPE);
$dbconn->Connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
#- End Connect to DB

#- Include Requirement core file
require_once DIR_COMMON. '/clsDbBasic.php';
require_once DIR_COMMON. '/clsStdio.php';
require_once DIR_COMMON. '/vnSession.php';
require_once DIR_CLASSES. '/class_Configuration.php';
require_once DIR_CLASSES. '/class_Billing.php';
#- End Custom Code

$clsConfiguration = new Configuration();
$clsBilling = new Billing();

$vnp_TmnCode = trim($clsConfiguration->getValue('VNPay_ID_Website'));//Mã định danh merchant kết nối (Terminal Id)
$vnp_HashSecret = trim($clsConfiguration->getValue('VNPay_SecretKey')); //Secret key
$vnp_Url = trim($clsConfiguration->getValue('VNPAY_URL_PAYMENT'));
$vnp_Returnurl = DOMAIN_NAME.$extLang."/payment/vnpay/return.html";
$vnp_apiUrl = "http://sandbox.vnpayment.vn/merchant_webapi/merchant.html";
$apiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";


$startTime = date("YmdHis");
$expire = date('YmdHis',strtotime('+15 minutes',strtotime($startTime)));

$inputData = array();
$returnData = array();
foreach ($_GET as $key => $value) {
    if (substr($key, 0, 4) == "vnp_") {
        $inputData[$key] = $value;
    }
}

$vnp_SecureHash = $inputData['vnp_SecureHash'];
unset($inputData['vnp_SecureHash']);
ksort($inputData);
$i = 0;
$hashData = "";
foreach ($inputData as $key => $value) {
    if ($i == 1) {
        $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
    } else {
        $hashData = $hashData . urlencode($key) . "=" . urlencode($value);
        $i = 1;
    }
}

$secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);
$vnpTranId = $inputData['vnp_TransactionNo']; //Mã giao dịch tại VNPAY
$vnp_BankCode = $inputData['vnp_BankCode']; //Ngân hàng thanh toán
$vnp_Amount = $inputData['vnp_Amount']/100; // Số tiền thanh toán VNPAY phản hồi



$Status = 0; // Là trạng thái thanh toán của giao dịch chưa có IPN lưu tại hệ thống của merchant chiều khởi tạo URL thanh toán.
$orderId = $inputData['vnp_TxnRef'];
try {
    //Check Orderid    
    //Kiểm tra checksum của dữ liệu
    if ($secureHash == $vnp_SecureHash) {
        //Lấy thông tin đơn hàng lưu trong Database và kiểm tra trạng thái của đơn hàng, mã đơn hàng là: $orderId            
        //Việc kiểm tra trạng thái của đơn hàng giúp hệ thống không xử lý trùng lặp, xử lý nhiều lần một giao dịch
        //Giả sử: $order = mysqli_fetch_assoc($result);   
        
        $order=$clsBilling->getOne($orderId);
        if ($order != NULL) {
            if($order["deposit_VND"] == $vnp_Amount) //Kiểm tra số tiền thanh toán của giao dịch: giả sử số tiền kiểm tra là đúng. //$order["Amount"] == $vnp_Amount
            {
                if ($order["status"] != NULL && $order["status"] == 0) {
                    if ($inputData['vnp_ResponseCode'] == '00' && $inputData['vnp_TransactionStatus'] == '00') {
                        $Status = 1; // Trạng thái thanh toán thành công
                    } else {
                        $Status = 2; // Trạng thái thanh toán thất bại / lỗi
                    }
                    //Cài đặt Code cập nhật kết quả thanh toán, tình trạng đơn hàng vào DB
                    
                    if($order['vnp_ResponseCode']!='00'){
                        $set = "ret_url='".addslashes($_SERVER['REQUEST_URI'])."'
                        ,status='$Status'
                        ,status_date='".time()."'
                        ,return_date='".time()."'
                        ,vnp_CardType='".addslashes($inputData['vnp_CardType'])."'
                        ,vnp_BankCode='".addslashes($inputData['vnp_BankCode'])."'
                        ,vnp_BankTranNo='".addslashes($inputData['vnp_BankTranNo'])."'
                        ,vnp_TransactionNo='".addslashes($inputData['vnp_TransactionNo'])."'
                        ,vnp_ResponseCode='".addslashes($inputData['vnp_ResponseCode'])."'
                        ,vnp_TransactionStatus='".addslashes($inputData['vnp_TransactionStatus'])."'
                        ,vnp_PayDate='".addslashes($inputData['vnp_PayDate'])."'
                        ,vnp_OrderInfo='".addslashes($inputData['vnp_OrderInfo'])."'
                        ,vnp_TxnRef='".addslashes($inputData['vnp_TxnRef'])."'
                        ,vnp_SecureHash='".addslashes($vnp_SecureHash)."'";
                        $clsBilling->updateOne($orderId, $set);
                    }

                    //Trả kết quả về cho VNPAY: Website/APP TMĐT ghi nhận yêu cầu thành công                
                    $returnData['RspCode'] = '00';
                    $returnData['Message'] = 'Confirm Success';
                } else {
                    $returnData['RspCode'] = '02';
                    $returnData['Message'] = 'Order already confirmed';
                }
            }
            else {
                $returnData['RspCode'] = '04';
                $returnData['Message'] = 'invalid amount';
            }
        } else {
            $returnData['RspCode'] = '01';
            $returnData['Message'] = 'Order not found';
        }
    } else {
        $returnData['RspCode'] = '97';
        $returnData['Message'] = 'Invalid signature';
    }
} catch (Exception $e) {
    $returnData['RspCode'] = '99';
    $returnData['Message'] = 'Unknow error';
}
//Trả lại VNPAY theo định dạng JSON
echo json_encode($returnData);
