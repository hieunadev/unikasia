<?
global $core, $smarty, $clsISO, $assign_list;
#
$clsCountry         =   new Country();
$smarty->assign('clsCountry', $clsCountry);
$clsTourCategory    =   new TourCategory();
$smarty->assign('clsTourCategory', $clsTourCategory);
$clsGuideCat        =   new GuideCat();
$smarty->assign('clsGuideCat', $clsGuideCat);
$clsGuide           =   new Guide();
$smarty->assign('clsGuide', $clsGuide);
$clsCruiseCat       =   new CruiseCat();
$smarty->assign('clsCruiseCat', $clsCruiseCat);
$clsCruiseDestination   =   new CruiseDestination();
$smarty->assign('clsCruiseDestination', $clsCruiseDestination);
$clsCity            =   new City();
$smarty->assign('clsCity', $clsCity);
#
$show   =   isset($_GET['show']) ? $_GET['show'] : '';
$smarty->assign('show', $show);
#
$country_slug   =   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
if (!empty($country_slug)) {
    $country_id     =   $clsCountry->getBySlug($country_slug);
    $smarty->assign('country_id', $country_id);
    $country_info   =   $clsCountry->getOne($country_id);
    $smarty->assign('country_info', $country_info);
}
#
$guidecat_id    =   isset($_GET['guidecat_id']) ? $_GET['guidecat_id'] : '';
if (!empty($guidecat_id)) {
    $guidecat_info  =   $clsGuideCat->getOne($guidecat_id);
    $guidecat_title =   $guidecat_info['title'];
    $smarty->assign('guidecat_title', $guidecat_title);
}
#
$guide_id   =   isset($_GET['guide_id']) ? $_GET['guide_id'] : '';
if (!empty($guide_id)) {
    $guide_info  =   $clsGuide->getOne($guide_id);
    // Tên guide detail
    $guide_title =   $guide_info['title'];
    $smarty->assign('guide_title', $guide_title);
    // Tên country guide detail
    $guide_country_title =   $clsCountry->getTitle($guide_info['country_id']);
    $smarty->assign('guidecat_country_title', $guide_country_title);
    // Tên category guide detail
    $guide_guidecat_title    =   $clsGuideCat->getTitle($guide_info['cat_id']);
    $smarty->assign('guidecat_guidecat_title', $guide_guidecat_title);
}
#
$keyword    =   isset($_GET['keyword']) ? $_GET['keyword'] : '';
$smarty->assign('keyword', $keyword);
#
$guidetag   =   isset($_GET['slug']) ? $_GET['slug'] : '';
$smarty->assign('guidetag', $guidetag);
#
if ($show === 'CruiseCatCountry') {
    $cruise_cat_slug    =   isset($_GET['slug_cat']) ? $_GET['slug_cat'] : '';
    $cruise_cat_id      =   $clsCruiseCat->getBySlug($cruise_cat_slug);
    #
    if (!empty($cruise_cat_id)) {
        $smarty->assign('cruise_cat_id', $cruise_cat_id);
    }
} elseif ($show === 'attractionCountry') {
    $country_slug   =   isset($_GET['slug_country']) ? $_GET['slug_country'] : '';
    $country_id     =   $clsCountry->getBySlug($country_slug);
    $smarty->assign('country_id', $country_id);
    #
    $city_slug      =   isset($_GET['slug_attraction']) ? $_GET['slug_attraction'] : '';
    $city_id        =   $clsCity->getBySlug($city_slug);
    $smarty->assign('city_id', $city_id);
}
