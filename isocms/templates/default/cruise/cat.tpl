<!-- Không format code để tránh hiển thị lỗi -->
<div class="page_container cru_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    <div class="container unika_cruises_container">
        <div class="d-flex justify-content-center">
            <div class="cruise-content  d-flex justify-content-between  align-items-start">
                <!-- Cruise Filter -->
                <div class="sort_filter d-flex flex-column ">
                    <div class="title  d-flex justify-content-between align-items-center ">
                        <h2>{$core->get_Lang('Sort & filter')}</h2>
                    </div>
                    <div class="list_sort_filter">
                        <div class="d-flex flex-column div_sort_filter">
                            <div class="sort_filter_mobile justify-content-between align-items-center">
                                <h2 class="title_filter ">
                                    {$core->get_Lang('Sort & filter')}
                                </h2>
                                <button class="unika_filter_mobile_close div_img">
                                    <i class="fa-sharp fa-light fa-xmark"></i>
                                </button>
                            </div>
                            <form action="" id="filters_form_cruise" method="post">
                                <input type="hidden" name="action" value="filters_form_cruise" />
                                <div class="item_sort_filter destinations d-flex flex-column  justify-content-start">
                                    <div class="title_filter">
                                        {$core->get_Lang('Destinations')}
                                    </div>
                                    <div class="list_item">
                                        {if $list_country}
                                            {foreach from=$list_country key=key item=item}
                                                {assign var="CountryID" value=$item.country_id}
                                                {assign var="CountryTitle" value=$clsCountry->getTitle($CountryID)}
                                                {assign var="CountryLink" value=$clsCountry->getLink($CountryID, 'Cruise')}
                                                <label class="item_radio">{$CountryTitle}
                                                    <input type="radio" class="typeSearch" name="country_id" id="radio-{$CountryTitle}" value="{$CountryID}" {if $CountryID==$country_id} checked{/if} data-link="{$CountryLink}" />
                                                    <span class="checkmark"></span>
                                                </label>
                                            {/foreach}
                                        {/if}
                                    </div>
                                </div>
                                <div class="item_sort_filter duration d-flex justify-content-start flex-column ">
                                    <div class="title_filter">
                                        {$core->get_Lang('Duration')}
                                    </div>
                                    <div class="list_item">
                                        {if $list_duration}
                                            {foreach from=$list_duration key=key item=item}
                                                <label class="item_checkbox">
                                                {if $item eq 1}
                                                    {$item} day
                                                {else}
                                                    {$item} days
                                                {/if}
                                                    <input type="checkbox" class="typeSearch" name="duration_filter_id[]" value="{$item}" {if $clsISO->checkInArray($duration_filter_id,
                                                    $item)}checked{/if}/>
                                                    <span class="checkmark"></span>
                                                </label>
                                            {/foreach}
                                        {/if}
                                    </div>
                                </div>
                                <div class="item_sort_filter price d-flex flex-column  justify-content-start">
                                    <div class="title_filter">
                                        {$core->get_Lang('Price')}
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between flex-column filter_price">
                                        <div class="value_ranges d-flex justify-content-between flex-wrap align-items-center  width-100">
                                            <div class="item_value">
                                                <span>$</span>
                                                <input inputmode="numeric" pattern="[0-9]*" id="min_price" name="min_price" value="{$min_price}">
                                            </div>
                                            <div class="item_value">
                                                <span>$</span>
                                                <input inputmode="numeric" pattern="[0-9]*" id="max_price" name="max_price" value="{$max_price}" />
                                            </div>
                                        </div>
                                        <input type="text" id="price">
                                        <div id="cru_slider"></div>
                                    </div>
                                </div>
                                <div class="item_sort_filter property_rating d-flex flex-column  justify-content-start">
                                    <div class="title_filter">
                                        {$core->get_Lang('Property rating')}
                                    </div>
                                    <div class="list_item list_rank_star">
                                        <label class="item_checkbox">
                                            {$core->get_Lang('Un Rated')}
                                            <input type="checkbox" class="typeSearch" name="rating_filter_id[]" value="1" {if $clsISO->checkInArray($rating_filter_id, 1)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        {section name=star start=3 loop=7 step=1}
                                        <label class="item_checkbox">
                                            {$smarty.section.star.index} {$core->get_Lang('star')}
                                            <input type="checkbox" class="typeSearch" name="rating_filter_id[]" value="{$smarty.section.star.index}" {if $clsISO->checkInArray($rating_filter_id,
                                            $smarty.section.star.index)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        {/section}
                                    </div>
                                </div>
                                <div class="item_sort_filter cruises_type d-flex flex-column  justify-content-start">
                                    <div class="title_filter">
                                        {$core->get_Lang('Cruises type')}
                                    </div>
                                    <div class="d-flex flex-column justify-content-start">
                                        <div class="list_item">
                                            {if $arr_cruise_cat_county}
                                                {foreach from=$arr_cruise_cat_county key=key item=item}
                                                    {assign var="CatID" value=$item.cat_id}
                                                    {assign var="CatTitle" value=$clsCruiseCat->getTitle($CatID)}
                                                    <label class="item_checkbox checkSizeFilter">
                                                        {$CatTitle}
                                                            <input type="checkbox" class="typeSearch" name="type_filter_id[]" value="{$CatID}" {if $cruise_cat_id ne '' && $cruise_cat_id eq $CatID} checked {else} {if $clsISO->checkInArray($type_filter_id, $CatID)}checked{/if}{/if} />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                                <div class="item_sort_filter cabins d-flex flex-column  justify-content-start">
                                    <div class="title_filter">
                                        {$core->get_Lang('Number of cabins')}
                                    </div>
                                    <div class="list_item">
                                        <label class="item_checkbox">
                                            {$core->get_Lang('1 - 5 cabins')}
                                            <input type="checkbox" class="typeSearch" name="cabin_filter_id[]" value="1" {if $clsISO->checkInArray($cabin_filter_id, 1)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="item_checkbox">
                                            {$core->get_Lang('6 - 10 cabins')}
                                            <input type="checkbox" class="typeSearch" name="cabin_filter_id[]" value="2" {if $clsISO->checkInArray($cabin_filter_id, 2)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="item_checkbox">
                                            {$core->get_Lang('11 - 20 cabins')}
                                            <input type="checkbox" class="typeSearch" name="cabin_filter_id[]" value="3" {if $clsISO->checkInArray($cabin_filter_id, 3)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="item_checkbox">
                                            {$core->get_Lang('21 - 30 cabins')}
                                            <input type="checkbox" class="typeSearch" name="cabin_filter_id[]" value="4" {if $clsISO->checkInArray($cabin_filter_id, 4)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="item_checkbox">
                                            {$core->get_Lang('31+ cabins')}
                                            <input type="checkbox" class="typeSearch" name="cabin_filter_id[]" value="5" {if $clsISO->checkInArray($cabin_filter_id, 5)}checked{/if}/>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Cruise Content -->
                <div class="cruises">
                    <!-- Cruise List -->
                    <div class="uni_cruise_list">
                        {if $cruise_cat_id ne ''}
                        <div class="cruises_title d-flex flex-column ">
                            <h2>{$clsCruiseCat->getTitle($cruise_cat_id)}: {$totalRecord} cruises found</h2>
                            <span>
                                100% customizable {$clsCruiseCat->getTitle($cruise_cat_id)}. Idea to compose your trip
                                as you wish
                            </span>
                        </div>
                        {else}
                        <div class="cruises_title d-flex flex-column ">
                            <h2>Total: {$totalRecord} cruises found</h2>
                            <span>
                                100% customizable. Idea to compose your trip as you wish
                            </span>
                        </div>
                        {/if}
                        <div class="list_cruises d-flex flex-column ">
                            {if $listCruise}
                                {foreach from=$listCruise key=key item=item}
                                    {assign var="CruiseID" value=$item.cruise_id}
                                    {assign var="CruiseTitle" value=$clsCruise->getTitle($CruiseID)}
                                    {assign var="CruiseLink" value=$clsCruise->getLink2($CruiseID)}
                                    <div class="item_cruises d-flex  justify-content-between align-items-start">
                                        <a href="{$CruiseLink}" title="{$CruiseTitle}" class="div_img img_cruises">
                                            <img src="{$clsCruise->getImage($CruiseID, 353, 244)}" alt="{$CruiseTitle}" width="353" height="244" />
                                        </a>
                                        <div class="content_cruise d-flex ">
                                            <div class="content d-flex flex-column ">
                                                <div class="d-flex flex-column unika_title_star">
                                                    <h3>
                                                        <a href="{$CruiseLink}" class="title ellipsis_2" title="{$CruiseTitle}">
                                                            {$CruiseTitle}
                                                        </a>
                                                    </h3>
                                                    <div class="rating d-flex justify-content-start  align-items-center">
                                                        {if $item.star_number >= 3}
                                                        {section name=i loop=$item.star_number}
                                                        <div class="div_img">
                                                            <i class="fa-sharp fa-solid fa-star"></i>
                                                        </div>
                                                        {/section}
                                                        {/if}
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-start align-items-start ">
                                                    <div class="div_img img_icon_content">
                                                        <i class="fa-sharp fa-solid fa-location-dot"></i>
                                                    </div>
                                                    <div class="ellipsis_2 txt_content cru_place_content">
                                                        <span>Place to visit:</span>
                                                        {$item.place_visit}
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-start align-items-center ">
                                                    <div class="div_img img_icon_content">
                                                        <i class="fa-light fa-door-open"></i>
                                                    </div>
                                                    <div class="d-flex  justify-content-start ellipsis_1 txt_content">
                                                        <span>Cabin:</span> {$item.total_cabin}
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-start align-items-center ">
                                                    <div class="div_img img_icon_content">
                                                        <img src="{URL_IMAGES}/uni_van/images/cruises/material.svg" alt="Icon" />
                                                    </div>
                                                    <div class="d-flex justify-content-start ellipsis_1 txt_content">
                                                        <span>Material:</span> {$clsCruiseProperty->getTitle($item.material)}
                                                    </div>
                                                </div>
                                                <div class="other d-flex flex-column">
                                                    <div class="d-flex justify-content-start align-items-center ">
                                                        <div class="box_inclusion">
                                                            {$clsCruise->getInclusion($CruiseID)}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="highlights d-flex justify-content-start align-items-end flex-wrap">
                                                    <span>Highlights</span>
                                                    <div class="list_icon d-flex justify-content-start align-items-end flex-wrap">
                                                        {assign var="arr_CruiseFa" value=$clsCruise->getCruiseFa($CruiseID, 'CruiseFacilities')}
                                                        {if $arr_CruiseFa}
                                                        {assign var="count" value=0}
                                                        {foreach from=$arr_CruiseFa key=k item=i}
                                                        <div class="div_img img_highlight img_highlight_1">
                                                            <img src="{$i.image}" alt="Icon" />
                                                            <span class="txt_icon">{$i.title}</span>
                                                        </div>
                                                        {assign var="count" value=$count+1}
                                                        {if $count >= 5}
                                                        {break}
                                                        {/if}
                                                        {/foreach}
                                                        {if $arr_CruiseFa|@count > 5}
                                                        <div class="icon_other">+{$arr_CruiseFa|@count-5}</div>
                                                        <div class="unika_icon_more">
                                                            <div class="unika_icon_more_div">
                                                                {foreach from=$arr_CruiseFa key=k1 item=i1 name=RemaingLoop}
                                                                {if $smarty.foreach.RemaingLoop.index >= 5}
                                                                <div class="div_img img_highlight">
                                                                    <img src="{$i1.image}" alt="Icon" />
                                                                    <span class="txt_icon">{$i1.title}</span>
                                                                </div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                        {/if}
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="money_cruise d-flex flex-column align-items-end justify-content-between">
                                                <div class="reviews d-flex justify-content-end align-items-end flex-column">
                                                    <div class="d-flex justify-content-end align-items-center item_evaluate">
                                                        <div class="d-flex flex-column justify-content-end ">
                                                            <span class="span_review">
                                                                {$clsReviews->getReviews($CruiseID, 'txt_review', 'cruise')}
                                                            </span>
                                                            <span class="span_quantity">
                                                                ({$clsReviews->getReviews($CruiseID, '', 'cruise')} reviews)
                                                            </span>
                                                        </div>
                                                        <div class="average_reviews d-flex align-items-center justify-content-center">
                                                            {$clsReviews->getReviews($CruiseID, 'avg_point', 'cruise')}
                                                        </div>
                                                    </div>
                                                    <div class="price d-flex flex-column">
                                                        <span class="txt_money">Price per person from</span>
                                                        <div class="txt_money_cruise d-flex justify-content-end align-items-end">
                                                            <span>
                                                                {if $clsCruiseItinerary->getMinPriceItinerary($CruiseID) eq 0}
                                                                {$core->get_Lang('Contact')}
                                                                {else}
                                                                US $ {$clsCruiseItinerary->getMinPriceItinerary($CruiseID)}
                                                                {/if}
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="{$CruiseLink}" class="btn_explore d-flex justify-content-center align-items-center" title="{$CruiseTitle}">
                                                    Explore
                                                    <div class="div_img">
                                                        <i class="fa-sharp fa-light fa-arrow-right"></i>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                        {if $page_view}
                        <div class="des_travel_guide_paginate">
                            {$page_view}
                        </div>
                        {/if}
                    </div>
                    <!-- Cruise Recently -->
                    <div class="recently-viewed d-flex flex-column justify-content-start align-items-start ">
                        <h3 class="title_recently">
                            {$core->get_Lang('Recently viewed')}
                        </h3>
                        <div class="recently_viewed swiper">
                            <div class="swiper-wrapper">
                                <div class="item_recently_viewed swiper-slide">
                                    <div class="item-recently_viewed d-flex flex-column ">
                                        <a class="div_img img_item">
                                            <img src="{URL_IMAGES}/uni_van/images/interested1.png" width="296" height="200" alt="Image" />
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <h3>
                                                <a class=" ellipsis_2  title_recently_viewed" href="#">
                                                    Waldschenke Stendenitz Übernachten im Wald am See
                                                </a>
                                            </h3>
                                            <div class="rating d-flex align-items-center ">
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_recently_viewed">
                                                    <img src="{URL_IMAGES}/uni_van/images/location.svg" alt="Icon" />
                                                </div>
                                                <div class="d-flex  ellipsis_3 txt_recently_viewed">
                                                    <span>Place to visit: </span>
                                                    Hanoi - Lan Ha Bay - Dark & Light Cave - Ao Ech Area -
                                                    Halong International Cruise Port - Hanoi
                                                </div>
                                            </div>
                                            <div class="viewed d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center">
                                                    4.5
                                                </div>
                                                <span class="span1">Very good</span>
                                                <span class="span2">(9 reviews)</span>
                                            </div>
                                            <div class="money d-flex justify-content-end align-items-end flex-wrap">
                                                <span class="txt_money_viewed">Price per person from</span>
                                                <div class="infor_money d-flex justify-content-end align-items-end flex-wrap ">
                                                    <span class="type_money">US</span>
                                                    <span class="cuise_moeny_viewed">$650</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="item_recently_viewed swiper-slide">
                                    <div class="item-recently_viewed d-flex flex-column ">
                                        <a class="div_img img_item">
                                            <img src="{URL_IMAGES}/uni_van/images/interested1.png" width="296" height="200" alt="Image" />
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <h3>
                                                <a class=" ellipsis_2  title_recently_viewed" href="#">
                                                    Waldschenke Stendenitz Übernachten im Wald am See
                                                </a>
                                            </h3>
                                            <div class="rating d-flex align-items-center ">
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_recently_viewed">
                                                    <img src="{URL_IMAGES}/uni_van/images/location.svg" alt="Icon" />
                                                </div>
                                                <div class="d-flex  ellipsis_3 txt_recently_viewed">
                                                    <span>Place to visit: </span>
                                                    Hanoi - Lan Ha Bay - Dark & Light Cave - Ao Ech Area -
                                                    Halong International Cruise Port - Hanoi
                                                </div>
                                            </div>
                                            <div class="viewed d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center">
                                                    4.5
                                                </div>
                                                <span class="span1">Very good</span>
                                                <span class="span2">(9 reviews)</span>
                                            </div>
                                            <div class="money d-flex justify-content-end align-items-end flex-wrap">
                                                <span class="txt_money_viewed">Price per person from</span>
                                                <div class="infor_money d-flex justify-content-end align-items-end flex-wrap ">
                                                    <span class="type_money">US</span>
                                                    <span class="cuise_moeny_viewed">$650</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item_recently_viewed swiper-slide">
                                    <div class="item-recently_viewed d-flex flex-column ">
                                        <a class="div_img img_item">
                                            <img src="{URL_IMAGES}/uni_van/images/interested1.png" width="296" height="200" alt="Image" />
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <h3>
                                                <a class=" ellipsis_2  title_recently_viewed" href="#">
                                                    Waldschenke Stendenitz Übernachten im Wald am See
                                                </a>
                                            </h3>
                                            <div class="rating d-flex align-items-center ">
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_recently_viewed">
                                                    <img src="{URL_IMAGES}/uni_van/images/location.svg" alt="Icon" />
                                                </div>
                                                <div class="d-flex  ellipsis_3 txt_recently_viewed">
                                                    <span>Place to visit: </span>
                                                    Hanoi - Lan Ha Bay - Dark & Light Cave - Ao Ech Area -
                                                    Halong International Cruise Port - Hanoi
                                                </div>
                                            </div>
                                            <div class="viewed d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center">
                                                    4.5
                                                </div>
                                                <span class="span1">Very good</span>
                                                <span class="span2">(9 reviews)</span>
                                            </div>
                                            <div class="money d-flex justify-content-end align-items-end flex-wrap">
                                                <span class="txt_money_viewed">Price per person from</span>
                                                <div class="infor_money d-flex justify-content-end align-items-end flex-wrap ">
                                                    <span class="type_money">US</span>
                                                    <span class="cuise_moeny_viewed">$650</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item_recently_viewed swiper-slide">
                                    <div class="item-recently_viewed d-flex flex-column ">
                                        <a class="div_img img_item">
                                            <img src="{URL_IMAGES}/uni_van/images/interested1.png" width="296" height="200" alt="Image" />
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <h3>
                                                <a class=" ellipsis_2  title_recently_viewed" href="#">
                                                    Waldschenke Stendenitz Übernachten im Wald am See
                                                </a>
                                            </h3>
                                            <div class="rating d-flex align-items-center ">
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                                <div class="div_img">
                                                    <img src="{URL_IMAGES}/uni_van/images/star.svg" alt="Icon" />
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_recently_viewed">
                                                    <img src="{URL_IMAGES}/uni_van/images/location.svg" alt="Icon" />
                                                </div>
                                                <div class="d-flex  ellipsis_3 txt_recently_viewed">
                                                    <span>Place to visit: </span>
                                                    Hanoi - Lan Ha Bay - Dark & Light Cave - Ao Ech Area -
                                                    Halong International Cruise Port - Hanoi
                                                </div>
                                            </div>
                                            <div class="viewed d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center">
                                                    4.5
                                                </div>
                                                <span class="span1">Very good</span>
                                                <span class="span2">(9 reviews)</span>
                                            </div>
                                            <div class="money d-flex justify-content-end align-items-end flex-wrap">
                                                <span class="txt_money_viewed">Price per person from</span>
                                                <div class="infor_money d-flex justify-content-end align-items-end flex-wrap ">
                                                    <span class="type_money">US</span>
                                                    <span class="cuise_moeny_viewed">$650</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {$core->getBlock('customer_review')}
    {$core->getBlock('also_like')}
</div>

<script>
    var cru_max_price = '{$price_range_max}';
    var min_price = '{$min_price}';
    var max_price = '{$max_price}';
</script>

{literal}
<script>
    $(function() {
        new Swiper(".recently_viewed", {
            slidesPerView: 3,
            spaceBetween: 32,
            // autoplay: {
            //     delay: 3000,
            //     disableOnInteraction: false
            // },
            breakpoints: {
                769: {
                    slidesPerView: 3,
                },
                768: {
                    slidesPerView: 2,
                },
                500: {
                    slidesPerView: 2,
                },
                0: {
                    slidesPerView: 1,
                },
            }
        });

        $(document)
            .on('click', '.btn_close_menu', function() {
                $('.menu_navbar').collapse('hide');
            })
            .on('click', '.sort_filter .title', function() {
                $('.list_sort_filter').slideToggle();
            })
            .on('click', '.unika_filter_mobile_close', function() {
                $('.list_sort_filter').hide();
            })
            .on('click', '.icon_other', function() {
                let unika_icon_more = $(this).parents('.list_icon').find('.unika_icon_more');
                if (unika_icon_more.hasClass('active')) {
                    unika_icon_more.removeClass('active');
                } else {
                    unika_icon_more.addClass('active');
                }
            })
            .on('click', function(event) {
                if (!$(event.target).closest('.unika_icon_more').length && !$(event.target).closest('.icon_other').length) {
                    $('.unika_icon_more').removeClass('active');
                }
            })

        $('.img_highlight_1').hover(function() {
            $(this).parents('.list_icon').find('.unika_icon_more').removeClass('active');
        })

        // Show 2 phần tử đầu của inclutions
        $(".box_inclusion").each(function() {
            $(this).find("li:lt(2)").show();
            $(this).find("li:gt(1)").hide();
        });

        // View more/less
        var items = $('.cruises_type .item_checkbox');
        if (items.length > 5) {
            items.slice(5).hide();
            var toggleButton = $('<span/>', {
                text: 'View more',
                class: 'view_more_type',
                click: function() {
                    var hiddenItems = $('.cruises_type .item_checkbox:hidden');
                    if (hiddenItems.length > 0) {
                        hiddenItems.show();
                        $(this).text('View less');
                    } else {
                        items.slice(5).hide();
                        $(this).text('View more');
                    }
                }
            });
            $('.cruises_type').append(toggleButton);
        }

        // Redirect trang theo country
        $('input[name="country_id"]').on('click', function(e) {
            e.preventDefault();
            window.location.href = $(this).data('link');
        });

        // Slider price
        $("#cru_slider").slider({
            range: true,
            min: 0,
            max: cru_max_price,
            step: 5,
            values: [min_price, max_price],
            slide: function(event, ui) {
                $('#min_price').val(ui.values[0])
                $('#max_price').val(ui.values[1])
            },
            stop: function(event, ui) {
                var min_price1 = $("#min_price").val($("#cru_slider").slider("values", 0));
                var max_price1 = $("#max_price").val($("#cru_slider").slider("values", 1));
                $('#filters_form_cruise').submit();
            }
        });

        // Thay đổi data min_price thì kích hoạt submit
        $("#min_price").on("change", function() {
            $("#filters_form_cruise").submit();
        });

        // Thay đổi data max_price thì kích hoạt submit
        $("#max_price").on("change", function() {
            $("#filters_form_cruise").submit();
        });

        // Data trong thay đổi thì kích hoạt event click
        $('#filters_form_cruise .typeSearch').change(function() {
            $(this).closest('form').submit();
        });
    })
</script>
{/literal}