<?php
function default_place()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $clsISO, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain, $deviceType, $country_id, $package_id;
    global $min_duration_value, $max_duration_value, $min_price_value, $max_price_value, $min_duration_search, $max_duration_search;
    #
    $clsCountry = new Country();
    $assign_list["clsCountry"] = $clsCountry;
    $clsCity = new City();
    $assign_list["clsCity"] = $clsCity;
    $clsCityStore = new CityStore();
    $assign_list["clsCityStore"] = $clsCityStore;
    $clsGuide = new Guide();
    $assign_list["clsGuide"] = $clsGuide;
    $clsGuideCat = new GuideCat();
    $assign_list["clsGuideCat"] = $clsGuideCat;
    $clsTour = new Tour();
    $assign_list["clsTour"] = $clsTour;
    $clsTourCategory = new TourCategory();
    $assign_list["clsTourCategory"] = $clsTourCategory;
    $clsRegion = new Region();
    $assign_list["clsRegion"] = $clsRegion;
    $clsReview = new Reviews();
    $assign_list["clsReview"] = $clsReview;
    $clsPagination = new Pagination();
    $assign_list["clsPagination"] = $clsPagination;
    $clsPromotion = new Promotion();
    $assign_list["clsPromotion"] = $clsPromotion;
    #	
    // $clsCountry->SetDebug(1);
    $arr    =   $clsCountry->getAll('is_trash=0 and is_online=1 and country_id = 1', '*');
    // die;
    $clsISO->dump($arr);

    // $city_id	=	1;
    // $assign_list['city_id'] = $city_id;
    // $slug_city	=	'ha-noi';
    // $res1 = $clsCity->getAll("is_trash=0 and is_online=1 and slug='$slug_city' LIMIT 0,1", $clsCity->pkey . ',title,banner,intro,content');
    // // $clsISO->pre($res1);
    // // die;
    // $city_id = $res1[0][$clsCity->pkey];
    // $assign_list['cityItem'] = $res1[0];
    // die('ok');



    // $show = isset($_GET['show']) ? $_GET['show'] : '';
    // $assign_list['show'] = $show;
    // $slug_country = isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
    // $slug_city = isset($_GET['slug_city']) ? $_GET['slug_city'] : '';

    // $res = $clsCountry->getAll("is_trash=0 and is_online=1 and slug='$slug_country' LIMIT 0,1", $clsCountry->pkey . ',title,banner,intro,content');
    // $country_id = $res[0][$clsCountry->pkey];
    // $assign_list['countryItem'] = $res[0];
    // $res1 = $clsCity->getAll("is_trash=0 and is_online=1 and slug='$slug_city' LIMIT 0,1", $clsCity->pkey . ',title,banner,intro,content');
    // $city_id = $res1[0][$clsCity->pkey];
    // $assign_list['cityItem'] = $res1[0];
    // if (intval($country_id) == 0) {
    // 	header('Location:' . PCMS_URL . $extLang);
    // 	exit();
    // }

    // $assign_list['country_id'] = $country_id;
    // $assign_list['city_id'] = $city_id;
    // $cond = "is_trash=0 and is_online=1";
    // $cond2 = "is_trash=0 and is_online=1";


    // if ($country_id > 0) {
    // 	$cond .= " and tour_id IN (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE is_trash=0 and country_id='$country_id')";
    // }


    // if ($city_id > 0) {
    // 	$cond .= " and tour_id IN (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE is_trash=0 and city_id ='$city_id')";
    // 	$assign_list["city_id"] = $city_id;
    // }


    // $action = isset($_GET['action']) ? $_GET['action'] : '';
    // $city_filter_id = isset($_GET['city_filter_id']) ? $_GET['city_filter_id'] : 0;
    // $country_filter_id = isset($_GET['country_filter_id']) ? $_GET['country_filter_id'] : 0;
    // $departure_point_id = isset($_GET['departure_point_id']) ? $_GET['departure_point_id'] : 0;



    // $listTourMaxMin = $clsTour->getAll($cond, "max(number_day) as max,min(number_day) as min");
    // $min_duration_value = intval($listTourMaxMin[0]['min']);
    // $max_duration_value = intval($listTourMaxMin[0]['max']);


    // $listpriceMaxMin = $clsTour->getAll($cond, "max(min_price) as max,min(min_price) as min");
    // $min_price_value = $listpriceMaxMin[0]['min'];
    // $max_price_value = $listpriceMaxMin[0]['max'];


    // $orderBy = " order by order_no asc";
    // if ($deviceType == 'tablet') {
    // 	$recordPerPage = 14;
    // } else {
    // 	$recordPerPage = 15;
    // }
    // $currentPage = isset($_GET["page"]) ? $_GET["page"] : 1;

    // if (!empty($departure_point_id)) {
    // 	$departure_point_ID = explode(',', $departure_point_id);
    // 	$cond .= " and (";
    // 	for ($i = 0; $i < count($departure_point_ID); $i++) {
    // 		if ($i == 0 && count($departure_point_ID) == 1) {
    // 			$cond .= " (departure_point_id='" . $departure_point_ID[$i] . "' or list_departure_point_id like '%|" . $departure_point_ID[$i] . "|%')";
    // 		} elseif (count($departure_point_ID) > 1 && $i < (count($departure_point_ID) - 1)) {
    // 			$cond .= "(departure_point_id='" . $departure_point_ID[$i] . "' or list_departure_point_id like '%|" . $departure_point_ID[$i] . "|%') or ";
    // 		} else {
    // 			$cond .= "(departure_point_id='" . $departure_point_ID[$i] . "' or list_departure_point_id like '%|" . $departure_point_ID[$i] . "|%')";
    // 		}
    // 	}
    // 	$cond .= ")";
    // 	$assign_list["departure_point_id"] = $departure_point_id;
    // }

    // $min_duration_search = isset($_GET['min_duration']) ? $_GET['min_duration'] : $min_duration_value;
    // $max_duration_search = isset($_GET['max_duration']) ? $_GET['max_duration'] : $max_duration_value;


    // $assign_list['min_duration_value'] = $min_duration_value;
    // $assign_list['max_duration_value'] = $max_duration_value;

    // $assign_list["min_duration_search"] = $min_duration_search;
    // $assign_list["max_duration_search"] = $max_duration_search;





    // if ($min_duration_search > 0 && $max_duration_search > 0) {
    // 	$cond .= " and number_day >='$min_duration_search' and number_day <='$max_duration_search'";
    // } elseif ($min_duration_search == 0 && $max_duration_search > 0) {
    // 	$cond .= " and number_day <='$max_duration_search'";
    // } elseif ($min_duration_search > 0 && $max_duration_search == 0) {
    // 	$cond .= " and number_day >='$min_duration_search'";
    // }


    // $min_price_search = isset($_GET['min_price']) ? $_GET['min_price'] : $min_price_value;
    // $max_price_search = isset($_GET['max_price']) ? $_GET['max_price'] : $max_price_value;

    // $assign_list["min_price_value"] = $min_price_value;
    // $assign_list["max_price_value"] = $max_price_value;

    // $assign_list["min_price_search"] = $min_price_search;
    // $assign_list["max_price_search"] = $max_price_search;




    // if ($min_price_search > 0 && $max_price_search > 0) {
    // 	$cond .= " and min_price >='$min_price_search' and min_price <='$max_price_search'";
    // } elseif ($min_price_search == 0 && $max_price_search > 0) {
    // 	$cond .= " and min_price <='$max_price_search'";
    // } elseif ($min_price_search > 0 && $max_price_search == 0) {
    // 	$cond .= " and min_price >='$min_price_search'";
    // }

    // if (!empty($country_filter_id)) {
    // 	$cond .= " and tour_id IN (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE is_trash=0 and country_id IN ($country_filter_id))";
    // 	$assign_list["country_filter_id"] = $country_filter_id;
    // }

    // if (!empty($city_filter_id)) {
    // 	$cond .= " and tour_id IN (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE is_trash=0 and city_id IN ($city_filter_id))";
    // 	$assign_list["city_filter_id"] = $city_filter_id;
    // }




    // $order_by = " order by order_no ASC";

    // $totalRecord = $clsTour->getAll($cond, $clsTour->pkey);

    // if ($totalRecord) {
    // 	$totalRecord = count($totalRecord);
    // 	$totalTour = $totalRecord;
    // } else {
    // 	$totalRecord = 0;
    // 	$totalTour = 0;
    // }
    // if ($country_id) {
    // 	$link_page =  $clsTourCategory->getLinkCatCountry($cat_id, $country_id, $oneItem);
    // } else {
    // 	$link_page =  $clsTourCategory->getLink($cat_id, $oneItem);
    // }

    // $assign_list['linksort'] = $clsTourCategory->getLinkCatTour($cat_id, 0, true, $oneItem);
    // $config = array(
    // 	'total'	=> $totalRecord,
    // 	'number_per_page'	=> $recordPerPage,
    // 	'current_page'	=> $currentPage,
    // 	'link'	=> str_replace('.html', '/', $link_page),
    // 	'link_page_1'	=> $link_page
    // );
    // $clsPagination->initianize($config);
    // $page_view = $clsPagination->create_links(false);

    // $offset = ($currentPage - 1) * $recordPerPage;
    // $limit = " LIMIT $offset,$recordPerPage";


    // $lstTour = $clsTour->getAll($cond . $order_by . $limit, $clsTour->pkey . ",departure_point_id,slug,title,image,duration_type,duration_custom,number_day,number_night");
    // if (!$lstTour && $currentPage > 1) {
    // 	header("Location: " . $link_page);
    // 	exit();
    // }



    // $assign_list['totalTour'] = $totalTour;
    // $assign_list['lstTour'] = $lstTour;
    // unset($lstTour);
    // $assign_list['page_view'] = $page_view;
    // unset($page_view);
    // $assign_list['totalPage'] = $clsPagination->getTotalPage();
    // $assign_list['totalRecord'] = $totalRecord;

    // $assign_list["min_duration_search"] = $min_duration_search;
    // $assign_list["max_duration_search"] = $max_duration_search;
    // $assign_list["min_price_search"] = $min_price_search;
    // $assign_list["max_price_search"] = $max_price_search;













    // if (1 == 2) {













    // 	$cond = "is_trash=0 and is_online=1";

    // 	$orderby = " order by order_no asc";
    // 	if ($deviceType == 'tablet') {
    // 		$recordPerPage = 14;
    // 	} else {
    // 		$recordPerPage = 15;
    // 	}

    // 	$currentPage = isset($_GET["page"]) ? $_GET["page"] : 1;

    // 	$lstGuideCat = $clsGuideCat->getAll($cond . $orderby, $clsGuideCat->pkey . ',title,intro');
    // 	$guidecat2 = $lstGuideCat[0]['guidecat_id'];
    // 	if ($city_id) {
    // 		$lstGuide = $clsGuide->getAll($cond . " and cat_id='$guidecat2' and country_id='$country_id' and city_id='$city_id'" . $orderby, $clsGuide->pkey . ',title,slug,publish_date,intro');
    // 	} else {
    // 		$lstGuide = $clsGuide->getAll($cond . " and cat_id='$guidecat2' and country_id='$country_id'" . $orderby, $clsGuide->pkey . ',title,slug,publish_date,intro');
    // 	}

    // 	$totalguide = $lstGuide;
    // 	$totalguide = $totalguide ? count($totalguide) : '0';
    // 	$lstRegion = $clsRegion->getAll($cond . " and country_id='$country_id'" . $orderby, $clsRegion->pkey);

    // 	$lstTourCat = $clsTourCategory->getAll($cond . $orderby, $clsTourCategory->pkey . ",title");

    // 	if ($city_id) {
    // 		$cond .= " and tour_id in (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE country_id='$country_id' and city_id='$city_id')";
    // 	} else {
    // 		$cond .= " and tour_id in (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE country_id='$country_id' )";
    // 	}
    // 	$listAllTour = $clsTour->getAll($cond, $clsTour->pkey);
    // 	$totalTour = $listAllTour ? count($listAllTour) : 0;

    // 	if ($slug_city) {
    // 		$link_page = $clsISO->getLink('outbound') . $slug_country . "/" . $slug_city;
    // 	} else {
    // 		$link_page = $clsISO->getLink('outbound') . $slug_country;
    // 	}
    // 	$config = array(
    // 		'total'	=> $totalTour,
    // 		'number_per_page'	=> $recordPerPage,
    // 		'current_page'	=> $currentPage,
    // 		'link'	=> str_replace('.html', '/', $link_page),
    // 		'link_page_1'	=> $link_page
    // 	);
    // 	$clsPagination->initianize($config);
    // 	$page_view = $clsPagination->create_links(false);
    // 	$offset = ($currentPage - 1) * $recordPerPage;
    // 	$limit = " LIMIT $offset,$recordPerPage";
    // 	$totalPage = $clsPagination->getTotalPage();

    // 	$lstTour = $clsTour->getAll($cond . $orderby . $limit, $clsTour->pkey . ',departure_point_id,slug,title,image,duration_type,duration_custom,number_day,number_night');
    // 	if (!$lstTour && $currentPage > 1) {
    // 		header("Location: " . $link_page);
    // 		exit();
    // 	}

    // 	$listTourMaxMin = $clsTour->getAll($cond, "max(number_day) as max,min(number_day) as min");
    // 	$min_duration = $listTourMaxMin[0]['min'];
    // 	$max_duration = $listTourMaxMin[0]['max'];

    // 	$listpriceMaxMin = $clsTour->getAll($cond, "max(min_price) as max,min(min_price) as min");
    // 	$min_price = $listpriceMaxMin[0]['min'];
    // 	$max_price = $listpriceMaxMin[0]['max'];

    // 	$min_duration_search = isset($_GET['min_duration']) ? $_GET['min_duration'] : $min_duration;
    // 	$max_duration_search = isset($_GET['max_duration']) ? $_GET['max_duration'] : $max_duration;
    // 	$min_price_search = isset($_GET['min_price']) ? $_GET['min_price'] : $min_price;
    // 	$max_price_search = isset($_GET['max_price']) ? $_GET['max_price'] : $max_price;

    // 	$assign_list["totalTour"] = $totalTour;
    // 	$assign_list["country_id"] = $country_id;
    // 	$assign_list["lstGuideCat"] = $lstGuideCat;
    // 	$assign_list["lstGuide"] = $lstGuide;
    // 	$assign_list["lstTour"] = $lstTour;
    // 	$assign_list["lstRegion2"] = $lstRegion;
    // 	$assign_list["lstTourCat"] = $lstTourCat;
    // 	$assign_list['currentPage'] = $currentPage;
    // 	$assign_list['totalTour'] = $totalTour;
    // 	$assign_list['totalguide'] = $totalguide;
    // 	$assign_list['recordPerPage'] = $recordPerPage;
    // 	$assign_list['totalPage'] = $totalPage;
    // 	$assign_list['page_view'] = $page_view;

    // 	$assign_list["min_duration"] = $min_duration;
    // 	$assign_list["max_duration"] = $max_duration;
    // 	$assign_list["min_price"] = $min_price;
    // 	$assign_list["max_price"] = $max_price;
    // 	$assign_list["min_duration_search"] = $min_duration_search;
    // 	$assign_list["max_duration_search"] = $max_duration_search;
    // 	$assign_list["min_price_search"] = $min_price_search;
    // 	$assign_list["max_price_search"] = $max_price_search;
    // }


    // /*=============Title & Description Page==================*/
    // $titleCity = '';
    // if ($city_id) {
    // 	$titleCity = ' | ' . $clsCity->getTitle($city_id, $cityItem);
    // 	$place_id = $city_id;
    // 	$clsClassTable = 'City';
    // } else {
    // 	$place_id = $country_id;
    // 	$clsClassTable = 'Country';
    // }
    // if ($_LANG_ID == 'vn') {
    // 	$title_page = $core->get_Lang('Du lịch nước ngoài') . ' | ' . $clsCountry->getTitle($country_id) . $titleCity . ' | ' . PAGE_NAME;
    // } else {
    // 	$title_page = $core->get_Lang('Destinations') . ' | ' . $clsCountry->getTitle($country_id) . $titleCity . ' | ' . PAGE_NAME;
    // }

    // $assign_list["title_page"] = $title_page;
    // $description_page = $title_page;
    // $assign_list["description_page"] = $description_page;
    // $keyword_page = $title_page;
    // $assign_list["keyword_page"] = $keyword_page;

    // /* =============Title & Description Page================== */
    // $title_page = $core->get_Lang('Destinations in') . ' ' . $title_page . ' | ' . PAGE_NAME;
    // $assign_list["title_page"] = $title_page;
    // $description_page = $clsISO->getMetaDescription($place_id, $clsClassTable);
    // $assign_list["description_page"] = $description_page;
    // $global_image_seo_page = $clsISO->getPageImageShare($place_id, $clsClassTable);
    // $assign_list["global_image_seo_page"] = $global_image_seo_page;
}
function default_travel_style()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $clsISO, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain, $deviceType, $country_id, $package_id;
    global $min_duration_value, $max_duration_value, $min_price_value, $max_price_value, $min_duration_search, $max_duration_search;
    #
    // die('5678678');
}
function default_travel_guide()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $clsISO, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain, $deviceType, $country_id, $package_id;
    global $min_duration_value, $max_duration_value, $min_price_value, $max_price_value, $min_duration_search, $max_duration_search;
    #
    // die('5678678');
}
function default_travel_guide_detail()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $clsISO, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain, $deviceType, $country_id, $package_id;
    global $min_duration_value, $max_duration_value, $min_price_value, $max_price_value, $min_duration_search, $max_duration_search;
    #
    // die('5678678');
}
function default_attraction()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $clsISO, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain, $deviceType, $country_id, $package_id;
    global $min_duration_value, $max_duration_value, $min_price_value, $max_price_value, $min_duration_search, $max_duration_search;
    #
    // die('5678678');
}
function default_region()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $global_image_seo_page, $city_id, $clsConfiguration, $map_la, $map_lo;
    global $clsISO;

    $clsBlog = new Blog();
    $assign_list["clsBlog"] = $clsBlog;
    $clsPage = new Page();
    $assign_list["clsPage"] = $clsPage;
    $clsWhy = new Why();
    $assign_list["clsWhy"] = $clsWhy;
    $clsCountryEx = new Country();
    $assign_list["clsCountryEx"] = $clsCountryEx;

    $clsCategory_Country = new Category_Country();
    $assign_list['clsCategory_Country'] = $clsCategory_Country;
    $clsRegion = new Region();
    $assign_list["clsRegion"] = $clsRegion;
    $clsCity = new City();
    $assign_list["clsCity"] = $clsCity;
    $clsTour = new Tour();
    $assign_list['clsTour'] = $clsTour;
    $clsHotel = new Hotel();
    $assign_list['clsHotel'] = $clsHotel;
    $clsGuide = new Guide();
    $assign_list["clsGuide"] = $clsGuide;
    $clsGuide2 = new Guide2();
    $assign_list["clsGuide2"] = $clsGuide2;
    $clsGuideCat = new GuideCat();
    $assign_list["clsGuideCat"] = $clsGuideCat;
    $clsGuideCatStore = new GuideCatStore();
    $assign_list["clsGuideCatStore"] = $clsGuideCatStore;
    $clsReviews = new Reviews();
    $assign_list['clsReviews'] = $clsReviews;
    $clsTourCategory = new TourCategory();
    $assign_list['clsTourCategory'] = $clsTourCategory;
    $clsBlogCategory = new BlogCategory();
    $assign_list['clsBlogCategory'] = $clsBlogCategory;

    $show = isset($_GET['show']) ? $_GET['show'] : '';
    $assign_list['show'] = $show;
    $test = isset($_GET['test']) ? $_GET['test'] : '';
    $assign_list['test'] = $test;
    #
    $listGuideCat = $clsGuideCat->getAll("is_trash=0 and is_online=1 order by order_no ASC", $clsGuideCat->pkey);
    $assign_list['listGuideCat'] = $listGuideCat;
    unset($listGuideCat);

    $slug_country = isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
    $res = $clsCountryEx->getAll("is_trash=0 and is_online=1 and slug='$slug_country' LIMIT 0,1", $clsCountryEx->pkey);
    $country_id = $res[0][$clsCountryEx->pkey];
    if (intval($country_id) == 0) {
        header('Location:' . PCMS_URL . $extLang);
        exit();
    }
    $assign_list['country_id'] = $country_id;

    $oneItem = $clsCountryEx->getOne($country_id);
    #
    $region_id = isset($_GET['region_id']) ? $_GET['region_id'] : '';

    if (intval($region_id) == 0) {
        header('Location:' . PCMS_URL . $extLang);
        exit();
    }
    $assign_list["region_id"] = $region_id;
    $title_page = $clsRegion->getTitle($region_id);

    $intro_page = $clsRegion->getIntro($region_id);
    $content_page = $clsRegion->getContent($region_id);
    $link_page = $clsRegion->getLink($country_id, $region_id);
    $oneItem = $clsRegion->getOne($region_id);


    $assign_list['TD'] = $title_page;
    $assign_list['ID'] = $intro_page;
    $assign_list['CD'] = $content_page;

    $assign_list['link_page'] = $link_page;

    if ($_LANG_ID == 'en') {
        $place_to_go_id = 15;
    } elseif ($_LANG_ID == 'fr') {
        $place_to_go_id = 5;
    } else {
        $place_to_go_id = 3;
    }
    $assign_list['place_to_go_id'] = $place_to_go_id;

    $listGuideCat = $clsGuideCat->getAll("is_trash=0 and is_online=1 order by order_no ASC", $clsGuideCat->pkey);
    $assign_list['listGuideCat'] = $listGuideCat;
    //$clsISO->print_pre($listGuideCat,true);
    //die();
    unset($listGuideCat);

    #
    $cond = "is_trash=0 and is_online=1";
    if (intval($region_id) > 0) {

        $cond .= " and tour_id in (SELECT tour_id FROM " . DB_PREFIX . "tour_destination WHERE country_id='$country_id' and region_id='$region_id')";
    }
    #
    $sort_by = isset($_GET['sort_by']) ? $_GET['sort_by'] : 'recent';
    $assign_list['sort_by'] = $sort_by;
    $duration = isset($_GET['duration']) ? $_GET['duration'] : '';
    $assign_list['duration'] = $duration;
    #
    $linkpage = $clsRegion->getLink($region_id);

    # Order
    $order_by = " order by order_no ASC";
    $listTour = $clsTour->getAll($cond . $order_by, $clsTour->pkey . ",hot_deals");
    $assign_list['listTour'] = $listTour;
    //print_r(count($listTour)); die();
    unset($listTour);


    $listHotelPlace = $clsHotel->getAll("is_trash=0 and is_online=1 and country_id='$country_id' and region_id='$region_id' order by order_no ASC", $clsHotel->pkey . ',star_id');

    $listBlogPlace = $clsBlog->getAll("is_trash=0 and is_online=1 and blog_id IN (SELECT blog_id FROM " . DB_PREFIX . "blog_destination WHERE country_id='$country_id' and region_id='$region_id') order by order_no ASC", $clsBlog->pkey);

    $listPlaceToGoByRegion = $clsGuide->getAll("is_trash=0 and is_online=1 and country_id='$country_id' and city_id in (SELECT city_id FROM " . DB_PREFIX . "city WHERE country_id='$country_id' and region_id='$region_id') and (cat_id='$place_to_go_id' or list_cat_id like '%|$place_to_go_id|%')", $clsGuide->pkey);

    $assign_list['listHotelPlace'] = $listHotelPlace;
    $assign_list['listBlogPlace'] = $listBlogPlace;
    $assign_list['listPlaceToGoByRegion'] = $listPlaceToGoByRegion;
    unset($listHotelPlace);
    unset($listBlogPlace);
    unset($listPlaceToGoByCountry);



    $letter = array();
    foreach (range('a', 'z') as $i) {
        $lstCityAZ = $clsISO->getCityByRegionAlphabet($country_id, $region_id, $i);
        if (!empty($lstCityAZ)) {
            $letter[] = $i;
        }
    }

    $assign_list['letter'] = $letter;

    $sql = "SELECT cat_id FROM " . DB_PREFIX . "category_country WHERE country_id='$country_id' and cat_id IN (SELECT tourcat_id FROM " . DB_PREFIX . "tour_category WHERE is_trash=0 and is_online=1)";

    $lstCatTourPlace = $dbconn->GetAll($sql);
    $assign_list['lstCatTourPlace'] = $lstCatTourPlace;
    $totalCatTourPlace = count($lstCatTourPlace);
    $assign_list['totalCatTourPlace'] = $totalCatTourPlace;
    unset($lstCatTourPlace);

    /* =============Title & Description Page================== */
    $title_page = $core->get_Lang('Destinations in') . ' ' . $title_page . ' | ' . PAGE_NAME;
    $assign_list["title_page"] = $title_page;
    $description_page = $clsISO->getMetaDescription($region_id, 'Region');
    $assign_list["description_page"] = $description_page;
    $global_image_seo_page = $clsISO->getPageImageShare($region_id, 'Region');
    $assign_list["global_image_seo_page"] = $global_image_seo_page;
}
function default_loadCityItems()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain;
    global $clsISO;
    #
    $clsCountryEx = new Country();
    $assign_list['clsCountryEx'] = $clsCountryEx;
    $clsCity = new City();
    $assign_list['clsCity'] = $clsCity;


    $country_id = isset($_POST['country_id']) ? $_POST['country_id'] : 0;
    $page = isset($_POST['page']) ? intval($_POST['page']) : 1;
    $recordPerPage = 9;

    $cond = "is_trash=0 and is_online=1 and country_id='$country_id'";
    $order_by = " order by order_no desc";
    $offset = ($page - 1) * $recordPerPage;
    $limit = " limit $offset,$recordPerPage";
    $Html = '';

    $lstItem = $clsCity->getAll($cond . $order_by . $limit);
    if (is_array($lstItem) && count($lstItem) > 0) {
        for ($i = 0; $i < count($lstItem); $i++) {
            $Html .= '
			<li class="list_Elems">
				<div class="row">
					<div class="col-md-4">
						<a href="' . $clsCity->getLink($lstItem[$i][$clsCity->pkey]) . '" title="' . $clsCity->getTitle($lstItem[$i][$clsCity->pkey]) . '" class="photo"><img src="' . $clsCity->getImage($lstItem[$i][$clsCity->pkey], 600, 400) . '" width="100%" alt="' . $clsCity->getTitle($lstItem[$i][$clsCity->pkey]) . '" /></a>
					</div>
					<div class="col-md-8">
						<h3 class="title"><a href="' . $clsCity->getLink($lstItem[$i][$clsCity->pkey]) . '" title="' . $clsCity->getTitle($lstItem[$i][$clsCity->pkey]) . '">' . $clsCity->getTitle($lstItem[$i][$clsCity->pkey]) . '</a></h3>
						<div class="text">' . $clsISO->myTruncate(strip_tags($clsCity->getIntro($lstItem[$i][$clsCity->pkey])), 450) . '</div>
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
function default_map()
{
    global $assign_list, $_CONFIG, $core, $dbconn, $mod, $act, $_LANG_ID, $title_page, $description_page, $keyword_page, $domain;
    #
    $clsCountryEx = new Country();
    $assign_list['clsCountryEx'] = $clsCountryEx;
    $clsCity = new City();
    $assign_list['clsCity'] = $clsCity;
    #
    $slug_country = isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
    $res = $clsCountryEx->getAll("is_trash=0 and slug='$slug_country' LIMIT 0,1");
    $country_id = $res[0][$clsCountryEx->pkey];
    if (intval($country_id) == 0 && $clsCountryEx->checkExitsId($country_id) == '0') {
        header('Location:' . $extLang . '/');
        exit();
    }
    $assign_list['country_id'] = $country_id;
    $title_page = $clsCountryEx->getTitle($country_id);
    $intro_page = $clsCountryEx->getIntro($country_id);
    $linkDestination = $clsCountryEx->getLink($country_id);
    $linkPlace = $clsCountryEx->getLink($country_id, 'Attraction');
    $linkMap = $clsCountryEx->getLink($country_id, 'Map');

    $slug_city = isset($_GET['slug_city']) ? $_GET['slug_city'] : '';
    if (!empty($slug_city)) {
        $city_id = $clsCity->getBySlug($slug_city);
        if (intval($city_id) == 0 && $clsCity->checkExitsId($city_id) == '0') {
            header('location:' . PCMS_URL);
            exit();
        }
        $assign_list["city_id"] = $city_id;
        $title_page = $clsCity->getTitle($city_id);
        $intro_page = $clsCity->getIntro($city_id);
        $linkDestination = $clsCity->getLink($city_id);
        $linkPlace = $clsCity->getLink($city_id, 'Attraction');
        $linkMap = $clsCity->getLink($city_id, 'Map');
    }
    $assign_list['TD'] = $title_page;
    $assign_list['ID'] = $intro_page;
    $assign_list['linkDestination'] = $linkDestination;
    $assign_list['linkPlace'] = $linkPlace;
    $assign_list['linkMap'] = $linkMap;

    $oneItem = $clsCountryEx->getOne($country_id);

    // Show Map
    $map_lo = $oneItem['map_lo'];
    $map_la = $oneItem['map_la'];
    $script = "";
    // List Maker
    $listCity = $clsCity->getAll("is_trash=0 and map_lo<>'' and map_la<>'' and country_id='$country_id' order by order_no ASC", $clsCity
        ->pkey);
    if (!empty($listCity)) {
        $location = '';
        $i = 0;
        foreach ($listCity as $item) {
            $location .= '["' . $clsCity->getMapHTML($item[$clsCity->pkey]) . '",' . $item['map_la'] . ',' . $item['map_lo'] . ',' . $item[$clsCity->pkey] . ']';
            $location .= ($i == count($listCity) - 1) ? '' : ',';
            ++$i;
        }
    }
    $script .= '<div id="map_canvas" style="width:100%; height:800px"></div>';
    $script .= '<script type="text/javascript">
				function initialize(){
					var locations = [
					  ' . $location . '
					];
					var map = new google.maps.Map(document.getElementById(\'map_canvas\'), {
					  zoom:7,
					  center: new google.maps.LatLng(' . $map_la . ',' . $map_lo . '),
					  mapTypeId: google.maps.MapTypeId.ROADMAP
					});
					var infowindow = new google.maps.InfoWindow();
    				var marker, i;
					for(i = 0; i < locations.length; i++) {
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(locations[i][1],locations[i][2]),
							map: map
						});
						google.maps.event.addListener(marker, "click", (function(marker, i) {
						return function() {
						  infowindow.setContent(locations[i][0]);
						  infowindow.setContent(locations[i][0]);
						  infowindow.open(map, marker);
						}
						})(marker, i));
					}
				}
				$(function(){
					initialize();
				});
			</script>';
    $assign_list['html_script'] = $script;

    /*=============Title & Description Page==================*/
    $title_page = $title_page . ' ' . $core->get_Lang('Map Destinations') . ' | ' . PAGE_NAME;
    $assign_list["title_page"] = $title_page;
    $description_page = $title_page . ' ' . $core->get_Lang('Map Destinations') . ' | ' . PAGE_NAME;
    $assign_list["description_page"] = $description_page;
    $keyword_page = $title_page . ' ' . $core->get_Lang('Map Destinations') . ' | ' . PAGE_NAME;
    $assign_list["keyword_page"] = $keyword_page;
    /*=============Content Page==================*/
}
function default_loadCityDetail()
{
    global $core, $dbconn, $clsISO, $_LANG_ID, $extLang;
    #
    $clsCountryEx = new Country();
    $clsCity = new City();
    #
    $city_id = isset($_POST['city_id']) ? intval($_POST['city_id']) : 0;
    $_LANG_ID = isset($_POST['_LANG_ID']) ? $_POST['_LANG_ID'] : $_LANG_ID;
    $extLang = ($_LANG_ID != 'vn') ? '/' . $_LANG_ID : '';
    #
    $html = '';
    if (intval($city_id) > 0) {
        $html .= '<h2 class="headMod SegoeUILight">' . $clsCity->getTitle($city_id) . '</h2>
					<div class="formatTextStandard">' . $clsCity->getIntro($city_id) . '</div>
					<div class="cllearfix"></div>
					<a class="btn btn-base mt20" href="' . $clsCity->getLink($city_id, 'Tour') . '">View our Vietnam tours featuring ' . $clsCity->getTitle($city_id) . '</a>';
    }
    echo $html;
    die();
}
