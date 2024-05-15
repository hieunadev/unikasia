<?php
//Version 2.0

// *********************
// START OF MAIN PROGRAM
// *********************

// Define Constants
// ----------------
// This is secret for encoding the MD5 hash
// This secret will vary from merchant to merchant
// To not create a secure hash, let SECURE_SECRET be an empty string - ""
// $SECURE_SECRET = "secure-hash-secret";

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
#- End Custom Code

$clsConfiguration = new Configuration();
$SECURE_SECRET = trim($clsConfiguration->getValue('ONEPAY_Visa_Secure_Hash'));
// add the start of the vpcURL querystring parameters
$vpcURL = $_POST["virtualPaymentClientURL"] . "?";

// Remove the Virtual Payment Client URL from the parameter hash as we 
// do not want to send these fields to the Virtual Payment Client.
unset($_POST["virtualPaymentClientURL"]); 

// The URL link for the receipt to do another transaction.
// Note: This is ONLY used for this example and is not required for 
// production code. You would hard code your own URL into your application.

// Get and URL Encode the AgainLink. Add the AgainLink to the array
// Shows how a user field (such as application SessionIDs) could be added
$_POST['AgainLink']=urlencode($_SERVER['HTTP_REFERER']);
//$_POST['AgainLink']=urlencode($_SERVER['HTTP_REFERER']);
// Create the request to the Virtual Payment Client which is a URL encoded GET
// request. Since we are looping through all the data we may as well sort it in
// case we want to create a secure hash and add it to the VPC data if the
// merchant secret has been provided.
//$md5HashData = $SECURE_SECRET; Khởi tạo chuỗi dữ liệu mã hóa trống
$md5HashData = "";

ksort ($_POST);

// set a parameter to show the first pair in the URL
$appendAmp = 0;

foreach($_POST as $key => $value) {

    // create the md5 input and URL leaving out any fields that have no value
    if (strlen($value) > 0) {
        
        // this ensures the first paramter of the URL is preceded by the '?' char
        if ($appendAmp == 0) {
            $vpcURL .= urlencode($key) . '=' . urlencode($value);
            $appendAmp = 1;
        } else {
            $vpcURL .= '&' . urlencode($key) . "=" . urlencode($value);
        }
        //$md5HashData .= $value; sử dụng cả tên và giá trị tham số để mã hóa
        if ((strlen($value) > 0) && ((substr($key, 0,4)=="vpc_") || (substr($key,0,5) =="user_"))) {
		    $md5HashData .= $key . "=" . $value . "&";
		}
    }
}
//xóa ký tự & ở thừa ở cuối chuỗi dữ liệu mã hóa
$md5HashData = rtrim($md5HashData, "&");
// Create the secure hash and append it to the Virtual Payment Client Data if
// the merchant secret has been provided.
if (strlen($SECURE_SECRET) > 0) {
    //$vpcURL .= "&vpc_SecureHash=" . strtoupper(md5($md5HashData));
    // Thay hàm mã hóa dữ liệu
    $vpcURL .= "&vpc_SecureHash=" . strtoupper(hash_hmac('SHA256', $md5HashData, pack('H*',$SECURE_SECRET)));
}

// FINISH TRANSACTION - Redirect the customers using the Digital Order
// ===================================================================
header("Location: ".$vpcURL);

// *******************
// END OF MAIN PROGRAM
// *******************

