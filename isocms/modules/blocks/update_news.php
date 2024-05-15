<?php

global $core, $smarty, $mod, $act, $clsISO;

$clsClassTable = new Blog();
$lstBlog = $clsClassTable->getAll("1=1 and is_approve=1 order by order_no asc limit 6");
$assign_list["lstBlog"] = $lstBlog;
$smarty->assign("lstBlog", $lstBlog);