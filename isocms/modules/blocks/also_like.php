<?php

global $core, $smarty;

$clsCountry =   new Country();
if (!empty($_GET['slug_country'])) {
    $id_country     =   $clsCountry->getBySlug($_GET['slug_country']);
    $info_country   =   $clsCountry->getOne($id_country);
    $cond           =   "is_trash = 0 AND is_online = 1 AND country_id <> $id_country";
} else {
    $cond   =   "is_trash = 0 AND is_online = 1";
}
$orderBy    =   " order by order_no asc";
$limit      =   " LIMIT 20";
$lstCountry =   $clsCountry->getAll("$cond $orderBy $limit");
$smarty->assign("lstCountry", $lstCountry);
