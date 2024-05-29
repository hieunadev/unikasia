<?php

global $core, $smarty, $mod, $act, $clsISO, $package_id, $deviceType, $country_id;


$clsCountry = new Country();
$smarty->assign("clsCountry", $clsCountry);
$clsCityStore = new CityStore();
$smarty->assign("clsCityStore", $clsCityStore);
$classTable = "City";
$clsClassTable = new $classTable;
$smarty->assign("clsClassTable", $clsClassTable);

$sql_select = "is_trash = 0 and type = 'TOP' and country_id = $country_id"; // fix cứng tạm
$orderBy_selected = " order by order_no ASC  limit 6";
$listSelected =  $clsCityStore->getAll( $sql_select.$orderBy_selected);

$smarty->assign('listSelected', $listSelected);