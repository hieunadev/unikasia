<?php
	//start session
	session_start();
	/*ini_set('display_errors',1);
	error_reporting(E_ALL);*/
	define("PCMS_DIR", $_SERVER['DOCUMENT_ROOT']);
	define("PCMS_URL", 'http://'.$_SERVER['HTTP_HOST']);
	define("DIR_INCLUDES", 	PCMS_DIR."/inc");
	define("DIR_ISOCMS", 	PCMS_DIR."/isocms");
	define("DIR_LANG", 		DIR_ISOCMS."/lang");
	define("DIR_BLOCKS", 	DIR_ISOCMS."/blocks");
	define("DIR_THEMES", 	PCMS_DIR."/isocms/skin");
	define("DIR_MODULES", 	PCMS_DIR."/isocms/modules");
	define("DIR_CLASSES", 	PCMS_DIR."/classes");
	define("DIR_SMARTY", 	DIR_INCLUDES."/smarty");
	define("DIR_COMMON", 	DIR_INCLUDES."/iso");
	define("DIR_ADODB", 	DIR_INCLUDES."/adodb5");
	define("DIR_MAILER", 	DIR_INCLUDES."/mailer");
	
	require_once(PCMS_DIR.'/config.php');
	require_once DIR_ADODB. '/adodb.inc.php';
	require_once DIR_COMMON . '/clsDbBasic.php';
	require_once DIR_COMMON . '/clsCore.php';
	#
	$dbconn = &ADONewConnection(DB_TYPE);
	if (isset($dbinfo) && is_array($dbinfo)){
		$dbconn->Connect($dbinfo['host'], $dbinfo['user'], $dbinfo['pass'], $dbinfo['db']);
	}else{
		$dbconn->Connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
	}
	#
	require_once DIR_CLASSES . '/class_ISO.php';
	require_once DIR_CLASSES . '/class_Profile.php';
	require_once DIR_CLASSES . '/class_Configuration.php';
	#
	require_once(DIR_INCLUDES."/oauth/twiter/twitteroauth.php");
	$_return_url = isset($_SESSION['_return_url']) ? $_SESSION['_return_url'] : '/';
	#
	if(isset($_REQUEST['oauth_token']) && $_SESSION['token']  !== $_REQUEST['oauth_token']) {
		
		//If token is old, distroy session and redirect user to index.php
		session_destroy();
		header('Location:'.$_return_url);
	}
	elseif(isset($_REQUEST['oauth_token']) && $_SESSION['token'] == $_REQUEST['oauth_token']) {
		
		//Successful response returns oauth_token, oauth_token_secret, user_id, and screen_name
		$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $_SESSION['token'] , $_SESSION['token_secret']);
		$access_token = $connection->getAccessToken($_REQUEST['oauth_verifier']);
		#
		if($connection->http_code == '200'){
			
			//Redirect user to twitter
			$_SESSION['status'] = 'verified';
			$_SESSION['request_vars'] = $access_token;
			
			//Insert user into the database
			$user_info = $connection->get('account/verify_credentials');
			$clsProfile = new Profile();
			if($clsProfile->userLoggedInTwitter($user_info)){
				
				//Unset no longer needed request tokens
				unset($_SESSION['token']);
				unset($_SESSION['token_secret']);
				header('Location:'.$_return_url);
				exit();
			}
			else{
				
				//Unset no longer needed request tokens
				unset($_SESSION['token']);
				unset($_SESSION['token_secret']);
				header('Location:/login-invalid/');
				exit();
			}
		}else{
			die("Error, Try again later!");
		}
	}else{
		if(isset($_GET["denied"])){
			header('Location:'.$_return_url);
			die();
		}
		
		//Fresh authentication
		$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET);
		$request_token = $connection->getRequestToken(OAUTH_CALLBACK);
		
		//Received token info from twitter
		$_SESSION['token'] 			= $request_token['oauth_token'];
		$_SESSION['token_secret'] 	= $request_token['oauth_token_secret'];
		
		//Any value other than 200 is failure, so continue only if http code is 200
		if($connection->http_code == '200'){
			//redirect user to twitter
			$twitter_url = $connection->getAuthorizeURL($request_token['oauth_token']);
			header('Location: ' . $twitter_url); 
		}else{
			die("Error connecting to twitter! try again later!");
		}
	}
?>