<section class="page_container trvg_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    {$core->getBlock('des_tailor_made_travel')}
    <div class="des_tailor_detail_travel_guide">
        <div class="container">
            <div class="row unika_des_travel_guide">
                <div class="col-12 col-sm-12 col-md-12 col-lg-9">
                    <div class="des_travel_guide_list">
                        {if $topatt_intro}
                        <div class="des_tailor_detail_travel_guide_description">
                            {$topatt_intro}
                        </div>
                        {/if}
                        <div class="row">
                            {if $listTopAtt}
                            {foreach from=$listTopAtt key=key item=item}
                            {assign var="CityID" value=$item.city_id}
                            {assign var="CityTitle" value=$clsCity->getTitle($CityID)}
                            {assign var="CityLink" value=$clsCity->getLink2($CityID)}
                            <div class="col-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="des_travel_guide_item">
                                    <div class="des_travel_guide_image">
                                        <img src="{$clsCity->getImage($CityID, 292, 219)}" alt="{$CityTitle}" width="292" height="219">
                                        <a href="{$CityLink}" class="des_travel_guide_link" title="{$CityTitle}">
                                            {$core->get_Lang('SEE DETAILS')} <i class="fa-sharp fa-regular fa-arrow-right" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                    <div class="des_travel_guide_intro">
                                        <div class="des_travel_guide_title">
                                            <h3><a href="{$CityLink}" title="{$CityTitle}">{$CityTitle}</a>
                                            </h3>
                                        </div>
                                        <div class="des_travel_guide_place">
                                            <i class="fa-sharp fa-light fa-location-dot"></i>
                                            {$country_title}
                                        </div>
                                        <div class="des_travel_guide_description">
                                            {$clsCity->getIntro($CityID)}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                            {/if}
                        </div>
                    </div>
                    {if $page_view}
                    <div class="des_travel_guide_paginate">
                        {$page_view}
                    </div>
                    {/if}

                    {if $arr_recent_view}
                    <div class="des_travel_guide_recent_view">
                        <div class="des_travel_guide_recent_view_title">
                            <h2>{$core->get_Lang('Recently viewed')}</h2>
                        </div>
                        <div class="des_travel_guide_recent_view_content">
                            <div class="owl-carousel owl-theme trvg_list_guidecat_carousel att_list_recent_carousel">
                                {foreach from=$arr_recent_view key=key item=item}
                                {assign var="CityID" value=$item}
                                {assign var="CityTitle" value=$clsCity->getTitle($CityID)}
                                {assign var="CityLink" value=$clsCity->getLink2($CityID)}
                                <div class="item des_travel_guide_item" data-merge="1">
                                    <div class="des_travel_guide_image">
                                        <img src="{$clsCity->getImage($CityID, 292, 219)}" alt="{$CityTitle}" width="292" height="219">
                                        <a href="{$CityLink}" class="des_travel_guide_link" title="{$CityTitle}">
                                            {$core->get_Lang('SEE DETAILS')} <i class="fa-sharp fa-regular fa-arrow-right" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                    <div class="des_travel_guide_intro">
                                        <div class="des_travel_guide_title">
                                            <h3><a href="{$CityLink}" title="{$CityTitle}">{$CityTitle}</a>
                                            </h3>
                                        </div>
                                        <div class="des_travel_guide_place">
                                            <i class="fa-sharp fa-light fa-location-dot"></i>
                                            {$country_title}
                                        </div>
                                        <div class="des_travel_guide_description">
                                            {$clsCity->getIntro($CityID)}
                                        </div>
                                    </div>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    {/if}
                </div>
                <div class="col-12 col-sm-12 col-md-12 col-lg-3">
                    {$core->getBlock('des_travel_guide_side')}
                </div>
                {*{if $deviceType != "computer"}
                <div class="owl-carousel owl-theme gui_exciting_trip">
                    {if $arr_tour_country}
                    {foreach from=$arr_tour_country key=key item=item}
                    {assign var="tourID" value=$item.tour_id}
                    <div class="des_travel_guide_exciting_trip_item">
                        <div class="des_travel_guide_exciting_trip_image">
                            <a href="{$clsTour->getLink($tourID)}" title="{$clsTour->getTitle($tourID)}">
                                <img src="{$clsTour->getImage($tourID, 296, 200)}" alt="{$clsTour->getTitle($tourID)}" width="296" height="200">
                            </a>
                        </div>
                        <div class="des_travel_guide_exciting_trip_item_title">
                            <h3><a href="{$clsTour->getLink($tourID)}" title="{$clsTour->getTitle($tourID)}">{$clsTour->getTitle($tourID)}</a></h3>
                        </div>
                        <div class="des_travel_guide_exciting_trip_item_content">
                            <div class="des_travel_guide_exciting_trip_rate">
                                <div class="des_travel_guide_exciting_trip_rate_score">
                                    {$clsReviews->getReviews($tourID, 'avg_point', 'tour')}
                                </div>
                                <div class="des_travel_guide_exciting_trip_rate_title">
                                    {$clsReviews->getReviews($tourID, 'txt_review', 'tour')}
                                </div>
                                <div class="des_travel_guide_exciting_trip_rate_total">
                                    - {$clsReviews->getReviews($tourID, '', 'tour')} reviews
                                </div>
                            </div>
                            <div class="des_travel_guide_exciting_trip_place">
                                <i class="fa-light fa-location-dot"></i>
                                Place: {$clsTourDestination->getByCountry($tourID, 'city')}
                                {if $clsTourDestination->getByCountry($tourID) > 0}
                                <button type="button" class="tooltips_tour" data-bs-toggle="tooltip" title="{$clsTourDestination->getByCountry($tourID, 'other_city')}">+{$clsTourDestination->getByCountry($tourID)}</button>
                                {/if}
                            </div>
                            <div class="des_travel_guide_exciting_trip_description">
                                {$clsTour->getTripOverview($tourID)}
                            </div>
                            <div class="des_travel_guide_exciting_trip_detail">
                                <div class="box_left">
                                    <p>From</p>
                                    <span class="price_type">US</span> <span class="price">${$item.min_price}</span>
                                </div>
                                <div class="box_right">
                                    <a href="{$clsTour->getLink($tourID)}" title="{$clsTour->getTitle($tourID)}">View tour <i class="fa-light fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    {/if}
                </div>
                {/if}*}
            </div>
        </div>
    </div>
    {$core->getBlock('why_choose_us')}
    {$core->getBlock('customer_review')}
    {$core->getBlock('also_like')}
</section>

{literal}
<script>
    if ($('.att_list_recent_carousel').length > 0) {
        var $owl = $('.att_list_recent_carousel');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 37,
            nav: false,
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
                    items: 3
                },
                1000: {
                    items: 3
                }
            }
        });
    }
    if ($('.gui_exciting_trip').length > 0) {
        var $owl = $('.gui_exciting_trip');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 30,
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
                    nav: false,
                    items: 1.3,
                    margin: 15,
                },
                600: {
                    nav: false,
                    items: 2.3
                },
                991: {
                    nav: false,
                    items: 2.3
                }
            }
        });
    }
</script>
{/literal}