<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsCountry =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsWhy     =   new Why();
$smarty->assign('clsWhy', $clsWhy);
$clsCategory_Country    =   new Category_Country();
$smarty->assign('clsCategory_Country', $clsCategory_Country);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsGuideCat        =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
#
if (!empty($_GET['slug_country'])) {
    $id_country     =   $clsCountry->getBySlug($_GET['slug_country']);
    $smarty->assign('id_country', $id_country);
    $info_country   =   $clsCountry->getOne($id_country);
    $smarty->assign('info_country', $info_country);
}
#
// List why choose Việt Nam 
$arr_why    =   $clsWhy->getAll("is_trash = 0 AND is_online = 1 AND type = 'DESTINATION' AND country_id = $id_country ORDER BY order_no ASC LIMIT 10");
$smarty->assign('arr_why', $arr_why);
#
// List danh mục travel style by country
$arr_trvs_country   =   $clsCategory_Country->getAll("is_trash = 0 AND is_online = 1 AND country_id = $id_country ORDER BY order_no ASC", 'category_country_id, cat_id');
$smarty->assign('arr_trvs_country', $arr_trvs_country);
#
// List danh mục travel guide
// $clsGuideCat->SetDebug(1);
$arr_trvg   =   $clsGuideCat->getAll("is_trash = 0 AND is_online = 1 ORDER BY order_no ASC", 'guidecat_id');
// die;
$smarty->assign('arr_trvg', $arr_trvg);
// $clsISO->dd($arr_trvg);
