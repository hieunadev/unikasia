<?php

global $core, $smarty, $mod, $act, $clsISO, $package_id, $deviceType, $country_id, $_LANG_ID;
#
$clsCountry = new Country();
$smarty->assign("clsCountry", $clsCountry);
$clsCityStore = new CityStore();
$smarty->assign("clsCityStore", $clsCityStore);
$clsCity = new City();
$smarty->assign("clsCity", $clsCity);
$clsCityStore = new CityStore();
$smarty->assign("clsCityStore", $clsCityStore);
$clsTourDestination = new TourDestination();
$smarty->assign("clsTourDestination", $clsTourDestination);
#
$cond       =   "is_trash = 0 AND type = 'TOP'"; // fix cứng tạm
$orderBy    =   " ORDER BY order_no ASC";
$limit      =   " LIMIT 30";
if (!empty($_GET['slug_country'])) {
    $country_id =  $clsCountry->getBySlug($_GET['slug_country']);
    $smarty->assign("country_id", $country_id);
    $cond       .=  " AND country_id = $country_id";
}
$listSelected   =   $clsCityStore->getAll($cond . $orderBy);
$smarty->assign('listSelected', $listSelected);
