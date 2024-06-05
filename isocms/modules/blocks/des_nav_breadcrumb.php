<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsCountry         =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsGuideCat        =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
#
if (!empty($_GET['slug_country'])) {
    $country_id     =   $clsCountry->getBySlug($_GET['slug_country']);
    $smarty->assign('country_id', $country_id);
    $country_info   =   $clsCountry->getOne($country_id);
    $smarty->assign('country_info', $country_info);
}
#
$guidecat_id    =   isset($_GET['guidecat_id']) ? $_GET['guidecat_id'] : '';
if (!empty($guidecat_id)) {
    $guidecat_info  =   $clsGuideCat->getOne($guidecat_id);
    $guidecat_title =   $guidecat_info['title'];
    $smarty->assign('guidecat_title', $guidecat_title);
}
