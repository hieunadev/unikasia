<?php
global $core, $smarty, $clsISO;

$clsCountry =   new Country();
$smarty->assign("clsCountry", $clsCountry);
if (!empty($_GET['slug_country'])) {
    $country_id     =   $clsCountry->getBySlug($_GET['slug_country']);
    $info_country   =   $clsCountry->getOne($country_id);
    $cond           =   "is_trash = 0 AND is_online = 1 AND country_id <> $country_id";
} else {
    $cond   =   "is_trash = 0 AND is_online = 1";
}
$orderBy    =   " order by order_no asc";
$limit      =   " LIMIT 20";
$lstCountry =   $clsCountry->getAll("$cond $orderBy $limit");
$smarty->assign("lstCountry", $lstCountry);
