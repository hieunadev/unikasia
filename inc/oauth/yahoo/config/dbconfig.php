<?php
define("DB_HOST", "localhost");
define("DB_USER", "vietnamt_db2");//username
define("DB_PASS", "6c9(*1ID{,,[");//password
define("DB_NAME", "vietnamt_db");//database name

define('USERS_TABLE_NAME', 'default_profile');
$connection = mysql_connect(DB_HOST, DB_USER, DB_PASS) or die(mysql_error());
$database = mysql_select_db(DB_NAME) or die(mysql_error());
?>
