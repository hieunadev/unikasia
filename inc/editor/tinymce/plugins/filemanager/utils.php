<?php 
if($_SESSION["verify"] != "FileManager4TinyMCE") die('forbiden');
/*
* Create Dir
* @access: public
* @param: string $dir
* Return path
*/
function deleteDir($dir) {
    if (!file_exists($dir)) return true;
    if (!is_dir($dir)) return unlink($dir);
    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') continue;
        if (!deleteDir($dir.DIRECTORY_SEPARATOR.$item)) return false;
    }
    return rmdir($dir);
}
/*
* Create thumbnail
* @access: public
* @param: string $size
* Return void()
*/
function create_img_gd($imgfile, $imgthumb, $newwidth, $newheight="") {
    require_once('php_image_magician.php');  
    $magicianObj = new imageLib($imgfile);
    // *** Resize to best fit then crop
    $magicianObj -> resizeImage($newwidth, $newheight, 'crop');  

    // *** Save resized image as a PNG
    $magicianObj -> saveImage($imgthumb);
}
/*
* Caculator Size
* @access: public
* @param: int $size
* Return number
*/
function makeSize($size) {
	$units = array('B','KB','MB','GB','TB');
	$u = 0;
	while ( (round($size / 1024) > 0) && ($u < 4) ) {
		$size = $size / 1024;
		$u++;
	}
	return (number_format($size, 1, ',', '') . " " . $units[$u]);
}
/*
* Create new folder
* @access: public
* @param: bool $path
* @param bool $path_thumbs
* Return void()
*/
function create_folder($path=false,$path_thumbs=false){
	$oldumask = umask(0); 
	if ($path && !file_exists($path))
		@mkdir($path, 0777); // or even 01777 so you get the sticky bit set 
	if($path_thumbs && !file_exists($path_thumbs)) 
		@mkdir($path_thumbs, 0777); // or even 01777 so you get the sticky bit set 
	umask($oldumask);
}

function replaceSpaceFolder($doc) {
    $doc = str_replace('-&amp;-', '-', $doc);
    $doc = str_replace('&amp;', '-', $doc);
    $str = convertToNormal($doc);
    return $str;
}
function convertToNormal($doc) {
    $str = addslash(html_entity_decode($doc));
    $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
    $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
    $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
    $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
    $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
    $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
    $str = preg_replace("/(đ)/", 'd', $str);
    $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
    $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
    $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
    $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
    $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
    $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
    $str = preg_replace("/(Đ)/", 'D', $str);
    $str = preg_replace("/( )/", '-', $str);
    $str = preg_replace("/(&#39;)/", '', $str);
    $str = preg_replace("/(')/", '', $str);
    $str = preg_replace("/(&#39;|&nbsp;)/", '-', $str);
    $str = stripslash($str);
    return $str;
}
function addslash($doc) {
    return addslashes($doc);
}
function stripslash($doc) {
    return stripslashes($doc);
}
?>