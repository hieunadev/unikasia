<?php
function default_default(){
	global $assign_list, $_CONFIG,  $_SITE_ROOT, $mod , $_LANG_ID, $act,$core, $clsModule, $clsButtonNav,$oneSetting;
	#
	$customClsArray = array();
	if (is_dir($_SERVER['DOCUMENT_ROOT'].'/lang')){
		if ($dh = opendir($_SERVER['DOCUMENT_ROOT'].'/lang')) {
			while (($file = readdir($dh)) !== false) {
				if (substr($file, -3)=='php')
				array_push($customClsArray, str_replace('.php','',$file));
			}
			closedir($dh);
		}	
	}
	$assign_list["listLang"] = $customClsArray;
}

function default_edit(){
	global $assign_list, $_CONFIG,  $_SITE_ROOT, $mod , $_LANG_ID, $act,$oneSetting,$core, $clsModule, $_loged_id;
	#
	$string = isset($_GET['lang_id'])? ($_GET['lang_id']) : '';
	$lang = $core->decryptID($string); 
	$assign_list["langid"] = $lang;

	#
	$dir = $_SERVER['DOCUMENT_ROOT'].'/lang/'.$lang.'.php';
	$lang = file_get_contents($dir);
	$lang = str_replace('<?php
if (!defined("PCMS_DIR")) die("File này không thể truy cập trực tiếp");
global $_FRONTLANG;','',$lang);
	$lang = str_replace(' = ',"=",$lang);
				$lang = str_replace('

',"
",$lang);
	$lang = str_replace('
?>','',$lang);
	$lang = str_replace('
','',$lang);
	$lang = str_replace(';$_FRONTLANG','|||',$lang);
	$lang = str_replace('$_FRONTLANG','',$lang);
	$listLangItem = explode('|||',$lang);
	$lstItem = array();
	for($i=0;$i<count($listLangItem);$i++){
		$tmp = $listLangItem[$i].'|||';
		$tmp = str_replace('["','',$tmp);
		$tmp = str_replace('"|||','',$tmp);
		$tmp = str_replace('"]="','|||',$tmp);
		$item = explode('|||',$tmp);
		$val = array();
		$val['key'] = $item[0];
		$val['value'] = $item[1];
		$lstItem[] = $val;
	}
	$assign_list["lstItem"] = $lstItem;
	$lang_permission = substr(sprintf('%o', fileperms($dir)), -4);
	$assign_list["lang_permission"] = $lang_permission;
	if(isset($_POST['submit'])){
		if($_POST['submit']=='Updatelang'){
			$key = $_POST['key'];
			$value = $_POST['value'];
			$lang_content = '<?php
if (!defined("PCMS_DIR")) die("File này không thể truy cập trực tiếp");
global $_FRONTLANG;
';
			for($i=0;$i<count($key);$i++){
				if($key[$i]!=''){
					$val = str_replace('&#33;','!',$value[$i]);
					$val = str_replace('"','&quot;',$value[$i]);
					$lang_content .= '
$_FRONTLANG["'.str_replace('"','&quot;',$key[$i]).'"]="'.$val.'";';
				}
			}
			$lang_content .= "
?>";

			$core->writeFile($dir,$lang_content);
			header('location: '.PCMS_URL.'/?mod='.$mod.'&act=edit&lang_id&lang_id='.$string.'&message=UpdateSuccess');
		}
	}
}
function default_delete(){
	global $assign_list, $_CONFIG,  $_SITE_ROOT, $mod, $act,$core, $clsModule;
	$user_id = $core->_USER['user_id'];
	
	$classTable = "AdminButton";
	$clsClassTable = new $classTable;
	$tableName = $clsClassTable->tbl;
	$pkeyTable = $clsClassTable->pkey ;
	
	$string = isset($_GET[$pkeyTable])? ($_GET[$pkeyTable]) : '';
	$pvalTable = intval($core->decryptID($string)); 

	if($pvalTable == 0||$string=='') 
		header('location: '.PCMS_URL.'/?admin&mod='.$mod);
	
	if($clsClassTable->deleteOne($pvalTable)){
		header('location: '.PCMS_URL.'/?admin&mod='.$mod.'&message=DeleteSuccess');
	}
}

function default_ajAddLang() {
    global $assign_list, $_CONFIG,  $_SITE_ROOT, $mod , $_LANG_ID, $act,$oneSetting,$core, $clsModule, $_loged_id;
    #
    $string = $_POST['lang_id'] ?? '';
    $lang = $core->decryptID($string);
    $dir = $_SERVER['DOCUMENT_ROOT'].'/lang/'.$lang.'.php';
    $text = $_POST["text"] ?? "";
    $array = explode(', ', $text);

    $current_content = file($dir, FILE_IGNORE_NEW_LINES);
    $keys = array_map(function($line) {
        return preg_match('/\$_FRONTLANG\["([^"]+)"\]/', $line, $matches) ? $matches[1] : null;
    }, $current_content);
    $filtered_keys = array_filter($keys);
    foreach ($array as $value) {
        $value = trim($value);
        if(!empty($value) && !in_array($value, $filtered_keys)) {
            $content .= '$_FRONTLANG["' . $value . '"]="' . translate($value) . '";' . PHP_EOL;
        }
    }

    if (count($current_content) >= 5) {
        array_splice($current_content, 4, 0, $content);
    } else {
        while (count($current_content) < 4) {
            $current_content[] = "";
        }
        $current_content[] = $content;
    }
    $file = fopen($dir, 'w');
    if ($file) {
        fwrite($file, implode("\n", $current_content));
        fclose($file);
    }
    header('location: '.PCMS_URL.'/?mod='.$mod.'&act=edit&lang_id&lang_id='.$string.'&message=UpdateSuccess');
}

function translate($text)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://translate.googleapis.com/translate_a/single?client=gtx&dt=t',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => 'sl=en&tl=fr&q=' . urlencode($text),
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/x-www-form-urlencoded'
        ),
    ));
    $response = curl_exec($curl);
    curl_close($curl);

    $sentencesArray = json_decode($response, true);
    $sentences = "";
    foreach ($sentencesArray[0] as $s) {
        $sentences .= isset($s[0]) ? $s[0] : '';
    }

    return $sentences;
}


?>