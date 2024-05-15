<?php
/**
*  Created by   :
*  @author		: Technical Group
*  @date		: 2009/1/18
*  @version		: 2.1.1
*/
if ( ! function_exists('read_file')){
	/**
	 * Read File
	 *
	 * Opens the file specified in the path and returns it as a string.
	 *
	 * @todo	Remove in version 3.1+.
	 * @deprecated	3.0.0	It is now just an alias for PHP's native file_get_contents().
	 * @param	string	$file	Path to file
	 * @return	string	File contents
	 */
	function read_file($file){
		$content = @file_get_contents($file);
		if($content===FALSE){
			$content = _read_file($file);
		}
		return $content;
	}	
	function _read_file($file){
		$handle = fopen ($file, "rb");
		$contents = "";
		do {
			$data = fread($handle, 8192);
			if (strlen($data) == 0) {
			   break;
		   }
		   $contents .= $data;
		} while(true);
		fclose ($handle);
		return $contents;
	}
}
if ( ! function_exists('save_file')){
	function save_file($file,$content,$append=0,$binary=0){
		if($binary){
			$b = 'b';
		} else {
			$b= 't';
		}
		if($append) {
			$mode = "a$b";
		} else {
			$mode = "w$b";
		}
		$fp = @fopen($file,$mode);
		$err = '';
		if($fp) {
			fwrite($fp,$content);
			fclose($fp);
			//@chmod($file, 0666);
		} else {
			$err = " Can't write file $file. Check file/directory permissions.";
		}
		return $err;
	}
}
if ( ! function_exists('write_file')){
	/**
	 * Write File
	 * Writes data to the file specified in the path.
	 * Creates a new file if non-existent.
	 *
	 * @param	string	$path	File path
	 * @param	string	$data	Data to write
	 * @param	string	$mode	fopen() mode (default: 'wb')
	 * @return	bool
	 */
	function write_file($path, $data, $mode = 'wb'){
		if ( ! $fp = @fopen($path, $mode))	{
			return FALSE;
		}
		flock($fp, LOCK_EX);

		for ($result = $written = 0, $length = strlen($data); $written < $length; $written += $result){
			if (($result = fwrite($fp, substr($data, $written))) === FALSE){
				break;
			}
		}
		flock($fp, LOCK_UN);
		fclose($fp);
		return is_int($result);
	}
}
if ( ! function_exists('get_size')){
	function get_size($size) {//bytes
		$kb = 1024;
		$mb = 1024 * $kb;
		$gb = 1024 * $mb;
		$tb = 1024 * $gb;
		if ($size < $kb) {
			$file_size = "$size Bytes";
		}
		elseif ($size < $mb) {
			$final = round($size/$kb,2);
			$file_size = "$final KB";
		}
		elseif ($size < $gb) {
			$final = round($size/$mb,2);
			$file_size = "$final MB";
		}
		elseif($size < $tb) {
			$final = round($size/$gb,2);
			$file_size = "$final GB";
		} else {
			$final = round($size/$tb,2);
			$file_size = "$final TB";
		}
		return $file_size;
	}
}
if (!function_exists('file_put_contents')) {
	function file_put_contents($filename="", $str){
		if (is_writable($filename)) {
			$fp = fopen($filename, "w");
			fwrite($fp, $str);
			fclose($fp);
			return 1;
		}else{
			return 0;
		}
	}	
}
if (!function_exists('file_get_contents')) {
	function file_get_contents($filename=""){
		$fp = fopen($filename, "w");
		$str = fread($fp, filesize($filename));
		fclose($fp);
		return $str;
	}	
}
function getDirectory($dir){
	$arr = "";
	if ($handle = opendir($dir)) {
		while (false !== ($file = readdir($handle))) {
			if ($file != "." && $file != ".." && is_dir($dir."/".$file)){
				$arr[] = $file;
			}
		}
		closedir($handle);
	}
	return $arr;
}
if ( ! function_exists('delete_files')){
	/**
	 * Delete Files
	 * Deletes all files contained in the supplied directory path.
	 * Files must be writable or owned by the system in order to be deleted.
	 * If the second parameter is set to TRUE, any directories contained
	 * within the supplied base directory will be nuked as well.
	 *
	 * @param	string	$path		File path
	 * @param	bool	$del_dir	Whether to delete any directories found in the path
	 * @param	bool	$htdocs		Whether to skip deleting .htaccess and index page files
	 * @param	int	$_level		Current directory depth level (default: 0; internal use only)
	 * @return	bool
	 */
	function delete_files($path, $del_dir = FALSE, $htdocs = FALSE, $_level = 0){
		// Trim the trailing slash
		$path = rtrim($path, '/\\');
		if ( ! $current_dir = @opendir($path)){
			return FALSE;
		}

		while (FALSE !== ($filename = @readdir($current_dir))){
			if ($filename !== '.' && $filename !== '..'){
				if (is_dir($path.DIRECTORY_SEPARATOR.$filename) && $filename[0] !== '.'){
					delete_files($path.DIRECTORY_SEPARATOR.$filename, $del_dir, $htdocs, $_level + 1);
				}
				elseif ($htdocs !== TRUE OR ! preg_match('/^(\.htaccess|index\.(html|htm|php)|web\.config)$/i', $filename)){
					@unlink($path.DIRECTORY_SEPARATOR.$filename);
				}
			}
		}
		closedir($current_dir);
		return ($del_dir === TRUE && $_level > 0)
			? @rmdir($path)
			: TRUE;
	}
}
if ( ! function_exists('get_file_info'))
{
	/**
	 * Get File Info
	 *
	 * Given a file and path, returns the name, path, size, date modified
	 * Second parameter allows you to explicitly declare what information you want returned
	 * Options are: name, server_path, size, date, readable, writable, executable, fileperms
	 * Returns FALSE if the file cannot be found.
	 *
	 * @param	string	path to file
	 * @param	mixed	array or comma separated string of information returned
	 * @return	array
	 */
	function get_file_info($file, $returned_values = array('name', 'server_path', 'size', 'date'))
	{
		if ( ! file_exists($file))
		{
			return FALSE;
		}

		if (is_string($returned_values))
		{
			$returned_values = explode(',', $returned_values);
		}

		foreach ($returned_values as $key)
		{
			switch ($key)
			{
				case 'name':
					$fileinfo['name'] = basename($file);
					break;
				case 'server_path':
					$fileinfo['server_path'] = $file;
					break;
				case 'size':
					$fileinfo['size'] = filesize($file);
					break;
				case 'date':
					$fileinfo['date'] = filemtime($file);
					break;
				case 'readable':
					$fileinfo['readable'] = is_readable($file);
					break;
				case 'writable':
					$fileinfo['writable'] = is_really_writable($file);
					break;
				case 'executable':
					$fileinfo['executable'] = is_executable($file);
					break;
				case 'fileperms':
					$fileinfo['fileperms'] = fileperms($file);
					break;
			}
		}

		return $fileinfo;
	}
}
// --------------------------------------------------------------------
if ( ! function_exists('get_mime_by_extension')){
	/**
	 * Get Mime by Extension
	 * Translates a file extension into a mime type based on config/mimes.php.
	 * Returns FALSE if it can't determine the type, or open the mime config file
	 *
	 * Note: this is NOT an accurate way of determining file mime types, and is here strictly as a convenience
	 * It should NOT be trusted, and should certainly NOT be used for security
	 *
	 * @param	string	$filename	File name
	 * @return	string
	 */
	function get_mime_by_extension($filename){
		static $mimes;
		if ( ! is_array($mimes)){
			$mimes = get_mimes();
			if (empty($mimes)){
				return FALSE;
			}
		}
		$extension = strtolower(substr(strrchr($filename, '.'), 1));
		if (isset($mimes[$extension])){
			return is_array($mimes[$extension])
				? current($mimes[$extension]) // Multiple mime types, just give the first one
				: $mimes[$extension];
		}
		return FALSE;
	}
}
// --------------------------------------------------------------------
if ( ! function_exists('symbolic_permissions')){
	/**
	 * Symbolic Permissions
	 * Takes a numeric value representing a file's permissions and returns
	 * standard symbolic notation representing that value
	 *
	 * @param	int	$perms	Permissions
	 * @return	string
	 */
	function symbolic_permissions($perms){
		if (($perms & 0xC000) === 0xC000){
			$symbolic = 's'; // Socket
		}
		elseif (($perms & 0xA000) === 0xA000){
			$symbolic = 'l'; // Symbolic Link
		}
		elseif (($perms & 0x8000) === 0x8000){
			$symbolic = '-'; // Regular
		}
		elseif (($perms & 0x6000) === 0x6000){
			$symbolic = 'b'; // Block special
		}
		elseif (($perms & 0x4000) === 0x4000){
			$symbolic = 'd'; // Directory
		}
		elseif (($perms & 0x2000) === 0x2000){
			$symbolic = 'c'; // Character special
		}
		elseif (($perms & 0x1000) === 0x1000){
			$symbolic = 'p'; // FIFO pipe
		}
		else{
			$symbolic = 'u'; // Unknown
		}
		// Owner
		$symbolic .= (($perms & 0x0100) ? 'r' : '-')
			.(($perms & 0x0080) ? 'w' : '-')
			.(($perms & 0x0040) ? (($perms & 0x0800) ? 's' : 'x' ) : (($perms & 0x0800) ? 'S' : '-'));

		// Group
		$symbolic .= (($perms & 0x0020) ? 'r' : '-')
			.(($perms & 0x0010) ? 'w' : '-')
			.(($perms & 0x0008) ? (($perms & 0x0400) ? 's' : 'x' ) : (($perms & 0x0400) ? 'S' : '-'));

		// World
		$symbolic .= (($perms & 0x0004) ? 'r' : '-')
			.(($perms & 0x0002) ? 'w' : '-')
			.(($perms & 0x0001) ? (($perms & 0x0200) ? 't' : 'x' ) : (($perms & 0x0200) ? 'T' : '-'));

		return $symbolic;
	}
}
// --------------------------------------------------------------------
if ( ! function_exists('octal_permissions')){
	/**
	 * Octal Permissions
	 * Takes a numeric value representing a file's permissions and returns
	 * a three character string representing the file's octal permissions
	 *
	 * @param	int	$perms	Permissions
	 * @return	string
	 */
	function octal_permissions($perms){
		return substr(sprintf('%o', $perms), -3);
	}
}
?>