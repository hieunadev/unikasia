<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsCountry         =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
#
if (!empty($_GET['slug_country'])) {
    $country_id     =   $clsCountry->getBySlug($_GET['slug_country']);
    $smarty->assign('country_id', $country_id);
    $country_info   =   $clsCountry->getOne($country_id);
    $smarty->assign('country_info', $country_info);
}
#
