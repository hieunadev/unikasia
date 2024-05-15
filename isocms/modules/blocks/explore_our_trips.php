<?php

global $smarty, $clsISO, $core, $clsTable, $mod;

$clsTourStore = new TourStore();
$clsClassTable = new Tour();
$listSelected = $clsTourStore->getAll("is_trash=0 and _type = 'TOPTOUR' order by order_no asc limit 6");
$smarty->assign('listTourExplore', $listSelected);
$smarty->assign('clsClassTable', $clsClassTable);




