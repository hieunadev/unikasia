<?php

global $core, $smarty, $mod, $act;

$clsBlog = new Blog(); $smarty->assign("clsBlog", $clsBlog);
$clsBlogCat = new BlogCategory();  $smarty->assign("clsBlogCat", $clsBlogCat);
$clsCountry         =   new Country();
$smarty->assign('clsCountry', $clsCountry);

$slug_country   =    $_GET['slug_country'] ?? "";
$smarty->assign('slug_country', $slug_country);
$country_id     =    $clsCountry->getBySlug($slug_country);
$smarty->assign('country_id', $country_id);
$cond = "";
if ($country_id) {
    $cond = "and country_id = $country_id";
}
$lstBlog = $clsBlog->getAll("is_trash = 0 and is_online = 1 $cond and is_approve=1 order by order_no asc limit 6");

$smarty->assign("lstBlog", $lstBlog);