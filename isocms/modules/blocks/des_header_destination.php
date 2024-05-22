<?
global $core, $smarty, $clsISO, $assign_list;
#
$assign_list["clsISO"]  =   $clsISO;
#
$clsCountry =   new Country();
$assign_list["clsCountry"]  =   $clsCountry;
#
if (!empty($_GET['slug_country'])) {
    $id_country     =   $clsCountry->getBySlug($_GET['slug_country']);
    $info_country   =   $clsCountry->getOne($id_country);
    $smarty->assign('info_country', $info_country);
    #
    $url_banner     =   $info_country['image'];
    $smarty->assign('url_banner', $url_banner);
}

// $clsISO->dd($url_banner);
