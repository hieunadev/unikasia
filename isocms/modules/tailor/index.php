<?php $sub = $stdio->GET("sub", "default");$act = $stdio->GET("act", "default");$tmp = explode('/',__FILE__);$clsModule = new Module($tmp[count($tmp)-2]);$clsModule->run($sub, $act); $assign_list["sub"] = $sub;$assign_list["act"] = $act;
$clsISO = new ISO();
if(!$clsISO->getCheckActiveModulePackage($package_id,'booking','booking_tailor','default')){
	header('Location:/');
	exit();
}
?>