<?php
define("DB_HOST", "localhost");
define("DB_USER", "vietnamt_2012");//username
define("DB_PASS", "?x$&S,#x@t6(");//password
define("DB_NAME", "vietnamt_db");//database name

define('USERS_TABLE_NAME', 'default_profile');

$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die(mysql_error());
$database = mysql_select_db(DB_NAME) or die(mysql_error());
/**/
class UserGoogle {
    function checkUserGoogle($uid, $oauth_provider, $username, $email)
	{
        $userstable = USERS_TABLE_NAME;
        $query = mysql_query("SELECT * FROM `$userstable` WHERE email = '$email' and oauth_vendor = '$oauth_provider'") or die(mysql_error());
        $result = mysql_fetch_array($query);
        if(!empty($result)){
        }else{ 
            $query = mysql_query("INSERT INTO `$userstable` (oauth_vendor,oauth_id,full_name,email,reg_date) VALUES ('$oauth_provider','$uid', '$username','$email','time()')") or die(mysql_error());
            $query = mysql_query("SELECT * FROM `$userstable` WHERE email = '$email' and oauth_vendor = '$oauth_provider'");
            $result = mysql_fetch_array($query);
            return $result;
        }
        return $result;
    }
	
	function checkUserYahoo($oauth_provider,$username,$email)
	{
        $userstable = USERS_TABLE_NAME;
        $query = mysql_query("SELECT * FROM `$userstable` WHERE email = '$email' and oauth_vendor = '$oauth_provider'") or die(mysql_error());
        $result = mysql_fetch_array($query);
        if(!empty($result)){
        }else{ 
            $query = mysql_query("INSERT INTO `$userstable` (oauth_vendor,full_name,email,reg_date) VALUES ('$oauth_provider', '$username','$email','time()')") or die(mysql_error());
            $query = mysql_query("SELECT * FROM `$userstable` WHERE email = '$email' and oauth_vendor = '$oauth_provider'");
            $result = mysql_fetch_array($query);
            return $result;
        }
        return $result;
    }
}
?>
