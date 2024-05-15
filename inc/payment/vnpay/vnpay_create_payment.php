<?php
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
//Config input format
//Expire
$startTime = date("YmdHis");
$expire = date('YmdHis',strtotime('+15 minutes',strtotime($startTime)));
$vnp_TxnRef = $_POST['billing_id']; //Mã giao dịch thanh toán tham chiếu của merchant

$vnp_Amount = $_POST['amount']; // Số tiền thanh toán
$vnp_Locale = $_POST['language']; //Ngôn ngữ chuyển hướng thanh toán
$vnp_BankCode = $_POST['bankCode']; //Mã phương thức thanh toán
$vnp_IpAddr = $_SERVER['REMOTE_ADDR']; //IP Khách hàng thanh toán
$billing_id=$_POST['billing_id'];

$inputData = array(
    "vnp_Version" => "2.1.0",
    "vnp_TmnCode" => $vnp_TmnCode,
    "vnp_Amount" => $vnp_Amount* 100,
    "vnp_Command" => "pay",
    "vnp_CreateDate" => date('YmdHis'),
    "vnp_CurrCode" => "VND",
    "vnp_IpAddr" => $vnp_IpAddr,
    "vnp_Locale" => $vnp_Locale,
    "vnp_OrderInfo" => "Thanh toan GD:" + $vnp_TxnRef,
    "vnp_OrderType" => "other",
    "vnp_ReturnUrl" => $vnp_Returnurl,
    "vnp_TxnRef" => $vnp_TxnRef,
    "vnp_ExpireDate"=>$expire
);


if (isset($vnp_BankCode) && $vnp_BankCode != "") {
    $inputData['vnp_BankCode'] = $vnp_BankCode;
}

ksort($inputData);
$query = "";
$i = 0;
$hashdata = "";
foreach ($inputData as $key => $value) {
    if ($i == 1) {
        $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
    } else {
        $hashdata .= urlencode($key) . "=" . urlencode($value);
        $i = 1;
    }
    $query .= urlencode($key) . "=" . urlencode($value) . '&';
}

$vnp_Url = $vnp_Url . "?" . $query;
if (isset($vnp_HashSecret)) {
    $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
    $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
}
header('Location: ' . $vnp_Url);

