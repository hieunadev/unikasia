<?php
$sub = isset($stdio) ? $stdio-&gt;GET("sub", "default") : "default";
$act = isset($stdio) ? $stdio-&gt;GET("act", "default") : "default";
$tmp = explode('/', __FILE__);
$clsModule = new Module($tmp[count($tmp) - 2]);

$clsModule-&gt;run($sub, $act);
$assign_list["sub"] = $sub;
$assign_list["act"] = $act;

if (!$core-&gt;checkActiveModule('customised')) {
    header('Location:/');
    exit();
}

$clsISO = new ISO();
if (!$clsISO-&gt;getCheckActiveModulePackage($package_id, $mod, 'default', 'default')) {
    header('Location:/');
    exit();
}
?>