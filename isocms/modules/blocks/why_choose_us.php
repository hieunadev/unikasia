<?php

global $core, $smarty, $mod, $act,$clsISO,$package_id,$deviceType;

$clsWhy = new Why();
$clsPartner = new Partner();
$listWhy = $clsWhy->getAll("is_trash = 0 and is_online = 1 order by order_no ASC limit 3");
$listPartner = $clsPartner->getAll("is_trash = 0 and is_online = 1 order by order_no ASC limit 3");

$smarty->assign('listWhy', $listWhy);
//$smarty->assign('listPartner', $listPartner);

if($clsISO->getCheckActiveModulePackage($package_id,'partner','default','default')){
    $clsPartner = new Partner();$smarty->assign('clsPartner',$clsPartner);
    $lstPartner = $clsPartner->getAll("is_trash=0 and is_online=1 and image<>'' and type='' order by order_no asc", $clsPartner->pkey.",title,image,url");
    $totalProgram=$lstPartner?count($lstPartner):0;
    $TotalListPartner = ceil($totalProgram/6);
    if ($clsISO->getBrowser() == 'phone'){
        $TotalListPartner = ceil($totalProgram/3);
    }
    $smarty->assign("TotalListPartner",$TotalListPartner);
    $smarty->assign("listPartner",$lstPartner);
}

