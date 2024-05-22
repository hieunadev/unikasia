<?php

global $smarty, $clsISO, $core, $clsTable, $mod;

$clsTourStore   =   new TourStore(); $smarty->assign('clsTourStore', $clsTourStore);
$clsClassTable  =   new Tour();  $smarty->assign('clsTour', $clsClassTable);

if ($mod    ===  'destination') {
    $limit  =   9;
} else {
    $limit  =   6;
}

$listSelected = $clsTourStore->getAll("is_trash=0 and _type = 'TOPTOUR' order by order_no asc LIMIT $limit");
$smarty->assign('listTourExplore', $listSelected);
$smarty->assign('clsClassTable', $clsClassTable);
