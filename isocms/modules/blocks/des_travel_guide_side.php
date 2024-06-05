<?
// ini_set('display_errors', '1');
// ini_set('display_startup_errors', '1');
// error_reporting(E_ALL);
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsCountry =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsGuideCat    =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
$clsGuide   =   new Guide();
$smarty->assign('clsGuide', $clsGuide);
$clsTour    =   new Tour();
$smarty->assign('clsTour', $clsTour);
$clsTourDestination =   new TourDestination();
$smarty->assign('clsTourDestination', $clsTourDestination);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
#	
$show   =   isset($_GET['show']) ? $_GET['show'] : '';
#
$country_slug   =   $_GET['slug_country'] ?? '';
// $smarty->assign('country_slug', $country_slug);
$country_id     =   $clsCountry->getBySlug($country_slug);
$smarty->assign('country_id', $country_id);
$country_title  =   $clsCountry->getTitle($country_id);
$smarty->assign('country_title', $country_title);
#
$guidecat_slug  =   '';
$guidecat_id    =   0;
if ($show === 'GuideCat') {
    $guidecat_slug  =   $_GET['slug_guidecat'] ?? '';
    $guidecat_id    =   $_GET['guidecat_id'] ?? 0;
}
// $smarty->assign('guidecat_slug', $guidecat_slug);
$smarty->assign('guidecat_id', $guidecat_id);
#
$cond   =   'is_trash = 0 AND is_online = 1';
$order  =   ' ORDER BY order_no ASC';
$limit  =   ' LIMIT 3';
#
$arr_guide_cat  =   $clsGuideCat->getAll($cond . " AND country_id = " . $country_id . $order, "guidecat_id, slug");
$smarty->assign('arr_guide_cat', $arr_guide_cat);
#
// List tour liên quan trong quốc gia
$arr_tour_country   =   $clsTour->getAll($cond . " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = " . $country_id . ")" . $order . $limit, "tour_id, min_price");
$smarty->assign('arr_tour_country', $arr_tour_country);
