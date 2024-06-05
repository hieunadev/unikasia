<?
global $core, $smarty, $clsISO, $assign_list;
#
$smarty->assign('clsISO', $clsISO);
#
$clsGuideCat    =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
$clsTour    =   new Tour();
$smarty->assign('clsTour', $clsTour);
#
$show   =   isset($_GET['show']) ? $_GET['show'] : '';
$assign_list['show']    =   $show;
#
// ID của danh mục trvg từ quốc gia
$guidecat_id =   isset($_GET['guidecat_id']) ? $_GET['guidecat_id'] : '';
$smarty->assign('guidecat_id', $guidecat_id);
// Slug của danh mục trvg từ quốc gia
$slug_guidecat =   isset($_GET['slug_guidecat']) ? $_GET['slug_guidecat'] : '';
$smarty->assign('slug_guidecat', $slug_guidecat);
#
$url_banner =   '';
$cond       =   'is_trash = 0 AND is_online = 1';
$limit      =   ' LIMIT 1';
if (!empty($guidecat_id)) {
    $cond   .=  ' AND guidecat_id = ' . $guidecat_id;
    #
    // Mảng dữ liệu của danh mục trvg từ quốc gia
    $trvg_info  =   $clsGuideCat->getAll($cond . $limit, 'banner');
    $smarty->assign('trvg_info', $trvg_info);
    #
    $url_banner .=   $trvg_info[0]['banner'];
}
$smarty->assign('url_banner', $url_banner);
