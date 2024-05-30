<?php
global $smarty, $clsISO, $core, $clsTable, $mod;
#
$clsTourStore       =   new TourStore();
$smarty->assign('clsTourStore', $clsTourStore);
$clsTour            =   new Tour();
$smarty->assign('clsTour', $clsTour);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsTourDestination = new TourDestination();
$smarty->assign('clsTourDestination', $clsTourDestination);

#
if ($mod === 'destination' || $mod === 'tour') {
    $limit  =   ' LIMIT 9';
} else {
    $limit  =   ' LIMIT 6';
}
#
// ID của danh mục trvs từ quốc gia
$cat_id =   isset($_GET['cat_id']) ? $_GET['cat_id'] : '';
$cond   =   "is_trash = 0 AND is_online = 1";
// $cond2  =   "is_trash = 0 AND is_online = 1";
#
if ($mod === 'tour') {
    /** --- Code show danh sách tour theo trvs by country --- **/
    if ($cat_id > 0) {
        $listTourCategory    =     $clsTourCategory->getAll("is_trash = 0 AND is_online = 1 AND parent_id = '$cat_id'", $clsTourCategory->pkey);
        #
        if ($listTourCategory != '') {
            $parent_id  =   $cat_id;
            $cond       .=  " AND (cat_id = '$cat_id' OR list_cat_id LIKE '%|" . $cat_id . "|%' OR cat_id IN (SELECT tourcat_id FROM " . DB_PREFIX . "tour_category WHERE parent_id = '$parent_id'))";
        } else {
            $cond       .=  " AND (cat_id='$cat_id' OR list_cat_id LIKE '%|$cat_id|%')";
        }
    }
    $order_by   =   " ORDER BY order_no ASC";
    #
    $listTourExplore    =   $clsTour->getAll($cond . $order_by . $limit, $clsTour->pkey . ", tour_id");
    $smarty->assign('listTourExplore', $listTourExplore);
    /** --- End of Code show danh sách tour theo trvs by country --- **/
} else {
    $listTourExplore    =   $clsTourStore->getAll("is_trash=0 and _type = 'TOPTOUR' order by order_no asc $limit");
    $smarty->assign('listTourExplore', $listTourExplore);
}
