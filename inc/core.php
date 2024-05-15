<?php
#Debugging
define("SMARTY_DEBUG", 	false); //debug or not
define("COMPILE_CHECK", true); //compile check
define("ADODB_DEBUG", 	false); //debug or not
define("STOP_APP_IF_ERROR", 1); //stop if error happen 0: no, 1: yes

// Xong dự án thì xóa 6 dòng dưới để lưu lại cache tmp
$files = glob(getcwd() . '/tmp/*'); // get all file names
foreach ($files as $file) { // iterate files
	if (is_file($file)) {
		unlink($file); // delete file
	}
}

#Private Directory
if (!defined('ISOCMS_THEMES')) {
	$ISOCMS_THEMES = 'default';
	if (!IS_ADMIN_PAGE) {
		$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		// Check connection
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		$sql = "SELECT * FROM default_configuration where setting='SiteTemplate' limit 0,1";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) {
			// output data of each row
			while ($row = $result->fetch_assoc()) {
				if ($row["value"] != '') {
					$ISOCMS_THEMES = $row["value"];
				}
			}
		}
		$conn->close();
		#
		$systpl = isset($_GET['systpl']) ? $_GET['systpl'] : '';
		if ($systpl != '') {
			vnSessionSetVar('systpl', $systpl);
		}
		if ($systpl == '') {
			$systpl = vnSessionGetVar('systpl') != '' ? vnSessionGetVar('systpl') : $ISOCMS_THEMES;
			vnSessionSetVar('systpl', $systpl);
		}
		$ISOCMS_THEMES = $systpl;
		$dir = dirname(__FILE__) . '/../isocms/templates';
		if (!file_exists($dir . '/' . $systpl . '/index.tpl')) {
			$ISOCMS_THEMES = 'default';
		}
	}
	define("ISOCMS_THEMES", $ISOCMS_THEMES);
}
define("DIR_THEMES",		DIR_TEMPLATES . "/" . ISOCMS_THEMES . "");
define("URL_THEMES",		URL_TEMPLATES . "/" . ISOCMS_THEMES . "");

#Private Dir
define("DIR_TEMPLATES_C", 	PCMS_DIR . "/tmp");
define("DIR_IMAGES",		DIR_THEMES . "/skin/images");
define("DIR_CSS",			DIR_THEMES . "/skin/css");
define("DIR_JS",			DIR_THEMES . "/skin/js");
#Private Url
define("URL_IMAGES",		URL_THEMES . "/skin/images");
define("URL_CSS",			URL_THEMES . "/skin/css");
define("URL_JS",			URL_THEMES . "/skin/js");

#Core Requirement
require_once DIR_COMMON . "/clsDbBasic.php";
require_once DIR_COMMON . "/clsCore.php";
require_once DIR_COMMON . "/clsModule.php";
require_once DIR_COMMON . "/clsCache.php";
require_once DIR_COMMON . "/class.upload.php";
require_once DIR_COMMON . "/Common.php";
require_once DIR_COMMON . "/class.response.php";
require_once DIR_INCLUDES . '/curl/vendor/autoload.php';
require_once DIR_INCLUDES . '/zalo-php-sdk/vendor/autoload.php';
require_once DIR_INCLUDES . '/Webp/vendor/autoload.php';




#ClassRequirement
spl_autoload_register(function ($class) {
	if (file_exists(DIR_CLASSES . '/class_' . $class . '.php')) {
		require_once(DIR_CLASSES . '/class_' . $class . '.php');
	} elseif (IS_ADMIN_PAGE == 1 && file_exists(DIR_ADMIN_CLASSES . '/class_' . $class . '.php')) {
		require_once(DIR_ADMIN_CLASSES . '/class_' . $class . '.php');
	}
});
#End ClassRequirement
if (IS_ADMIN_PAGE) {
	require_once DIR_COMMON . "/clsPaging.php";
	require_once DIR_COMMON . "/clsDataSource.php";
	require_once DIR_COMMON . "/clsDataGrid.php";
}
#DriverDatabase
//print_r(DIR_ADODB);die();
require_once(DIR_ADODB . "/adodb.inc.php");
$dbconn = ADONewConnection(DB_TYPE);
if (isset($dbinfo) && is_array($dbinfo)) {
	$dbconn->connect($dbinfo['host'], $dbinfo['user'], $dbinfo['pass'], $dbinfo['db']);
	$dbconn->debug = ADODB_DEBUG;
} else {
	$dbconn->connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
	$dbconn->debug = ADODB_DEBUG;
}
#Smarty TemplateRequirement
require_once(DIR_SMARTY . "/Smarty.class.php");
$smarty = new Smarty();
$smarty->debugging = SMARTY_DEBUG;
$smarty->config_overwrite = true;
$smarty->compile_check = COMPILE_CHECK;
//if($_SERVER['REMOTE_ADDR'] == '171.224.25.28'){
if (1) {

	require_once(DIR_SMARTY . "/SmartyBC.class.php");
	$smarty = new SmartyBC();
	function smarty_block_dynamic($param, $content, &$smarty)
	{
		return $content;
	}
	$smarty->registerPlugin("block", "dynamic", "smarty_block_dynamic");
	//$smartyBC->register_block('dynamic', 'smarty_block_dynamic', false);
	$smarty->loadFilter('output', 'trimwhitespace'); //v3
} else {
	function smarty_block_dynamic($param, $content, &$smarty)
	{
		return $content;
	}
	$smarty->register_block('dynamic', 'smarty_block_dynamic', false);
}

$smarty->template_dir = DIR_TEMPLATES;
$smarty->compile_dir = DIR_TEMPLATES_C;
$smarty->config_dir = DIR_INCLUDES . "/conf";
//$smarty->loadFilter('output', 'trimwhitespace');//v3

if (IS_ADMIN_PAGE == 1) {
	$smarty->caching = CACHING;
	//Load Language
	$_LANG_ID = LANG_ADMIN_DEFAULT;
	if (isset($_GET['lang']) && !empty($_GET['lang'])) {
		$_LANG_ID = trim($_GET['lang']);
		vnSessionSetVar("ADMINPAGE_LANG", $_LANG_ID);
	} elseif (vnSessionExist("ADMINPAGE_LANG")) {
		$_LANG_ID = vnSessionGetVar("ADMINPAGE_LANG");
	}
} else {
	$smarty->caching = 0;
	$_LANG_ID = LANG_DEFAULT;
	if (isset($_GET['lang']) && !empty($_GET['lang'])) {
		$_LANG_ID = trim($_GET['lang']);
		vnSessionSetVar("_LANG_ID", $_LANG_ID);
	} elseif (vnSessionExist("_LANG_ID")) {
		$_LANG_ID = vnSessionGetVar("_LANG_ID");
	}
}
$smarty->assign("_LANG_ID", $_LANG_ID);
if (LANG_LOAD == 1 && file_exists(DIR_LANG . "/" . $_LANG_ID . ".php")) {
	require_once(DIR_LANG . "/" . $_LANG_ID . ".php");
}
#
function select_query($tbl, $field, $cond, $orderby, $start, $limit)
{
	global $dbconn;
	$where = ($cond != "") ? " WHERE $cond" : "";
	$orderby = ($orderby != "") ? "ORDER BY $orderby" : "";
	$limit = ($limit != "") ? "LIMIT $start, $limit" : "";
	$field_list = $field != "" ? $field : "*";
	$sql = "SELECT " . $field_list . " FROM " . $tbl . " $where $orderby $limit";
	$rs = $dbconn->getAll($sql);
	return $rs;
}
function update_query($tbl, $cond, $set)
{
	global $dbconn;
	$sql = "UPDATE " . $this->tbl . " SET $set WHERE $cond";
	if (!$dbconn->Execute($sql)) {
		trigger_error("Cannot run SQL: `$sql`", E_USER_ERROR);
		return 0;
	}
	return 1;
}
function update_one_query($tbl, $pkey, $pval, $set)
{
	global $dbconn;
	$sql = "UPDATE " . $this->tbl . " SET $set WHERE $pkey='$pval'";
	if (!$dbconn->Execute($sql)) {
		trigger_error("Cannot run SQL: `$sql`", E_USER_ERROR);
		return 0;
	}
	return 1;
}
if (!function_exists('redirect')) {
	function redirect($url)
	{
		header('Location :' . $url);
		exit();
	}
}
