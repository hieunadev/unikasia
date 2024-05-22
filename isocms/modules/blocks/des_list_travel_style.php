<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsTourCategory =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);

$list_travel_style  =   $clsTourCategory->getAll("is_trash = 0 AND is_online = 1 ORDER BY order_no ASC LIMIT 10");
$smarty->assign('list_travel_style', $list_travel_style);
