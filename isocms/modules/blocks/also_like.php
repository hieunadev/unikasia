<?php

global $core, $smarty;

$clsCountry = new Country();
$cond = "1=1";
$orderBy = " order by order_no asc";
$limit = " LIMIT 20";
$lstCountry = $clsCountry->getAll("$cond $orderBy $limit");
$smarty->assign("lstCountry", $lstCountry);