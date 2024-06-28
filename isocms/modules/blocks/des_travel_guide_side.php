<?
// ini_set('display_errors', '1');
// ini_set('display_startup_errors', '1');
// error_reporting(E_ALL);
global $core, $smarty, $clsISO, $assign_list, $deviceType, $dbconn;
#
$smarty->assign('clsISO', $clsISO);
$smarty->assign('deviceType', $deviceType);
#
$clsCountry =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsGuideCat    =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
$clsGuide   =   new Guide();
$smarty->assign('clsGuide', $clsGuide);
$clsTour    =   new Tour();
$smarty->assign('clsTour', $clsTour);
$clsTourDestination =   new TourDestination();
$smarty->assign('clsTourDestination', $clsTourDestination);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsCategory_Country    =   new Category_Country();
$smarty->assign('clsCategory_Country', $clsCategory_Country);
$clsReviews =   new Reviews();
$smarty->assign('clsReviews', $clsReviews);
$clsCity    =   new City();
$smarty->assign('clsCity', $clsCity);
$clsHotel   =   new Hotel();
$smarty->assign('clsHotel', $clsHotel);
$clsBlog    =   new Blog();
$smarty->assign('clsBlog', $clsBlog);
#	
$show   =   isset($_GET['show']) ? $_GET['show'] : '';
$smarty->assign('show', $show);
#   
$cond   =   ' is_trash = 0 AND is_online = 1';
$order1 =   ' ORDER BY order_no ASC';
$order2 =   ' ORDER BY rand()';
$limit  =   ' LIMIT 3';
#
if ($show === 'GuideCat') {
    $guidecat_slug  =   $_GET['slug_guidecat'] ?? '';
    // $smarty->assign('guidecat_slug', $guidecat_slug);
    $guidecat_id    =   $_GET['guidecat_id'] ?? 0;
    $smarty->assign('guidecat_id', $guidecat_id);
    #
    $country_slug   =   $_GET['slug_country'] ?? '';
    // $smarty->assign('country_slug', $country_slug);
    $country_id     =   $clsCountry->getBySlug($country_slug);
    $smarty->assign('country_id', $country_id);
    $country_title  =   $clsCountry->getTitle($country_id);
    $smarty->assign('country_title', $country_title);
    #
    // List guide category liên quan trong quốc gia
    $arr_guide_cat  =   $clsGuideCat->getAll($cond . " AND guidecat_id IN (SELECT guidecat_id FROM default_guidecat_store WHERE " . $cond . " AND country_id = " . $country_id . ")" . $order1, "guidecat_id, slug");
    $smarty->assign('arr_guide_cat', $arr_guide_cat);
    #
    // List tour liên quan trong quốc gia
    $arr_tour_country   =   $clsTour->getAll($cond . " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = " . $country_id . ")" . $order2 . $limit, "tour_id, min_price");
    $smarty->assign('arr_tour_country', $arr_tour_country);
} elseif (($show === 'GuideCatCountry') || ($show === 'SearchGuide')) {
    $country_slug  =   $_GET['slug_country'] ?? '';
    if (!empty($country_slug)) {
        $country_id =   $clsCountry->getBySlug($country_slug);
        $smarty->assign('country_id', $country_id);
        #
        // List guide category liên quan trong quốc gia
        $arr_guide_cat  =   $clsGuideCat->getAll($cond . " AND guidecat_id IN (SELECT guidecat_id FROM default_guidecat_store WHERE " . $cond . " AND country_id = " . $country_id . ")" . $order1, "guidecat_id, slug");
        $smarty->assign('arr_guide_cat', $arr_guide_cat);
        #
        // List tour liên quan trong quốc gia
        $arr_tour_country   =   $clsTour->getAll($cond . " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = " . $country_id . ")" . $order2 . $limit, "tour_id, min_price");
        $smarty->assign('arr_tour_country', $arr_tour_country);
    }
} elseif ($show === 'DetailGuide') {
    $guide_id   =   $_GET['guide_id'] ?? 0;
    $guide_info =   $clsGuide->getOne($guide_id);
    #
    if (!empty($guide_info)) {
        $country_id     =   $guide_info['country_id'];
        $smarty->assign('country_id', $country_id);
        $country_slug   =   $clsCountry->getSlug($country_id);
        $smarty->assign('country_slug', $country_slug);
        $country_title  =   $clsCountry->getTitle($country_id);
        $smarty->assign('country_title', $country_title);
        #
        // List guide category liên quan trong quốc gia
        $arr_guide_cat  =   $clsGuideCat->getAll($cond . " AND guidecat_id IN (SELECT guidecat_id FROM default_guidecat_store WHERE " . $cond . " AND country_id = " . $country_id . ")" . $order1, "guidecat_id, slug");
        $smarty->assign('arr_guide_cat', $arr_guide_cat);
        // List tour liên quan trong quốc gia
        $arr_tour_country   =   $clsTour->getAll($cond . " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = " . $country_id . ")" . $order2 . $limit, "tour_id, min_price");
        $smarty->assign('arr_tour_country', $arr_tour_country);
        // List danh mục travel style by country
        $arr_trvs_country   =   $clsCategory_Country->getAll("is_trash = 0 AND is_online = 1 AND country_id = $country_id ORDER BY order_no ASC", 'category_country_id, cat_id');
        $smarty->assign('arr_trvs_country', $arr_trvs_country);
    }
} elseif ($show === 'topAttractionCountry') {
    $country_slug   =   $_GET['slug_country'] ?? '';
    $country_id     =   $clsCountry->getBySlug($country_slug);
    $smarty->assign('country_id', $country_id);
    // List tour liên quan trong quốc gia
    $arr_tour_country   =   $clsTour->getAll($cond . " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = " . $country_id . ")" . $order2 . $limit, "tour_id, min_price");
    $smarty->assign('arr_tour_country', $arr_tour_country);
} elseif ($show === 'attractionCountry') {
    $country_slug   =   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
    $country_id     =   $clsCountry->getBySlug($country_slug);
    $smarty->assign('country_id', $country_id);
    #
    $city_slug  =   isset($_GET['slug_attraction']) ? $_GET['slug_attraction'] : '';
    $city_id    =   $clsCity->getBySlug($city_slug);
    $smarty->assign('city_id', $city_id);
    #
    $cond       =   "is_trash = 0 AND is_online = 1";
    $order_by1  =   " ORDER BY order_no ASC";
    $order_by2  =   " ORDER BY RAND()";
    $order_by3  =   " ORDER BY num_view DESC";
    $limit      =   " LIMIT 3";
    $limit2     =   " LIMIT 4";
    $limit3     =   " LIMIT 10";
    $limit4     =   " LIMIT 5";
    #
    // List guide category
    $arr_guide_cat  =   $clsGuideCat->getAll($cond . $order_by1, "guidecat_id, title");
    $list_guide_cat =   [];
    foreach ($arr_guide_cat as $item) {
        $list_guide_cat[$item[0]] = $item[1];
    }
    $list_guide_cat =   array_flip($list_guide_cat);
    #
    if (!empty($country_id) && !empty($city_id)) {
        $cond_tour  =   $cond;
        $cond_tour  .=  " AND tour_id IN (SELECT tour_id FROM default_tour_destination WHERE country_id = $country_id AND city_id = $city_id)";
        #
        $cond_hotel =   $cond;
        $cond_hotel .=  " AND country_id = $country_id AND city_id = $city_id";
        #
        $cond_guide  =   $cond;
        $cond_guide .=  " AND country_id = $country_id AND city_id = $city_id";
    }
    // Exciting trip
    $list_tour  =   $clsTour->getAll($cond_tour . $order_by2);
    $smarty->assign('list_tour', $list_tour);
    #
    // Hotel
    $list_hotel =   $clsHotel->getAll($cond_hotel . $order_by2 . $limit, $clsHotel->pkey);
    $smarty->assign('list_hotel', $list_hotel);
    #
    // List guide category
    $sql    =   "SELECT default_guidecat.guidecat_id, default_guidecat.title 
                FROM default_guidecat
                INNER JOIN default_guidecat_store ON default_guidecat_store.guidecat_id = default_guidecat.guidecat_id 
                WHERE default_guidecat_store.is_trash = 0 
                    AND default_guidecat_store.is_online = 1 
                    AND default_guidecat_store.country_id = $country_id
                ORDER BY default_guidecat.order_no ASC";
    $list_guide_country =   $dbconn->GetAll($sql);
    $smarty->assign('list_guide_country', $list_guide_country);
    #
    // Most read guide
    $most_list_guide    =   $clsGuide->getAll($cond_guide . $order_by3 . $limit4, $clsGuide->pkey);
    $smarty->assign('most_list_guide', $most_list_guide);
}
