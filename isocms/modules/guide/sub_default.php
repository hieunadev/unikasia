<?php
function default_default()
{
	global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $keyword_page, $city_id;
	global $clsISO;
	#
	$currentPage = false;
	$show = isset($_GET['show']) ? $_GET['show'] : '';
	$assign_list["show"] = $show;

	$clsCountryEx = new Country();
	$assign_list['clsCountryEx'] = $clsCountryEx;
	$clsGuide = new Guide();
	$assign_list["clsGuide"] = $clsGuide;
	$clsGuideCat = new GuideCat();
	$assign_list["clsGuideCat"] = $clsGuideCat;
	$clsGuideCatStore = new GuideCatStore();
	$assign_list["clsGuideCatStore"] = $clsGuideCatStore;

	$clsPagination = new Pagination();
	#
	$slug_country = $_GET['slug_country'];
	$country_id = $clsCountryEx->getBySlug($slug_country);
	if (intval($country_id) == 0 && $clsCountryEx->checkExitsId($country_id) == '0') {
		header('location:' . PCMS_URL);
		exit();
	}
	$assign_list['country_id'] = $country_id;
	#
	if ($show == 'cat') {
		$slug = $_GET['slug'];
		$all = $clsGuideCat->getAll("is_trash=0 and is_online=1 and parent_id=0 and slug='$slug' LIMIT 0,1", $clsGuideCat->pkey);
		$guidecat_id = $all[0][$clsGuideCat->pkey];
		if (intval($guidecat_id) == 0) {
			header('location:' . PCMS_URL);
			exit();
		}
		$assign_list["guidecat_id"] = $guidecat_id;
		$nav = $clsGuideCat->getNAV($guidecat_id);
		$assign_list["nav"] = $nav;
		unset($nav);
	}
	#
	$currentPage = isset($_GET['page']) ? $_GET['page'] : 1;
	$assign_list['currentPage'] = $currentPage;
	$recordPerPage = 12;
	$assign_list['recordPerPage'] = $recordPerPage;

	$cond = "is_trash=0 and is_online=1 and country_id = '$country_id'";
	if ($guidecat_id > 0) {
		$cond .= " and (cat_id='$guidecat_id' or list_cat_id like '%|" . $guidecat_id . "|%')";
	}
	$order_by = " order by order_no ASC";
	$totalRecord = $clsGuide->getAll($cond) ? count($clsGuide->getAll($cond)) : 0;

	$link_page = $clsGuideCat->getLink($guidecat_id, $country_id, 0);
	$config = array(
		'total'	=> $totalRecord,
		'number_per_page'	=> $recordPerPage,
		'current_page'	=> $currentPage,
		'link'	=> str_replace('.html', '/', $link_page),
		'link_page_1'	=> $link_page
	);
	$clsPagination->initianize($config);
	$page_view = $clsPagination->create_links(false);

	$offset = ($currentPage - 1) * $recordPerPage;
	$limit = " LIMIT $offset,$recordPerPage";

	$listGuide = $clsGuide->getAll($cond . $order_by . $limit, $clsGuide->pkey);
	$assign_list['listGuide'] = $listGuide;
	unset($listGuide);
	$assign_list['page_view'] = $page_view;
	unset($page_view);
	$assign_list['totalPage'] = $clsPagination->getTotalPage();

	/* =============Title & Description Page================== */
	$title_page = $core->get_Lang('travelguide') . ' | ' . PAGE_NAME;
	$assign_list["title_page"] = $title_page;
	$description_page = $title_page;
	$assign_list["description_page"] = $description_page;
	$keyword_page = $title_page;
	$assign_list["keyword_page"] = $keyword_page;
	/* =============Content Page================== */
	unset($clsCountryEx);
}
function default_cat()
{
	global $assign_list, $smarty, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $global_image_seo_page, $city_id;
	global $clsISO;
	#
	$clsCountry	=   new Country();
	$smarty->assign('clsCountry', $clsCountry);
	$clsGuideCat	=   new GuideCat();
	$smarty->assign('clsGuideCat', $clsGuideCat);
	$clsGuideCatStore	=   new GuideCatStore();
	$smarty->assign('clsGuideCatStore', $clsGuideCatStore);
	$clsGuide	= 	new Guide();
	$smarty->assign('clsGuide', $clsGuide);
	$clsPagination	= 	new Pagination();
	#	
	$trvg_intro	=	'';
	$show		=	isset($_GET['show']) ? $_GET['show'] : '';
	if ($show === 'Country') {
		$guidecat_slug	=   '';
		$guidecat_id    =   0;
		$country_slug  	=   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
		$country_id 	= 	$clsCountry->getBySlug($country_slug);
		if (intval($country_id) == 0 && $clsCountry->checkExitsId($country_id) == '0') {
			header('location:' . PCMS_URL);
			exit();
		}
	} elseif ($show === 'GuideCat') {
		$guidecat_slug	=   isset($_GET['slug_guidecat']) ? $_GET['slug_guidecat'] : '';
		$guidecat_id    =   isset($_GET['guidecat_id']) ? $_GET['guidecat_id'] : 0;
		$country_slug  	=   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
		$country_id 	= 	$clsCountry->getBySlug($country_slug);
		if (intval($guidecat_id) == 0) {
			header('location:' . PCMS_URL);
			exit();
		}
		$trvg_intro	.=	$clsGuideCatStore->getContent($guidecat_id, $country_id);
	}
	$smarty->assign('country_id', $country_id);
	$smarty->assign('guidecat_id', $guidecat_id);
	$smarty->assign('trvg_intro', $trvg_intro);
	#
	/** --- Phân trang --- **/
	$currentPage	= 	isset($_GET['page']) ? $_GET['page'] : 1;
	$assign_list['currentPage'] = $currentPage;
	$recordPerPage 	= 	12;
	$assign_list['recordPerPage'] = $recordPerPage;
	#
	$cond	= 	"is_trash=0 AND is_online=1 AND country_id = '$country_id'";
	if ($guidecat_id > 0) {
		$cond	.= 	" AND (cat_id='$guidecat_id' OR list_cat_id LIKE '%|" . $guidecat_id . "|%')";
	}
	$order_by		= 	" ORDER BY order_no ASC";
	$totalRecord 	= 	$clsGuide->getAll($cond) ? count($clsGuide->getAll($cond)) : 0;
	#
	$link_page	= 	$clsGuide->getLinkGuide($country_slug, $guidecat_slug, $guidecat_id);
	#
	$config	= 	[
		'total'				=> $totalRecord,
		'number_per_page'	=> $recordPerPage,
		'current_page'		=> $currentPage,
		'link'				=> str_replace('.html', '/', $link_page),
		'link_page'			=> $link_page
	];
	$clsPagination->initianize($config);
	$page_view	= 	$clsPagination->create_links(false);
	$offset 	= 	($currentPage - 1) * $recordPerPage;
	$limit 		= 	" LIMIT $offset,$recordPerPage";
	$listGuide 	= 	$clsGuide->getAll($cond . $order_by . $limit, $clsGuide->pkey);
	$assign_list['listGuide']	= 	$listGuide;
	unset($listGuide);
	$assign_list['page_view']	= 	$page_view;
	unset($page_view);
	$assign_list['totalPage']	= 	$clsPagination->getTotalPage();
	/** --- End of Phân trang --- **/
}
function default_detail()
{
	global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $global_image_seo_page, $city_id, $country_id, $extLang, $clsISO;
	#
	$clsGuide = new Guide();
	$assign_list["clsGuide"] = $clsGuide;
	$clsGuideCat = new GuideCat();
	$assign_list["clsGuideCat"] = $clsGuideCat;
	$clsCountryEx = new Country();
	$assign_list["clsCountryEx"] = $clsCountryEx;
	#
	// $show = isset($_GET['show']) ? $_GET['show'] : '';
	// $assign_list["show"] = $show;
	#
	$guide_id	= 	isset($_GET['guide_id']) ? $_GET['guide_id'] : 0;
	$slug 		= 	isset($_GET['slug']) ? $_GET['slug'] : '';
	if (empty($clsGuide->checkOnlineBySlug($guide_id, $slug))) {
		header('location:' . DOMAIN_NAME . $extLang);
		exit();
	}
	$assign_list['guide_id']	= 	$guide_id;
	#
	$one	=	$clsGuide->getOne($guide_id);
	$country_id		= 	$one['country_id'];
	$assign_list['country_id']	= 	$country_id;
	$guidecat_id 	= 	$one['cat_id'];
	$assign_list["guidecat_id"] = 	$guidecat_id;
	// $city_id = $one['city_id'];
	// $assign_list['city_id'] = $city_id;
	#
	$listGuideCat = $clsGuideCat->getAll("is_trash=0 and is_online=1", $clsGuideCat->pkey);
	$assign_list['listGuideCat'] = $listGuideCat;
	unset($listGuideCat);
	#
	// Similar
	$cond	= 	"is_trash = 0 AND is_online = 1 AND (cat_id = '$guidecat_id' OR list_cat_id LIKE '%|$guidecat_id|%')";
	if ($country_id > 0) {
		$cond	.= 	" AND country_id = '$country_id'";
	}
	$lstRelated	= 	$clsGuide->getAll($cond . " AND guide_id <> '$guide_id' ORDER BY rand() LIMIT 0,10", $clsGuide->pkey);
	$assign_list["lstRelated"]	= 	$lstRelated;
	unset($lstRelated);
	#
	/*=============Title & Description Page==================*/
	$title_page = $clsGuide->getTitle($guide_id) . ' | ' . $core->get_Lang('travelguide') . ' | ' . PAGE_NAME;
	$assign_list["title_page"] = $title_page;
	$description_page = $clsISO->getMetaDescription($guide_id, 'Guide');
	$assign_list["description_page"] = $description_page;
	$global_image_seo_page = $clsISO->getPageImageShare($guide_id, 'Guide');
	$assign_list["global_image_seo_page"] = $global_image_seo_page;
	unset($clsGuide);
}
function default_search()
{
	global $assign_list, $smarty, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $global_image_seo_page, $city_id;
	global $clsISO;
	#
	$clsISO->dump($_GET);

	// $clsCountry	=   new Country();
	// $smarty->assign('clsCountry', $clsCountry);
	// $clsGuideCat	=   new GuideCat();
	// $smarty->assign('clsGuideCat', $clsGuideCat);
	// $clsGuideCatStore	=   new GuideCatStore();
	// $smarty->assign('clsGuideCatStore', $clsGuideCatStore);
	// $clsGuide	= 	new Guide();
	// $smarty->assign('clsGuide', $clsGuide);
	// $clsPagination	= 	new Pagination();
	// #	
	// $trvg_intro	=	'';
	// $show		=	isset($_GET['show']) ? $_GET['show'] : '';
	// if ($show === 'Country') {
	// 	$guidecat_slug	=   '';
	// 	$guidecat_id    =   0;
	// 	$country_slug  	=   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
	// 	$country_id 	= 	$clsCountry->getBySlug($country_slug);
	// 	if (intval($country_id) == 0 && $clsCountry->checkExitsId($country_id) == '0') {
	// 		header('location:' . PCMS_URL);
	// 		exit();
	// 	}
	// } elseif ($show === 'GuideCat') {
	// 	$guidecat_slug	=   isset($_GET['slug_guidecat']) ? $_GET['slug_guidecat'] : '';
	// 	$guidecat_id    =   isset($_GET['guidecat_id']) ? $_GET['guidecat_id'] : 0;
	// 	$country_slug  	=   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
	// 	$country_id 	= 	$clsCountry->getBySlug($country_slug);
	// 	if (intval($guidecat_id) == 0) {
	// 		header('location:' . PCMS_URL);
	// 		exit();
	// 	}
	// 	$trvg_intro	.=	$clsGuideCatStore->getContent($guidecat_id, $country_id);
	// }
	// $smarty->assign('country_id', $country_id);
	// $smarty->assign('guidecat_id', $guidecat_id);
	// $smarty->assign('trvg_intro', $trvg_intro);
	// #
	// /** --- Phân trang --- **/
	// $currentPage	= 	isset($_GET['page']) ? $_GET['page'] : 1;
	// $assign_list['currentPage'] = $currentPage;
	// $recordPerPage 	= 	12;
	// $assign_list['recordPerPage'] = $recordPerPage;
	// #
	// $cond	= 	"is_trash=0 AND is_online=1 AND country_id = '$country_id'";
	// if ($guidecat_id > 0) {
	// 	$cond	.= 	" AND (cat_id='$guidecat_id' OR list_cat_id LIKE '%|" . $guidecat_id . "|%')";
	// }
	// $order_by		= 	" ORDER BY order_no ASC";
	// $totalRecord 	= 	$clsGuide->getAll($cond) ? count($clsGuide->getAll($cond)) : 0;
	// #
	// $link_page	= 	$clsGuide->getLinkGuide($country_slug, $guidecat_slug, $guidecat_id);
	// #
	// $config	= 	[
	// 	'total'				=> $totalRecord,
	// 	'number_per_page'	=> $recordPerPage,
	// 	'current_page'		=> $currentPage,
	// 	'link'				=> str_replace('.html', '/', $link_page),
	// 	'link_page'			=> $link_page
	// ];
	// $clsPagination->initianize($config);
	// $page_view	= 	$clsPagination->create_links(false);
	// $offset 	= 	($currentPage - 1) * $recordPerPage;
	// $limit 		= 	" LIMIT $offset,$recordPerPage";
	// $listGuide 	= 	$clsGuide->getAll($cond . $order_by . $limit, $clsGuide->pkey);
	// $assign_list['listGuide']	= 	$listGuide;
	// unset($listGuide);
	// $assign_list['page_view']	= 	$page_view;
	// unset($page_view);
	// $assign_list['totalPage']	= 	$clsPagination->getTotalPage();
	// /** --- End of Phân trang --- **/


	// global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain;

	// $show = isset($_GET['show']) ? $_GET['show'] : '';
	// $assign_list["show"] = $show;

	// $clsCountry = new Country();
	// $assign_list["clsCountry"] = $clsCountry;

	// $country_id = (isset($_GET['country_id']) && $_GET['country_id'] != '') ? $_GET['country_id'] : '';
	// $keyword = (isset($_GET['key']) && !empty($_GET['key'])) ? $_GET['key'] : '';

	// $cond = "is_trash=0 and is_online=1";
	// if (intval($country_id) > 0) {
	// 	$cond .= " and country_id='$country_id'";
	// 	$assign_list["country_id"] = $country_id;
	// }
	// if ($keyword != '') {
	// 	$cond .= " and (title like '$keyword' or slug like '%" . $core->replaceSpace($keyword) . "%')";
	// 	$assign_list["keyword"] = $keyword;
	// }
	// #
	// $order_by = " order by order_no ASC";
	// $recordPerPage = 12;
	// $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

	// $offset = ($currentPage - 1) * $recordPerPage;
	// $limit = " LIMIT $offset,$recordPerPage";
	// #
	// $totalRecord = $clsHotel->getAll($cond) ? count($clsHotel->getAll($cond)) : 0;
	// #
	// $assign_list['totalRecord'] = $totalRecord;
	// $totalPage = ceil($totalRecord / $recordPerPage);
	// $assign_list['totalPage'] = $totalPage;
	// #
	// $listHotel = $clsHotel->getAll($cond . $order_by . $limit, $clsHotel->pkey . ',star_id');
	// $assign_list['listHotel'] = $listHotel;
	// unset($listHotel);
	// #
	// /*=============Title & Description Page==================*/
	// $title_page = $core->get_Lang('resultsearch') . ' | ' . PAGE_NAME;
	// $assign_list["title_page"] = $title_page;
	// $description_page = $title_page;
	// $assign_list["description_page"] = $description_page;
	// $keyword_page = $title_page;
	// $assign_list["keyword_page"] = $keyword_page;
	// /*=============Content Page==================*/
	// unset($clsHotel);
}
function default_loadGuideItems()
{
	global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain;
	global $clsISO;
	#
	$clsGuide = new Guide();
	$assign_list["clsGuide"] = $clsGuide;
	$clsGuideCat = new GuideCat();
	$assign_list["clsGuideCat"] = $clsGuideCat;
	$clsGuideCatStore = new GuideCatStore();
	$assign_list["clsGuideCatStore"] = $clsGuideCatStore;

	$guidecat_id = isset($_POST['guidecat_id']) ? $_POST['guidecat_id'] : 0;
	$country_id = isset($_POST['country_id']) ? $_POST['country_id'] : 0;
	$page = isset($_POST['page']) ? intval($_POST['page']) : 1;
	$recordPerPage = 9;

	$cond = "is_trash=0 and is_online=1 and country_id = '$country_id'";
	if ($guidecat_id > 0) {
		$cond .= " and (cat_id='$guidecat_id' or list_cat_id like '%|" . $guidecat_id . "|%')";
	}
	$order_by = " order by order_no DESC";

	$offset = ($page - 1) * $recordPerPage;
	$limit = " limit $offset,$recordPerPage";
	$Html = '';

	$listGuide = $clsGuide->getAll($cond . $order_by . $limit, $clsGuide->pkey);
	if (is_array($listGuide) && count($listGuide) > 0) {
		for ($i = 0; $i < count($listGuide); $i++) {
			$Html .= '
			<li class="list_Elems">
				<div class="row">
					<div class="col-md-4">
						<a class="photo" href="' . $clsGuide->getLink($listGuide[$i][$clsGuide->pkey]) . '" title="' . $clsGuide->getTitle($listGuide[$i][$clsGuide->pkey]) . '"><img class="img-responsive" src="' . $clsGuide->getImage($listGuide[$i][$clsGuide->pkey], 600, 400) . '" alt="' . $clsGuide->getTitle($listGuide[$i][$clsGuide->pkey]) . '" width="100%" /></a>
					</div>
					<div class="col-md-8">
						<h3 class="title"><a href="' . $clsGuide->getLink($listGuide[$i][$clsGuide->pkey]) . '" title="' . $clsGuide->getTitle($listGuide[$i][$clsGuide->pkey]) . '">' . $clsGuide->getTitle($listGuide[$i][$clsGuide->pkey]) . '</a></h3>
						<div class="text">' . $clsISO->myTruncate($clsGuide->getStripIntro($listGuide[$i][$clsGuide->pkey]), 250) . '</div>
					</div>
				</div>
			</li>';
		}
	} else {
		$Html .= 'NOT_RESULT';
	}
	echo  $Html;
	die();
}
