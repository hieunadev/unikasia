<!-- Bắt buộc ko format code để tránh lỗi hiển thị -->
<section class="page_container att_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    <div class="att_main">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-9">
                    {$core->getBlock('des_travel_guide_side_mobile')}
                    <div class="att_content">{$clsCity->getContent($city_id)}</div>
                    {if $list_tour}
                    <div class="att_exciting_trip scroll_exciting_trip">
                        <div class="att_exciting_trip_title">
                            <h2>{$core->get_Lang('Exciting trip')}</h2>
                        </div>
                        <div class="att_exciting_trip_content">
                            {foreach from=$list_tour key=key item=item}
                            {assign var="TourID" value=$item.tour_id} {assign var="TourTitle" value=$clsTour->getTitle($TourID)}
                            {assign var="TourLink" value=$clsTour->getLink($TourID)}
                            {assign var="TourImage" value=$clsTour->getImage($TourID, 313, 216)}
                            <div class="att_exciting_trip_item">
                                <div class="row">
                                    <div class="col-12 col-lg-4">
                                        <a href="{$TourLink}" title="{$TourTitle}">
                                            <div class="att_exciting_trip_item_image">
                                                <img src="{$TourImage}" width="313" height="216" alt="{$TourTitle}">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-12 col-lg-5">
                                        <div class="att_exciting_trip_item_intro">
                                            <div class="att_exciting_trip_item_title">
                                                <h3 class="ellipsis_2_line">
                                                    <a href="{$TourLink}" title="{$TourTitle}">
                                                        {$TourTitle}
                                                    </a>
                                                </h3>
                                            </div>
                                            <div class="att_exciting_trip_item_rate">
                                                <div class="number">{$clsReviews->getReviews($TourID, 'avg_point', 'tour')}</div>
                                                <div class="title">{$clsReviews->getReviews($TourID, 'txt_review', 'tour')}</div>
                                                <div class="total">- {$clsReviews->getReviews($TourID, '', 'tour')} reviews</div>
                                            </div>
                                            <div class="att_exciting_trip_item_description">
                                                <div class="icon"><i class="fa-sharp fa-solid fa-quote-right"></i></div>
                                                <div class="description ellipsis_2_line">
                                                    {$clsTour->getTripOverview($TourID)}
                                                </div>
                                            </div>
                                            <div class="att_exciting_trip_item_place">
                                                <div class="icon"><i class="fa-sharp fa-light fa-location-dot"></i></div>
                                                <div class="description ellipsis_1_line">
                                                    {$core->get_Lang('Place')}:
                                                    {$clsTourDestination->getByCountry($TourID, 'city')}
                                                    {if $clsTourDestination->getByCountry($TourID, 'other_city')}
                                                    <button type="button" class="tooltips_tour" data-bs-toggle="tooltip" title="{$clsTourDestination->getByCountry($TourID, 'other_city')}">+{$clsTourDestination->getByCountry($TourID)}</button>
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="att_exciting_trip_item_trip">
                                                <div class="icon"><i class="fa-sharp fa-light fa-arrow-right-arrow-left"></i></div>
                                                <div class="description ellipsis_1_line">
                                                    {$core->get_Lang('Start/finish')}:
                                                    {$clsTourDestination->getByCountry($TourID, "startFinish")}
                                                </div>
                                            </div>
                                            <div class="att_exciting_trip_item_style">
                                                <div class="icon"><i class="fa-sharp fa-light fa-calendar-range"></i></div>
                                                <div class="description ellipsis_1_line">
                                                    {$core->get_Lang('Travel style')}:
                                                    {$clsTour->getListCatName($TourID)}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-3">
                                        <div class="att_exciting_trip_item_detail">
                                            <div class="unika_att_exciting">
                                                <div class="att_exciting_trip_item_date">
                                                    {if $item.duration_custom}
                                                    {$item.duration_custom}
                                                    {else}
                                                    {$item.number_day} {if $item.number_day lt 2}DAY {else} DAYS {/if}
                                                    {/if}
                                                </div>
                                                <div class="unika_att_exciting_item">
                                                    <div class="att_exciting_trip_item_price_old">
                                                        {$core->get_Lang('From')}
                                                        <span>${$item.min_price}</span>
                                                    </div>
                                                    <div class="att_exciting_trip_item_price_new">
                                                        {$core->get_Lang('US')}
                                                        <span>${$clsTour->getPriceAfterDiscount($TourID)}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="{$TourLink}" title="{$TourTitle}">
                                                {$core->get_Lang('View tour')} <i class="fa-sharp fa-light fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                            <a href="javascript:void(0);" class="top_att_btn_viewmore">{$core->get_Lang('View more')}</a>
                        </div>
                    </div>
                    {/if}
                    {if $list_hotel}
                    <div class="att_list_hotel scroll_hotel">
                        <div class="att_list_hotel_title">
                            <h2>{$core->get_Lang('Hotel')} {$clsCity->getTitle($city_id)}</h2>
                            <a href="/stay/vietnam?city={$city_id}" title="{$core->get_Lang('Hotel')} {$clsCity->getTitle($city_id)}" class="top_att_btn_exploremore">
                                {$core->get_Lang('Explore more')} <i class="fa-sharp fa-light fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="att_list_hotel_content">
                            <div class="row justify-content-center">
                                {foreach from=$list_hotel key=key item=item}
                                {assign var="HotelID" value=$item.hotel_id}
                                {assign var="HotelTitle" value=$clsHotel->getTitle($HotelID)}
                                {assign var="HotelLink" value=$clsHotel->getLink($HotelID)}
                                {assign var="HotelImage" value=$clsHotel->getImage($HotelID, 296, 200)}
                                <div class="col-12 col-sm-12 col-md-6 col-lg-4">
                                    <div class="att_hotel_content_item">
                                        <a href="{$HotelLink}" title="{$HotelTitle}">
                                            <div class="des_travel_guide_most_read_item_image">
                                                <img src="{$HotelImage}" width="296" height="200" alt="{$HotelTitle}">
                                            </div>
                                        </a>
                                        <div class="att_hotel_content_item_intro">
                                            <div class="att_hotel_content_item_title">
                                                <h3 class="ellipsis_2_line">
                                                    <a href="{$HotelLink}" title="{$HotelTitle}">
                                                        {$HotelTitle}
                                                    </a>
                                                </h3>
                                                <div class="att_hotel_content_item_star">
                                                    {$clsHotel->getStarNumber($HotelID)}
                                                </div>
                                            </div>
                                            <div class="att_hotel_content_item_type">
                                                <div class="icon"><i class="fa-sharp fa-light fa-house"></i></div>
                                                <div class="description ellipsis_1_line">
                                                    {$clsHotel->getTypeHotel($HotelID)}
                                                </div>
                                            </div>
                                            <div class="att_hotel_content_item_place">
                                                <div class="icon"><i class="fa-sharp fa-solid fa-location-dot"></i></div>
                                                <div class="description ellipsis_1_line">
                                                    {$clsHotel->getAddress($HotelID)}
                                                </div>
                                            </div>
                                            <div class="att_hotel_content_item_rate">
                                                <div class="number">{$clsReviews->getReviews($HotelID, 'avg_point', 'hotel')}</div>
                                                <div class="title">{$clsReviews->getReviews($HotelID, 'txt_review', 'hotel')}</div>
                                                <div class="total">({$clsReviews->getReviews($HotelID, '', 'hotel')} reviews)</div>
                                            </div>
                                            <div class="att_hotel_content_item_detail">
                                                <span class="info">{$core->get_Lang('Avg price per night')}</span>
                                                <span class="price_title">{$core->get_Lang('US')}</span>
                                                <span class="price_number">
                                                    {if $clsHotel->getPriceAvg($HotelID)}
                                                    $<span>{$clsHotel->getPriceAvg($HotelID)}</span>
                                                    {else}
                                                    {$core->get_Lang('Contact us')}
                                                    {/if}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $list_guide_country}
                        {foreach from=$list_guide_country key=key item=item}
                            {if $item.title eq 'Places To Go'}
                                <div class="att_list_placetogo scroll_guide_{$item.guidecat_id}">
                                    <div class="att_list_placetogo_title">
                                        <h2>{$core->get_Lang('Place to go')} {$clsCity->getTitle($city_id)}</h2>
                                        <a href="{$clsGuide->getLinkGuideCat($country_slug, $clsGuideCat->getSlug($item.guidecat_id), $item.guidecat_id)}" title="{$core->get_Lang('Place to go')} {$clsCity->getTitle($city_id)}" class="top_att_btn_exploremore">
                                            {$core->get_Lang('Explore more')} <i class="fa-sharp fa-light fa-arrow-right"></i>
                                        </a>
                                    </div>
                                    <div class="att_list_placetogo_content">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-5 col-lg-6">
                                                <div class="box_left">
                                                    {foreach from=$item.list_guide key=k item=i}
                                                        {if $k == 0}
                                                            {assign var="PlaceToGoID" value=$i.guide_id}
                                                            {assign var="PlaceToGoTitle" value=$clsGuide->getTitle($PlaceToGoID)}
                                                            {assign var="PlaceToGoLink" value=$clsGuide->getLink2($PlaceToGoID)}
                                                            {assign var="PlaceToGoImage" value=$clsGuide->getImage($PlaceToGoID, 405, 250)}
                                                            {assign var="PlaceToGoIntro" value=$clsGuide->getIntro($PlaceToGoID)}
                                                            <div class="att_list_placetogo_item">
                                                                <a href="{$PlaceToGoLink}" title="{$PlaceToGoTitle}">
                                                                    <div class="att_list_placetogo_item_image">
                                                                        <img src="{$PlaceToGoImage}" width="405" height="250" alt="{$PlaceToGoTitle}">
                                                                    </div>
                                                                </a>
                                                                <div class="att_list_placetogo_item_title">
                                                                    <h3 class="ellipsis_1_line"><a href="{$PlaceToGoLink}" title="{$PlaceToGoTitle}">{$PlaceToGoTitle}</a></h3>
                                                                </div>
                                                                <div class="att_list_placetogo_item_description ellipsis_3_line">
                                                                    {$PlaceToGoIntro}
                                                                </div>
                                                            </div>
                                                        {/if}
                                                    {/foreach}
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-7 col-lg-6">
                                                <div class="box_right">
                                                    {foreach from=$item.list_guide key=k item=i}
                                                    {if $k > 0 && $k < 4}
                                                    {assign var="PlaceToGoID" value=$i.guide_id}
                                                    {assign var="PlaceToGoTitle" value=$clsGuide->getTitle($PlaceToGoID)}
                                                    {assign var="PlaceToGoLink" value=$clsGuide->getLink2($PlaceToGoID)}
                                                    {assign var="PlaceToGoImage" value=$clsGuide->getImage($PlaceToGoID, 145, 90)}
                                                    {assign var="PlaceToGoIntro" value=$clsGuide->getIntro($PlaceToGoID)}
                                                    <div class="att_list_placetogo_item">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-12 col-md-4 col-lg-4">
                                                                <a href="{$PlaceToGoLink}" title="{$PlaceToGoTitle}">
                                                                    <div class="att_list_placetogo_item_image">
                                                                        <img src="{$PlaceToGoImage}" width="145" height="90" alt="{$PlaceToGoTitle}">
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="col-12 col-sm-12 col-md-8 col-lg-8">
                                                                <div class="att_list_placetogo_item_title">
                                                                    <h3 class="ellipsis_1_line"><a href="{$PlaceToGoLink}" title="{$PlaceToGoTitle}">{$PlaceToGoTitle}</a></h3>
                                                                </div>
                                                                <div class="att_list_placetogo_item_description ellipsis_3_line">
                                                                    {$PlaceToGoIntro}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {/if}
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {else}
                                <div class="att_list_cuisine scroll_guide_{$item.guidecat_id}">
                                    <div class="att_list_cuisine_title">
                                        <h2>{$core->get_Lang({$item.title})} {$clsCity->getTitle($city_id)}</h2>
                                        <a href="{$clsGuide->getLinkGuideCat($country_slug, $clsGuideCat->getSlug($item.guidecat_id), $item.guidecat_id)}" title="{$core->get_Lang('Cuisine')} {$clsCity->getTitle($city_id)}" class="top_att_btn_exploremore">
                                            {$core->get_Lang('Explore more')} <i class="fa-sharp fa-light fa-arrow-right"></i>
                                        </a>
                                    </div>
                                    <div class="att_list_cuisine_content">
                                        <div class="owl-carousel owl-theme att_cuisine_list_item">
                                            {foreach from=$item.list_guide key=k item=i}
                                            {assign var="GuideCuisineID" value=$i.guide_id}
                                            {assign var="GuideCuisineTitle" value=$clsGuide->getTitle($GuideCuisineID)}
                                            {assign var="GuideCuisineLink" value=$clsGuide->getLink2($GuideCuisineID)}
                                            {assign var="GuideCuisineImage" value=$clsGuide->getImage($GuideCuisineID, 292, 216)}
                                            {assign var="GuideCuisineIntro" value=$clsGuide->getIntro($GuideCuisineID)}
                                            <div class="item" data-merge="1">
                                                <div class="att_cuisine_item">
                                                    <a href="{$GuideCuisineLink}" title="{$GuideCuisineTitle}">
                                                        <div class="att_list_placetogo_item_image">
                                                            <img src="{$GuideCuisineImage}" alt="{$GuideCuisineTitle}" width="292" height="216" loading="lazy" />
                                                        </div>
                                                    </a>
                                                    <div class="att_cuisine_item_intro">
                                                        <div class="att_cuisine_item_title">
                                                            <h3 class="ellipsis_1_line"><a href="{$GuideCuisineLink}" title="{$GuideCuisineTitle}">{$GuideCuisineTitle}</a></h3>
                                                        </div>
                                                        <div class="att_cuisine_item_description ellipsis_4_line">
                                                            {$GuideCuisineIntro}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    {/if}
                </div>
                <div class="col-12 col-sm-12 col-md-3">
                    {$core->getBlock('des_travel_guide_side')}
                </div>
            </div>
        </div>
    </div>
</section>

{literal}
<script>
    if ($('.att_cuisine_list_item').length > 0) {
        var $owl = $('.att_cuisine_list_item');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 36,
            nav: true,
            navText: ["<i class='fa-solid fa-angle-left'></i>", "<i class='fa-solid fa-angle-right'></i>"],
            dots: false,
            // autoplay: false,
            // autoplayTimeout:3000,	
            // animateOut: 'fadeOut',
            // animateIn: 'fadeIn',
            merge: true,
            autoHeight: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1.3,
                    nav: false,
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        });
    }

    if ($('.att_travel_guide_list_item').length > 0) {
        var $owl = $('.att_travel_guide_list_item');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 36,
            nav: true,
            navText: ["<i class='fa-solid fa-angle-left'></i>", "<i class='fa-solid fa-angle-right'></i>"],
            dots: false,
            // autoplay: false,
            // autoplayTimeout:3000,	
            // animateOut: 'fadeOut',
            // animateIn: 'fadeIn',
            merge: true,
            autoHeight: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1.3,
                    nav: false,
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        });
    }

    // View more/less tour
    $('.att_exciting_trip_item:gt(2)').hide();
    $('.top_att_btn_viewmore').on('click', function(e) {
        e.preventDefault();
        $('.att_exciting_trip_item:gt(2)').toggle();
        const buttonText = $(this).text();
        $(this).text(buttonText === 'View more' ? 'View less' : 'View more');
    });
</script>
{/literal}