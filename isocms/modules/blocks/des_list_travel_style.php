<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsTourCategory        =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsCountry             =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsCategory_Country    =   new Category_Country();
$smarty->assign('clsCategory_Country', $clsCategory_Country);
#
if (!empty($_GET['slug_country'])) {
    $id_country =   $clsCountry->getBySlug($_GET['slug_country']);
    $smarty->assign('id_country', $id_country);
}
// List danh mục travel style by country từ bảng trung gian default_category_country
$arr_trvs_country  =   $clsCategory_Country->getAll("is_trash = 0 AND is_online = 1 AND country_id = $id_country ORDER BY order_no ASC", 'category_country_id, cat_id');
#
$arr_tourcat_id =   [];
foreach ($arr_trvs_country as $row) {
    $arr_tourcat_id[]   =   $row['cat_id'];
}
$str_tourcat_id =   implode(", ", $arr_tourcat_id);
#
// list danh mục travel style từ bảng chính default_tour_category
$list_travel_style  =   $clsTourCategory->getAll("is_trash = 0 AND is_online = 1 AND tourcat_id IN (" . $str_tourcat_id . ") ORDER BY order_no ASC LIMIT 10", "tourcat_id");
$smarty->assign('list_travel_style', $list_travel_style);
