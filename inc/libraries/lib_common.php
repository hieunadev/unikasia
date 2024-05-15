<?php 
	/**
	 * TravelMaster Path Helpers
	 *
	 * @package		TravelMaster
	 * @subpackage	Helpers
	 * @category	Helpers
	 * @author		EllisLab Dev Team
	 * @link		https://codeigniter.com/user_guide/helpers/path_helper.html
	 */
	if ( ! function_exists('is_php'))
	{
		/**
		 * Determines if the current version of PHP is equal to or greater than the supplied value
		 *
		 * @param	string
		 * @return	bool	TRUE if the current version is $version or higher
		 */
		function is_php($version)
		{
			static $_is_php;
			$version = (string) $version;
	
			if ( ! isset($_is_php[$version]))
			{
				$_is_php[$version] = version_compare(PHP_VERSION, $version, '>=');
			}
	
			return $_is_php[$version];
		}
	}
	
	// ------------------------------------------------------------------------
	
	if ( ! function_exists('is_really_writable'))
	{
		/**
		 * Tests for file writability
		 *
		 * is_writable() returns TRUE on Windows servers when you really can't write to
		 * the file, based on the read-only attribute. is_writable() is also unreliable
		 * on Unix servers if safe_mode is on.
		 *
		 * @link	https://bugs.php.net/bug.php?id=54709
		 * @param	string
		 * @return	bool
		 */
		function is_really_writable($file)
		{
			// If we're on a Unix server with safe_mode off we call is_writable
			if (DIRECTORY_SEPARATOR === '/' && (is_php('5.4') OR ! ini_get('safe_mode')))
			{
				return is_writable($file);
			}
	
			/* For Windows servers and safe_mode "on" installations we'll actually
			 * write a file then read it. Bah...
			 */
			if (is_dir($file))
			{
				$file = rtrim($file, '/').'/'.md5(mt_rand());
				if (($fp = @fopen($file, 'ab')) === FALSE)
				{
					return FALSE;
				}
	
				fclose($fp);
				@chmod($file, 0777);
				@unlink($file);
				return TRUE;
			}
			elseif ( ! is_file($file) OR ($fp = @fopen($file, 'ab')) === FALSE)
			{
				return FALSE;
			}
	
			fclose($fp);
			return TRUE;
		}
	}
	
	// ------------------------------------------------------------------------
	
	if ( ! function_exists('is_https'))
	{
		/**
		 * Is HTTPS?
		 *
		 * Determines if the application is accessed via an encrypted
		 * (HTTPS) connection.
		 *
		 * @return	bool
		 */
		function is_https()
		{
			if ( ! empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off')
			{
				return TRUE;
			}
			elseif (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https')
			{
				return TRUE;
			}
			elseif ( ! empty($_SERVER['HTTP_FRONT_END_HTTPS']) && strtolower($_SERVER['HTTP_FRONT_END_HTTPS']) !== 'off')
			{
				return TRUE;
			}
	
			return FALSE;
		}
	}
	
	// ------------------------------------------------------------------------

	if ( ! function_exists('is_cli'))
	{
	
		/**
		 * Is CLI?
		 *
		 * Test to see if a request was made from the command line.
		 *
		 * @return 	bool
		 */
		function is_cli()
		{
			return (PHP_SAPI === 'cli' OR defined('STDIN'));
		}
	}
	
	// ------------------------------------------------------------------------
	
	if ( ! function_exists('html_escape'))
	{
		/**
		 * Returns HTML escaped variable.
		 *
		 * @param	mixed	$var		The input string or array of strings to be escaped.
		 * @param	bool	$double_encode	$double_encode set to FALSE prevents escaping twice.
		 * @return	mixed			The escaped string or array of strings as a result.
		 */
		function html_escape($var, $double_encode = TRUE)
		{
			if (empty($var))
			{
				return $var;
			}
	
			if (is_array($var))
			{
				foreach (array_keys($var) as $key)
				{
					$var[$key] = html_escape($var[$key], $double_encode);
				}
	
				return $var;
			}
	
			return htmlspecialchars($var, ENT_QUOTES, config_item('charset'), $double_encode);
		}
	}
	
	// --------------------------------------------------------------------
	
	if ( ! function_exists('set_status_header'))
	{
		/**
		 * Set HTTP Status Header
		 *
		 * @param	int	the status code
		 * @param	string
		 * @return	void
		 */
		function set_status_header($code = 200, $text = '')
		{
			if (is_cli())
			{
				return;
			}
	
			if (empty($code) OR ! is_numeric($code))
			{
				trigger_error('Status codes must be numeric',E_USER_NOTICE);
			}
	
			if (empty($text))
			{
				is_int($code) OR $code = (int) $code;
				$stati = array(
					100	=> 'Continue',
					101	=> 'Switching Protocols',
	
					200	=> 'OK',
					201	=> 'Created',
					202	=> 'Accepted',
					203	=> 'Non-Authoritative Information',
					204	=> 'No Content',
					205	=> 'Reset Content',
					206	=> 'Partial Content',
	
					300	=> 'Multiple Choices',
					301	=> 'Moved Permanently',
					302	=> 'Found',
					303	=> 'See Other',
					304	=> 'Not Modified',
					305	=> 'Use Proxy',
					307	=> 'Temporary Redirect',
	
					400	=> 'Bad Request',
					401	=> 'Unauthorized',
					402	=> 'Payment Required',
					403	=> 'Forbidden',
					404	=> 'Not Found',
					405	=> 'Method Not Allowed',
					406	=> 'Not Acceptable',
					407	=> 'Proxy Authentication Required',
					408	=> 'Request Timeout',
					409	=> 'Conflict',
					410	=> 'Gone',
					411	=> 'Length Required',
					412	=> 'Precondition Failed',
					413	=> 'Request Entity Too Large',
					414	=> 'Request-URI Too Long',
					415	=> 'Unsupported Media Type',
					416	=> 'Requested Range Not Satisfiable',
					417	=> 'Expectation Failed',
					422	=> 'Unprocessable Entity',
	
					500	=> 'Internal Server Error',
					501	=> 'Not Implemented',
					502	=> 'Bad Gateway',
					503	=> 'Service Unavailable',
					504	=> 'Gateway Timeout',
					505	=> 'HTTP Version Not Supported'
				);
	
				if (isset($stati[$code]))
				{
					$text = $stati[$code];
				}
				else
				{
					trigger_error('No status text available. Please check your status code number or supply your own message text.', E_USER_NOTICE);
				}
			}
	
			if (strpos(PHP_SAPI, 'cgi') === 0)
			{
				header('Status: '.$code.' '.$text, TRUE);
			}
			else
			{
				$server_protocol = isset($_SERVER['SERVER_PROTOCOL']) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.1';
				header($server_protocol.' '.$code.' '.$text, TRUE, $code);
			}
		}
	}
	
	// --------------------------------------------------------------------
	
	if ( ! function_exists('show_error'))
	{
		/**
		 * Error Handler
		 *
		 * This function lets us invoke the exception class and
		 * display errors using the standard error template located
		 * in application/views/errors/error_general.php
		 * This function will send the error page directly to the
		 * browser and exit.
		 *
		 * @param	string
		 * @param	int
		 * @param	string
		 * @return	void
		 */
		function show_error($message, $status_code = 500, $heading = 'An Error Was Encountered')
		{
			$status_code = abs($status_code);
			if ($status_code < 100)
			{
				$exit_status = $status_code + 9; // 9 is EXIT__AUTO_MIN
				if ($exit_status > 125) // 125 is EXIT__AUTO_MAX
				{
					$exit_status = 1; // EXIT_ERROR
				}
	
				$status_code = 500;
			}
			else
			{
				$exit_status = 1; // EXIT_ERROR
			}
			print_r($message);
			exit($exit_status);
		}
	}
	
	// --------------------------------------------------------------------
	
	if ( ! function_exists('show_404'))
	{
		/**
		 * 404 Page Handler
		 *
		 * This function is similar to the show_error() function above
		 * However, instead of the standard error template it displays
		 * 404 errors.
		 *
		 * @param	string
		 * @param	bool
		 * @return	void
		 */
		function show_404($page = '', $log_error = TRUE)
		{
			die( 'Error 404! Not found page: #' . $page );
			exit(4); // EXIT_UNKNOWN_FILE
		}
	}

	// --------------------------------------------------------------------
	
	if ( ! function_exists('log_message'))
	{
		/**
		 * Error Logging Interface
		 *
		 * We use this as a simple mechanism to access the logging
		 * class and send messages to be logged.
		 *
		 * @param	string	the error level: 'error', 'debug' or 'info'
		 * @param	string	the error message
		 * @return	void
		 */
		function log_message($level, $message)
		{
			static $_log;
		}
	}
	
?>