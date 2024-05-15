<?php
/*Kernel of system*/
require_once(DIR_INCLUDES . "/core.php");
require_once DIR_CLASSES . "/class_Configuration.php";
require_once DIR_CLASSES . "/class_ISO.php";
$clsConfiguration = new Configuration();
$clsISO = new ISO();
$is_promotion = $clsConfiguration->getValue('SiteHasTourPromotion');
$is_departure = $clsConfiguration->getValue('SiteHasTourDeparture');
$is_lasthour = $clsConfiguration->getValue('SiteHasTourLastHour');

function data_upload_image_word_textarea($match)
{
	global $clsISO;

	$year = date("Y");
	if (!is_dir(_isoman_dir . '/content/' . $year)) {
		$clsISO->rmkdir(_isoman_dir . '/content/' . $year, 0777);
	}
	$month = date("m");
	if (!is_dir(_isoman_dir . '/content/' . $year . '/' . $month . '-' . $year)) {
		$clsISO->rmkdir(_isoman_dir . '/content/' . $year . '/' . $month . '-' . $year, 0777);
	}

	list(, $img, $type, $base64, $end) = $match;
	$bin = base64_decode($base64);
	$md5 = md5($bin);   // generate a new temporary filename
	$fn = _isoman_dir . '/content/' . $year . '/' . $month . '-' . $year . '/' . $md5 . '.' . $type;
	$imageurl  = DOMAIN_NAME . '/uploads/content/' . $year . '/' . $month . '-' . $year . '/' . $md5 . '.' . $type;

	file_exists($fn) or file_put_contents($fn, $bin);
	return "$img$imageurl$end";  // new <img> tag
}
define('_IS_PROMOTION', $is_promotion);
define('_IS_DEPARTURE', $is_departure);
define('_IS_LASTHOUR', $is_lasthour);

/** =====================================================================* 
	INITIATION SECTION  
 * =====================================================================*/
$mod = $stdio->GET("mod", "home");
$act = $stdio->GET("act", "default");
$core = new Core();

//print_r(DIR_THEMES); die();
/** =====================================================================* 
	CONTROL SECTION  
 * =====================================================================*/
if ($core->isAjax()) {
	$assign_list["mod"] = $mod;
	$assign_list["core"] = $core;
	$smarty->assign($assign_list);
	require_once(ISOCMS_DIR . "/_header_ajax.php");
	if (file_exists(DIR_MODULES . "/$mod/index.php")) {
		require_once(DIR_MODULES . "/$mod/index.php");
	} else {
		$html = htmlNotFound;
		echo ($html);
		die();
	}
	//require_once(ISOCMS_DIR."/_footer.php");
} else {

	require_once(ISOCMS_DIR . "/_header.php");
	if (file_exists(DIR_MODULES . "/$mod/index.php")) {
		require_once(DIR_MODULES . "/$mod/index.php");
	} else {
		$html = htmlNotFound;
		echo ($html);
		die();
	}
	require_once(ISOCMS_DIR . "/_footer.php");

	/*Display template*/
	$assign_list["mod"] = $mod;
	$assign_list["core"] = $core;
	$smarty->assign($assign_list);

	$cache_id = md5($_SERVER['REQUEST_URI'] . ISOCMS_THEMES);
	if (isset($_GET['clearCache'])) {
		$clearCache = md5($_GET['clearCache']);
		$smarty->clear_cache(DIR_THEMES . "/index.tpl", $clearCache);
	}
	if (isset($_GET['clearAllCache'])) {
		$smarty->clearAllCache();
	}

	//print_r(DIR_THEMES); die();
	$smarty->cache_lifetime = cache_lifetime;

	$smarty->display(DIR_THEMES . "/index.tpl", $cache_id);
}
