<?php
global $smarty,$core, $mod, $act, $_LANG_ID,$clsISO;

$clsProperty=new Property();$smarty->assign('clsProperty',$clsProperty);
$clsHotel=new Hotel();$smarty->assign('clsHotel',$clsHotel);
$listHotelFacilitiesFavorite=$clsProperty->getAll("is_trash=0 and type='HotelFacilities' and is_favorite=1 order by order_no ASC",$clsProperty->pkey);
$smarty->assign('listHotelFacilitiesFavorite',$listHotelFacilitiesFavorite);
$listHotelFacilitiesOther=$clsProperty->getAll("is_trash=0 and type='HotelFacilities' and is_favorite=0 order by order_no ASC",$clsProperty->pkey);
$smarty->assign('listHotelFacilitiesOther',$listHotelFacilitiesOther);
?>