<!-- Bắt buộc ko format code để tránh lỗi hiển thị -->
<div class="page_container crde_page_container">
    <div class="unika_cruise_detail">
        {$core->getBlock('des_nav_breadcrumb')}
        <div class="unikasia_cruise_detail d-flex justify-content-center">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center  flex-wrap">
                    <h1 class="cruise_title ">
                        {$clsCruise->getTitle($cruise_id)}
                    </h1>
                    <div class="list_btn d-flex ">
                        <button class="div_img btn_content_1"><i class="fa-light fa-share-nodes"></i></button>
                    </div>
                </div>
                <div class="cruise_information d-flex justify-content-between align-items-end flex-wrap">
                    <div class="d-flex flex-column cruise_star_rating ">
                        <div class="rating d-flex align-items-center ">
                            {if $cruise_info.star_number >= 3}
                                {section name=i loop=$cruise_info.star_number}
                                    <div class="div_img">
                                        <i class="fa-sharp fa-solid fa-star"></i>
                                    </div>
                                {/section}
                            {/if}
                        </div>
                        <div class="cruise_medium d-flex  align-items-center flex-wrap">
                            <div class="count_star">{$clsReviews->getReviews($cruise_id, 'avg_point', 'cruise')}</div>
                            <p>{$clsReviews->getReviews($cruise_id, 'txt_review', 'cruise')}</p>
                            <span class="view">({$clsReviews->getReviews($cruise_id, '', 'cruise')} reviews)</span>
                            <a href="#reviews" class="show_all">Show all reviews</a>
                        </div>
                    </div>
                    <div class="price_contact d-flex align-items-center justify-content-between ">
                        <div class="d-flex justify-content-between flex-column ">
                            <span class="cruise_price_1">from</span>
                            <div class="cruise_price">
                                {if $clsCruiseItinerary->getMinPriceItinerary($cruise_id) eq 0}
                                    {$core->get_Lang('Contact')}
                                {else}
                                    {$core->get_Lang('US')}
                                    <span>${$clsCruiseItinerary->getMinPriceItinerary($cruise_id)}</span>
                                {/if}
                            </div>
                        </div>
                        <a href="{$clsISO->getLink('contact')}">
                            <form action="" method="post">
                                <input type="hidden" name="cruise_id" value="{$cruise_id}">
                                <input type="hidden" name="ContactCruise" value="ContactCruise">
                                <button class="btn_contact_cruise" type="submit">
                                    {$core->get_Lang('Contact')}
                                    <div class="div_img">
                                        <i class="fa-sharp fa-light fa-arrow-right"></i>
                                    </div>
                                </button>
                            </form>
                        </a>
                    </div>
                </div>
                {if $arr_cruise_gallery}
                <div class="cruise unika_list_img">
                    {assign var=count_img value=count($arr_cruise_gallery)}
                    {foreach from=$arr_cruise_gallery key=key item=item}
                        {assign var="CruiseGalID" value=$item.cruise_image_id}
                        {assign var="CruiseGalTitle" value=$clsCruiseImage->getTitle($CruiseGalID)}
                        {assign var="CruiseGalImage" value=$clsCruiseImage->getImage($CruiseGalID, 742, 491)}
                        <a href="{$CruiseGalImage}" data-fancybox="gallery" class="div_img cruise_img cruise_img_{$key+1} {if $key > 3} hidden {/if}">
                            <img src="{$CruiseGalImage}" class="{if ($count_img > 4)} unika_img_shadow {/if}" alt="{$CruiseGalTitle}" width="742" height="491">
                            {if ($key eq 3 && $count_img > 4)}
                                {assign var=count_img_new value=$count_img - 4}
                                <div class="cruise_shadow d-flex align-items-center justify-content-center ">
                                    <span class="">+{$count_img_new}</span>
                                    <div class="div_img">
                                        <i class="fa-sharp fa-light fa-images"></i>
                                    </div>
                                </div>
                            {/if}
                        </a>
                    {/foreach}
                </div>
                {/if}
            </div>
        </div>
        <div class="d-flex justify-content-center unika_overview" id="overview">
            <div class="container">
                <div class="d-flex justify-content-between overviews content_2_item">
                    <div class="content_left">
                        <div class="unika_detail_fixed">
                            <div class="unika_detail_fixed_content">
                                <div class="unika_detail_collapse d-flex  align-items-center flex-wrap">
                                    <a class="item_collapse active" href="#overview">
                                        {$core->get_Lang('Overview')}
                                    </a>
                                    <a class="item_collapse" href="#itineraries">
                                        {$core->get_Lang('Itineraries')}
                                    </a>
                                    <a class="item_collapse" href="#things_to_know">
                                        {$core->get_Lang('Things to know')}
                                    </a>
                                    <a class="item_collapse" href="#optional_extensions">
                                        {$core->get_Lang('Optional extensions')}
                                    </a>
                                    <a class="item_collapse" href="#reviews">
                                        {$core->get_Lang('Reviews')}
                                    </a>
                                </div>
                                <div class="price_contact price_contact_fixed align-items-center justify-content-between ">
                                    <div class="d-flex justify-content-between flex-column ">
                                        <span class="cruise_price_1">from</span>
                                        <div class="cruise_price">
                                            {if $clsCruiseItinerary->getMinPriceItinerary($cruise_id) eq 0}
                                                {$core->get_Lang('Contact')}
                                            {else}
                                                {$core->get_Lang('US')}
                                                <span>$ {$clsCruiseItinerary->getMinPriceItinerary($cruise_id)}</span>
                                            {/if}
                                        </div>
                                    </div>
                                    <a href="{$clsISO->getLink('contact')}">
                                        <form action="" method="post">
                                            <input type="hidden" name="cruise_id" value="{$cruise_id}">
                                            <input type="hidden" name="ContactCruise" value="ContactCruise">
                                            <button class="btn_contact_cruise" type="submit">
                                                {$core->get_Lang('Contact')}
                                                <div class="div_img">
                                                    <i class="fa-sharp fa-light fa-arrow-right"></i>
                                                </div>
                                            </button>
                                        </form>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="unika_collapse_content overview" >
                            <h2 class="title_2 unika_title_overview">
                                {$core->get_Lang('Overview')}
                            </h2>
                            <div class="information d-flex flex-column ">
                                <div class="unika_item_information d-flex justify-content-between flex-wrap">
                                    <div class="item d-flex flex-column">
                                        <div class="name d-flex  align-items-start">
                                            <div class="div_img">
                                                <i class="fa-light fa-calendar-days"></i>
                                            </div>
                                            <span>{$core->get_Lang('Year launched')}</span>
                                        </div>
                                        <div class="txt">
                                            {$clsCruise->getBuild($cruise_id)}
                                        </div>
                                    </div>
                                    <div class="item d-flex  flex-column">
                                        <div class="name d-flex  align-items-start">
                                            <div class="div_img">
                                                <i class="fa-light fa-door-open"></i>
                                            </div>
                                            <span>{$core->get_Lang('Cabin')}</span>
                                        </div>
                                        <div class="txt">
                                            {$clsCruise->getTotalCabin($cruise_id)}
                                        </div>
                                    </div>
                                    <div class="item d-flex  flex-column">
                                        <div class="name d-flex  align-items-start">
                                            <div class="div_img">
                                                <i class="fa-light fa-sign-posts-wrench"></i>
                                            </div>
                                            <span>{$core->get_Lang('Material')}</span>
                                        </div>
                                        <div class="txt">
                                            {$list_material[$clsCruise->getMaterial($cruise_id)]}
                                        </div>
                                    </div>
                                    <div class="item d-flex  flex-column">
                                        <div class="name d-flex  align-items-start">
                                            <div class="div_img">
                                                <i class="fa-light fa-anchor-circle-check"></i>
                                            </div>
                                            <span>{$core->get_Lang('Port of departure')}</span>
                                        </div>
                                        <div class="txt">
                                            {$clsCruise->getDeparturePort($cruise_id)}
                                        </div>
                                    </div>
                                </div>
                                <div class="location">
                                    <div class="name d-flex  align-items-start">
                                        <div class="div_img">
                                            <i class="fa-light fa-location-dot"></i>
                                        </div>
                                        <span>{$core->get_Lang('Place to visit')}: </span>
                                    </div>
                                    <div class="txt">
                                        {$clsCruise->getPlaceVisit($cruise_id)}
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                {$clsCruise->getAbout($cruise_id)}
                            </div>
                        </div>
                    </div>
                    <div class="content_right d-flex flex-column  align-items-center justify-content-center">
                        <div class="title">{$core->get_Lang('Best price for you')}</div>
                        <div class="content  d-flex flex-column">
                            <p>{$core->get_Lang('Avg price per person')}</p>
                            <div class="d-flex align-items-end">
                                {if $clsCruiseItinerary->getMinPriceItinerary($cruise_id) eq 0}
                                    {$core->get_Lang('Contact')}
                                {else}
                                    {$core->get_Lang('US')}
                                    <span>$ {$clsCruiseItinerary->getMinPriceItinerary($cruise_id)}</span>
                                {/if}
                            </div>
                            <span>{$core->get_Lang('Price includes room for 2 pax')}</span>
                        </div>
                        <a href="{$clsISO->getLink('contact')}">
                            <form action="" method="post">
                                <input type="hidden" name="cruise_id" value="{$cruise_id}">
                                <input type="hidden" name="ContactCruise" value="ContactCruise">
                                <button class="btn_contact_cruise" type="submit">
                                    {$core->get_Lang('Contact')}
                                    <div class="div_img">
                                        <i class="fa-sharp fa-light fa-arrow-right"></i>
                                    </div>
                                </button>
                            </form>
                        </a>
                    </div>
                </div>
                {if $arr_itinerary}
                <div class="collapse_content content_2_item" id="itineraries">
                    <div class="title_2 unika_title_itineraties">{$core->get_Lang('Itineraries')}</div>
                    <div class="btn_itineraries d-flex align-items-center flex-wrap">
                        {foreach from=$arr_itinerary key=key item=item}
                            {assign var="CruiseItineraryID" value=$item.cruise_itinerary_id}
                            {if $item.title_itinerary ne ''}
                                <button class="item_btn_itineraries {if $key eq 0} active {/if}" data-list="unika_list_itineraries_{$CruiseItineraryID}">
                                    {$item.title_itinerary}
                                </button>
                            {else}
                                <button class="item_btn_itineraries {if $key eq 0} active {/if}" data-list="unika_list_itineraries_{$CruiseItineraryID}">
                                    {$clsCruiseItinerary->getDuration($item.cruise_itinerary_id)}
                                </button>
                            {/if}
                        {/foreach}
                    </div>
                    {if $arr_itinerary_day}
                        {foreach from=$arr_itinerary_day key=key item=item}
                            {assign var="CruiseItineraryID" value=$item.info[0]}
                            {assign var="Child" value=$item.child}
                            <div class="unika_list_itineraries {if $key eq 0 } active {/if} unika_list_itineraries_{$CruiseItineraryID}">
                                <div class="list_new  d-flex flex-column">
                                    {if $Child}
                                        {assign var=countChild value=count($Child)}
                                        {foreach from=$Child key=k item=i}
                                            {assign var="CruiseItineraryIDChild" value=$i.cruise_itinerary_id}
                                            {assign var="CruiseItineraryDayID" value=$i.cruise_itinerary_day_id}
                                            {assign var="CruiseItineraryDayTitle"
                                            value=$clsCruiseItineraryDay->getTitle($CruiseItineraryDayID)}
                                            {assign var="CruiseItineraryDayImage"
                                            value=$clsCruiseItineraryDay->getImage($CruiseItineraryDayID, 346, 240)}
                                            {assign var="CruiseItineraryDayContent"
                                            value=$clsCruiseItineraryDay->getContent($CruiseItineraryDayID)}

                                            {assign var="txt_meal" value=""}
                                            {if $i.meals ne ''}
                                                {assign var="lst_meal" value=$clsCruiseProperty->getAll("is_trash=0 and type='MEAL' and cruise_property_id IN ("|cat:$i['meals']|cat:")", $clsCruiseProperty->pkey|cat:',title')}

                                                {foreach from=$lst_meal key=k2 item=i2}
                                                    {if $k2 > 0}
                                                        {assign var="txt_meal" value=$txt_meal|cat:', '|cat:$i2['title']}
                                                    {else}
                                                        {assign var="txt_meal" value=$i2['title']}
                                                    {/if}
                                                {/foreach}
                                            {/if}
                                            <div class="item_new">
                                                <div class="title_new d-flex justify-content-between align-items-center  cursor item_itineraries">
                                                    <div class="title_itineraries d-flex align-items-center ">
                                                        <div class="itineraries_fa">
                                                            {if ($countChild-1 eq $k)}
                                                                <i class="fa-sharp fa-solid fa-flag"></i>
                                                            {else}
                                                                <i class="fa-light fa-location-dot"></i>
                                                            {/if}
                                                        </div>
                                                        <h3>
                                                            {$CruiseItineraryDayTitle} 
                                                            {if $txt_meal}
                                                                ({$txt_meal})
                                                            {else}
                                                                {$txt_meal}
                                                            {/if}
                                                        </h3>
                                                    </div>
                                                    <div class="div_img">
                                                        <div class="img_arrow">
                                                            <i class="fa-light fa-angle-down"></i>
                                                        </div>
                                                        <div class="img_arrow1">
                                                            <i class="fa-light fa-angle-up"></i>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                                <div class="content_new">
                                                    <div class="new justify-content-between">
                                                        {if $i.image ne ''}
                                                            <div class="div_img">
                                                                <img src="{$CruiseItineraryDayImage}" width="346" height="240" alt="{$CruiseItineraryDayTitle}">
                                                            </div> 
                                                        {/if}
                                                        <div class="content">{$CruiseItineraryDayContent}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/foreach}
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                </div>
                {/if}
                <div class="collapse_content content_2_item" id="things_to_know">
                    <div class="title d-flex justify-content-between align-items-end flex-wrap">
                        <div class="d-flex flex-column ">
                            <h2 class="title_2 unika_title_thing">{$core->get_Lang('Things to know')}</h2>
                            <span class="span_thing_now">
                                {$core->get_Lang('Centara Mirage Resort Mui Ne takes special requests.. Contact now!')}
                            </span>
                        </div>
                        <a href="{$clsISO->getLink('contact')}" >
                            <form action="" method="post">
                                <input type="hidden" name="cruise_id" value="{$cruise_id}">
                                <input type="hidden" name="ContactCruise" value="ContactCruise">
                                <button class="btn_contact_cruise" type="submit">
                                    {$core->get_Lang('Contact')}
                                    <div class="div_img">
                                        <i class="fa-sharp fa-light fa-arrow-right"></i>
                                    </div>
                                </button>
                            </form>
                        </a>
                    </div>
                    <div class="content d-flex">
                        <div class="content_left">
                            <div class="btn_thing_know active cursor d-flex align-items-center justify-content-start" data-class="unika_content_facility">
                                <div class="thing_now_icon" data-name="facilities">
                                    <i class="fa-light fa-tv"></i>
                                </div>
                                <span>{$core->get_Lang('Facilities')}</span>
                            </div>
                            <div class="btn_thing_know cursor d-flex align-items-center justify-content-start" data-class="unika_content_include">
                                <div class="thing_now_icon" data-name="include">
                                    <i class="fa-light fa-octagon-plus"></i>
                                </div>
                                <span>{$core->get_Lang('What’s include')}</span>
                            </div>
                            <div class="btn_thing_know cursor d-flex align-items-center justify-content-start" data-class="unika_content_exclude">
                                <div class="thing_now_icon" data-name="exclude">
                                    <i class="fa-light fa-octagon-xmark"></i>
                                </div>
                                <span>{$core->get_Lang('What’s exclude')}</span>
                            </div>
                            <div class="btn_thing_know  cursor d-flex align-items-center justify-content-start" data-class="unika_content_booking">
                                <div class="thing_now_icon" data-name="policy">
                                    <i class="fa-light fa-circle-info"></i>
                                </div>
                                <span>{$core->get_Lang('Booking cruise policy')}</span>
                            </div>
                            <div class="btn_thing_know cursor d-flex align-items-center justify-content-start" data-class="unika_content_booking_policy">
                                <div class="thing_now_icon" data-name="facilities">
                                    <i class="fa-light fa-calendar-check"></i>
                                </div>
                                <span>{$core->get_Lang('Booking policy')}</span>
                            </div>
                            <div class="btn_thing_know  cursor d-flex align-items-center justify-content-start" data-class="unika_content_child_policy">
                                <div class="thing_now_icon" data-name="child">
                                    <i class="fa-light fa-baby"></i>
                                </div>
                                <span>{$core->get_Lang('Child policy')}</span>
                            </div>
                        </div>
                        <div class="content_right">
                            {if $arr_facilities}
                            <div class="content_right_item unika_content_facility active">
                                {foreach from=$arr_facilities key=key item=item}
                                <div class="item_right d-flex justify-content-start align-items-center">
                                    <div class="div_img"><img src="{$item.image}" alt="Icon"></div>
                                    <span>{$item.title}</span>
                                </div>
                                {/foreach}
                            </div>
                            {/if}
                            <div class="content_right_item unika_content_include">
                                {$clsCruise->getInclusion($cruise_id)}
                            </div>
                            <div class="content_right_item unika_content_exclude">
                                {$clsCruise->getExclusion($cruise_id)}
                            </div>
                            <div class="content_right_item unika_content_booking">
                                {$clsCruise->getCruisePolicy($cruise_id)}
                            </div>
                            <div class="content_right_item unika_content_booking_policy">
                                {$clsCruise->getCruiseBookingPolicy($cruise_id)}
                            </div>
                            <div class="content_right_item unika_content_child_policy">
                                {$clsCruise->getCruiseChildPolicy($cruise_id)}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="optional_extensions" class="content_2_item d-flex justify-content-center ">
            <div class="container">
                <div class=" optional_extensions ">
                    <h2 class="title_2 unika_title_optional">{$core->get_Lang('Optional extensions')}</h2>
                    <div class="content d-flex justify-content-between ">
                        {if $arr_extension_pre}
                        <div class="item_content">
                            <div class="title_right">{$core->get_Lang('PRE CRUISE EXTENSIONS')}</div>
                            <div class="list_extensions d-flex flex-column ">
                                {foreach from=$arr_extension_pre key=key item=item}
                                    {assign var="TourID" value=$item.tour_id}
                                    {assign var="TourTitle" value=$clsTour->getTitle($TourID)}
                                    {assign var="TourLink" value=$clsTour->getLink($TourID)}
                                    <div class="item_extensions d-flex align-items-start ">
                                        <a href="{$TourLink}" class="div_img img_extensions">
                                            <img src="{$clsTour->getImage($TourID, 243, 168)}" width="243" height="168" alt="{$TourTitle}">
                                        </a>
                                        <div class="content_extensions d-flex justify-content-start align-items-start  flex-column">
                                            <a href="{$TourLink}" class="title_extentions ellipsis_2" title="{$TourTitle}">
                                                {$TourTitle}
                                            </a>
                                            <div class="money_extentions">
                                                <span class="money_extention_1">{$core->get_Lang('Form')}</span>
                                                <span class="money_extention_2">{$core->get_Lang('US')}</span>
                                                <span class="money_extention_3">${$clsTour->getMinPrice($TourID)}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        {/if}
                        {if $arr_extension_post}
                        <div class="item_content">
                            <div class="title_left">{$core->get_Lang('POST CRUISE EXTENSIONS')}</div>
                            <div class="list_extensions d-flex flex-column ">
                                {foreach from=$arr_extension_post key=key item=item}
                                    {assign var="TourID" value=$item.tour_id}
                                    {assign var="TourTitle" value=$clsTour->getTitle($TourID)}
                                    {assign var="TourLink" value=$clsTour->getLink($TourID)}
                                    <div class="item_extensions d-flex align-items-start ">
                                        <a href="{$TourLink}" class="div_img img_extensions">
                                            <img src="{$clsTour->getImage($TourID, 243, 168)}" width="243" height="168" alt="{$TourTitle}">
                                        </a>
                                        <div class="content_extensions d-flex justify-content-start align-items-start  flex-column">
                                            <a href="{$TourLink}" class="title_extentions ellipsis_2" title="{$TourTitle}">
                                                {$TourTitle}
                                            </a>
                                            <div class="money_extentions">
                                                <span class="money_extention_1">{$core->get_Lang('Form')}</span>
                                                <span class="money_extention_2">{$core->get_Lang('US')}</span>
                                                <span class="money_extention_3">${$clsTour->getMinPrice($TourID)}</span>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        <div id="reviews" class="d-flex flex-column  align-items-center justify-content-center">
            <div class="container">
                <div class="unikasia_reviews d-flex flex-column align-items-center justify-content-center">
                    <h2 class="title_2 unika_title_reviews">{$core->get_Lang('Reviews')}</h2>

                    <div class="unika_reviews_1 d-flex flex-column align-items-center justify-content-center ">
                        <div class="statistical d-flex align-items-center justify-content-between ">
                            <div class="statistical_right d-flex align-items-center justify-content-center flex-column">
                                <div id="chart"></div>
                                <div class="content_statistical d-flex flex-column ">
                                    <p class="number">4.8</p>
                                    <span class="span_1">Wonderful</span>
                                    <span class="span_2">(3 {$core->get_Lang('reviews')})</span>
                                </div>
                            </div>
                            <div class="statistical_left d-flex flex-column ">
                                <div class="item_statiscal d-flex  justify-content-between align-items-center">
                                    <p>{$core->get_Lang('Wonderful')}</p>
                                    <div class="percent">
                                        <div></div>
                                    </div>
                                    <span>10</span>
                                </div>
                                <div class="item_statiscal d-flex  justify-content-between align-items-center">
                                    <p>{$core->get_Lang('Excellent')}</p>
                                    <div class="percent">
                                        <div></div>
                                    </div>
                                    <span>2</span>
                                </div>
                                <div class="item_statiscal d-flex  justify-content-between align-items-center">
                                    <p>{$core->get_Lang('Good')}</p>
                                    <div class="percent">
                                        <div></div>
                                    </div>
                                    <span>0</span>
                                </div>
                                <div class="item_statiscal d-flex  justify-content-between align-items-center">
                                    <p>{$core->get_Lang('Average')}</p>
                                    <div class="percent">
                                        <div></div>
                                    </div>
                                    <span>0</span>
                                </div>
                                <div class="item_statiscal d-flex  justify-content-between align-items-center">
                                    <p>{$core->get_Lang('Bad')}</p>
                                    <div class="percent">
                                        <div></div>
                                    </div>
                                    <span>10</span>
                                </div>
                                <div class="btn_write_reviews d-flex justify-content-end ">
                                    <button class="btn_write">{$core->get_Lang('Write reviews')}</button>
                                </div>
                            </div>
                        </div>
                        <form action="" class="unika_form_review" method="POST" onsubmit="return false" >
                            <div class="unika_form_content">
                                <div class="unika_form_header">
                                    <span class="title_form">
                                        * {$core->get_Lang('Your rating is here')}:
                                    </span>
                                    <div class="unika_form_rating">
                                        {section name=i loop=5}
                                            {assign var="iteration" value=$smarty.section.i.iteration}
                                            <span class="unika_rate_star active" data-value="{$iteration}">
                                                <i class="fa-solid fa-star"></i>
                                            </span>
                                        {/section}
                                        <input type="hidden" id="unika_rates" name="unika_rates" class="unika_rating_input" value="5">
                                    </div>
                                </div>
                                <div class="unika_form_body">
                                    <div class="unika_body_item box_validate">
                                        <input type="text" class="unika_item_input" id="unika_fullname" name="unika_fullname" placeholder="* Full name">
                                    </div>
                                    <div class="unika_body_item box_validate">
                                        <input type="text" class="unika_item_input" id="unika_title" name="unika_title" placeholder="* Title of review">
                                    </div>
                                    <div class="unika_body_item box_validate">
                                        <textarea name="unika_review" class="unika_item_textara" id="unika_review" placeholder="* Your review"></textarea>
                                    </div>
                                    <div class="unika_body_item">
                                        <input type="submit" class="unika_item_submit" value="Submit your review">
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="list_reviews width-100 d-flex flex-column ">

                            <!-- <div class="item_reviews width-100 d-flex flex-column justify-content-start ">
                                <div class="customer d-flex justify-content-start ">
                                    <div class="div_img">
                                        <img src="images/img_review.png" alt="Image">
                                    </div>
                                    <div class="d-flex flex-column align-items-start ">
                                        <a href="#">Kittfinn</a>
                                        <span class="">March 12, 2024</span>
                                    </div>
                                </div>
                                <div class="rating d-flex justify-content-start align-items-center ">
                                    <div class="div_img"><img src="images/star.svg" alt="Icon"></div>
                                    <div class="div_img"><img src="images/star.svg" alt="Icon"></div>
                                    <div class="div_img"><img src="images/star.svg" alt="Icon"></div>
                                    <div class="div_img"><img src="images/star.svg" alt="Icon"></div>
                                </div>
                                <div class="title_reviews">
                                    What a wonderful place to stay
                                </div>
                                <div class="content_reviews">
                                    My husband and I have just arrived home from the most fantastic 8 day stay at Turtle
                                    Beach. I was a little worried about some of the reviews I read prior to going but I
                                    had
                                    no need to be concerned. . This hotel is a gem, the staff are wonderful, the food
                                    was
                                    delicious and there was always something to enjoy whatever your taste. Nicole, also
                                    known as scrumptious made eggs any...
                                </div>
                            </div> -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $list_related_cruise}    
            <div class=" d-flex justify-content-center">
                <div class="container">
                    <div class=" interested d-flex justify-content-center  flex-column align-items-center">
                        <h2 class="title_2 unika_title_interested">{$core->get_Lang('Maybe you are interested')}</h2>
                        <div class="list_intersted list_interested_2 swiper">
                            <div class="swiper-wrapper">
                                {foreach from=$list_related_cruise key=key item=item}
                                    {assign var="relatedCruiseID" value=$item.cruise_id}
                                    {assign var="relatedCruiseTitle" value=$clsCruise->getTitle($relatedCruiseID)}
                                    {assign var="relatedCruiseLink" value=$clsCruise->getLink2($relatedCruiseID)}
                                    <div class="item_interested d-flex flex-column swiper-slide">
                                        <a href="{$relatedCruiseLink}" class="div_img img_item" title="{$relatedCruiseTitle}">
                                            <img src="{$clsCruise->getImage($relatedCruiseID, 296, 200)}" width="296" height="200" alt="{$relatedCruiseTitle}">
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <div class="d-flex flex-column content_interested_title">
                                                <h3>
                                                    <a class=" ellipsis_2 title_interested" href="{$relatedCruiseLink}" title="{$relatedCruiseTitle}">
                                                        {$relatedCruiseTitle}
                                                    </a>
                                                </h3>
                                                <div class="rating d-flex align-items-center ">
                                                    {if $cruise_info.star_number >= 3}
                                                        {section name=i loop=$cruise_info.star_number}
                                                            <div class="div_img">
                                                                <i class="fa-sharp fa-solid fa-star"></i>
                                                            </div>
                                                        {/section}
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_interested">
                                                    <i class="fa-sharp fa-solid fa-location-dot"></i>
                                                </div>
                                                <div class="d-flex  ellipsis_3  txt_interested">
                                                    <span>{$core->get_Lang('Place to visit')}: </span>
                                                    {$clsCruise->getPlaceVisit($relatedCruiseID)}
                                                </div>
                                            </div>
                                            <div class="unika_reviews_1 d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center ">
                                                    {$clsReviews->getReviews($relatedCruiseID, 'avg_point', 'cruise')}
                                                </div>
                                                <span class="span_1">
                                                    {$clsReviews->getReviews($relatedCruiseID, 'txt_review', 'cruise')}
                                                </span>
                                                <span class="span_2">
                                                    ({$clsReviews->getReviews($relatedCruiseID, '', 'cruise')} {$core->get_Lang('reviews')})
                                                </span>
                                            </div>
                                            <div class="money_viwed d-flex justify-content-end align-items-end  flex-wrap">
                                                <span class="money_viwed_span">{$core->get_Lang('Price per person from')}</span>
                                                <div class="money_viwed_div">
                                                    {if $clsCruiseItinerary->getMinPriceItinerary($relatedCruiseID) eq 0}
                                                        {$core->get_Lang('Contact')}
                                                    {else}
                                                        {$core->get_Lang('US')}
                                                        <span>$ {$clsCruiseItinerary->getMinPriceItinerary($relatedCruiseID)}</span>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        <div class="swiper-button-next">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </div>
                        <div class="swiper-button-prev">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        {if $arr_recent_view}
            <div class="d-flex justify-content-center">
                <div class="container">
                    <div class=" interested d-flex justify-content-center  flex-column align-items-center">
                        <h2 class="title_2 unika_title_recently">{$core->get_Lang('Recently viewed')}</h2>
                        <div class="list_intersted list_interested_1 swiper">
                            <div class="swiper-wrapper">
                                {foreach from=$arr_recent_view key=key item=item}
                                    {assign var="recentCruiseID" value=$item}
                                    {assign var="recentCruiseTitle" value=$clsCruise->getTitle($recentCruiseID)}
                                    {assign var="recentCruiseLink" value=$clsCruise->getLink2($recentCruiseID)}
                                    <div class="item_interested d-flex flex-column swiper-slide">
                                        <a href="{$recentCruiseLink}" class="div_img img_item" title="{$recentCruiseTitle}">
                                            <img src="{$clsCruise->getImage($recentCruiseID, 296, 200)}" width="296" height="200" alt="{$recentCruiseTitle}">
                                        </a>
                                        <div class="content_interested d-flex flex-column ">
                                            <div class="d-flex flex-column content_interested_title">
                                                <h3>
                                                    <a class=" ellipsis_2 title_interested" href="{$recentCruiseLink}" title="{$recentCruiseTitle}">
                                                        {$recentCruiseTitle}
                                                    </a>
                                                </h3>
                                                <div class="rating d-flex align-items-center ">
                                                    {if $cruise_info.star_number >= 3}
                                                        {section name=i loop=$cruise_info.star_number}
                                                            <div class="div_img">
                                                                <i class="fa-sharp fa-solid fa-star"></i>
                                                            </div>
                                                        {/section}
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between  align-items-start">
                                                <div class="div_img img_interested">
                                                    <i class="fa-sharp fa-solid fa-location-dot"></i>
                                                </div>
                                                <div class="d-flex  ellipsis_3  txt_interested">
                                                    <span>{$core->get_Lang('Place to visit')}: </span>
                                                    {$clsCruise->getPlaceVisit($recentCruiseID)}
                                                </div>
                                            </div>
                                            <div class="unika_reviews_1 d-flex align-items-center justify-content-start ">
                                                <div class="count_reviews d-flex align-items-center justify-content-center ">
                                                    {$clsReviews->getReviews($recentCruiseID, 'avg_point', 'cruise')}
                                                </div>
                                                <span class="span_1">
                                                    {$clsReviews->getReviews($recentCruiseID, 'txt_review', 'cruise')}
                                                </span>
                                                <span class="span_2">
                                                    ({$clsReviews->getReviews($recentCruiseID, '', 'cruise')} {$core->get_Lang('reviews')})
                                                </span>
                                            </div>
                                            <div class="money_viwed d-flex justify-content-end align-items-end  flex-wrap">
                                                <span class="money_viwed_span">{$core->get_Lang('Price per person from')}</span>
                                                <div class="money_viwed_div">
                                                    {if $clsCruiseItinerary->getMinPriceItinerary($recentCruiseID) eq 0}
                                                        {$core->get_Lang('Contact')}
                                                    {else}
                                                        {$core->get_Lang('US')}
                                                        <span>$ {$clsCruiseItinerary->getMinPriceItinerary($recentCruiseID)}</span>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        <div class="swiper-button-next">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </div>
                        <div class="swiper-button-prev">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        {$core->getBlock('customer_review')}
        {$core->getBlock('top_attraction')}
        {$core->getBlock('also_like')}
    </div>
</div>

{literal}

{/literal}

<script>
    var cruise_id = '{$cruise_id}';
</script>
{literal}
<script>
    $(function() {
        new Swiper(".list_interested_1", {
            slidesPerView: 4,
            spaceBetween: 32,
            loop: false,
            // autoplay: {
            //     delay: 3500,
            //     disableOnInteraction: false,
            // },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                0: {
                    slidesPerView: 1.3,
                },
                500: {
                    slidesPerView: 2,
                },
                768: {
                    slidesPerView: 2,
                },
                992: {
                    slidesPerView: 3,
                },
                1024: {
                    slidesPerView: 4,
                }
            }
        });

        new Swiper(".list_interested_2", {
            slidesPerView: 4,
            spaceBetween: 32,
            loop: false,
            // autoplay: {
            //     delay: 3500,
            //     disableOnInteraction: false,
            // },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                0: {
                    slidesPerView: 1.3,
                },
                500: {
                    slidesPerView: 2,
                },
                768: {
                    slidesPerView: 2,
                },
                992: {
                    slidesPerView: 3,
                },
                1024: {
                    slidesPerView: 4,
                }
            }
        });

        let targetDivFixed = $('.unika_detail_fixed');
        let unika_image = $('.unika_cruise_detail .unika_list_img').height();
        let fixed_content = $('.unika_detail_fixed_content');
        let price_contact_fixed = $('.price_contact_fixed');
        let cruise_information  = $('.cruise_information ').height();

        $(window).on('scroll', function () {
            let scrollTop = $(window).scrollTop();
            console.log('scrollTop:', scrollTop)
            if (scrollTop >= (unika_image + cruise_information + 60)) {
                targetDivFixed.addClass('fixed');
                fixed_content.addClass('container');
                price_contact_fixed.addClass('active');
                $('.unika_header').hide();
            } else {
                targetDivFixed.removeClass('fixed');
                fixed_content.removeClass('container');
                price_contact_fixed.removeClass('active');
                $('.unika_header').show();
            }
        })

        $(document)
            .on('click', '.item_collapse', function() {
                $('.item_collapse').removeClass('active');
                $(this).addClass('active');
            })
            .on('click', '.btn_thing_know', function() {
                $('.btn_thing_know').each(function() {
                    let name = $(this).find('.div_img').attr('data-name');
                    $(this).removeClass('active');
                    $(this).find('img').attr('src', `images/${name}.svg`);
                });

                let name = $(this).find('.div_img').attr('data-name');
                $(this).find('img').attr('src', `images/${name}1.svg`);
                $(this).addClass('active');
            })
            .on('click', '.item_itineraries', function() {
                let self = $(this).parents('.item_new');
                if (self.find('.content_new').hasClass('show')) {
                    self.find('.content_new').removeClass('show');
                    self.find('.img_arrow1').hide();
                    self.find('.img_arrow').show();
                } else {
                    self.find('.content_new').addClass('show');
                    self.find('.img_arrow1').show();
                    self.find('.img_arrow').hide();
                }
            })
            .on('click', '.item_btn_itineraries', function() {
                $('.item_btn_itineraries').removeClass('active');
                $(this).addClass('active');
            })
            .on('click', '.btn_write', function() {
                $('.unika_form_review').slideToggle();
            })
            .on('click', '.unika_rate_star', function() {
                let value = $(this).attr('data-value');
                $('.unika_rating_input').val(value);
                $('.unika_rate_star').each(function() {
                    let value_star = $(this).attr('data-value');
                    if (value_star > value) {
                        $(this).removeClass('active');
                    } else {
                        $(this).addClass('active');
                    }
                })
            })
            .on('click', '.btn_thing_know', function() {
                let data_class = $(this).attr('data-class');
                $('.content_right_item').removeClass('active');
                $(`.${data_class}`).addClass('active');
            })
            .on('click', '.item_btn_itineraries', function(){
                let data_class = $(this).attr('data-list');
                $('.unika_list_itineraries').removeClass('active');
                $(`.${data_class}`).addClass('active');
            })
            .on('click', '.unika_view_more', function () {
                let content_reviews = $(this).parents('.item_reviews').find('.content_reviews');
                if (content_reviews.hasClass('ellipsis_3')) {
                    content_reviews.removeClass('ellipsis_3 height_72');
                    $(this).text('View less');
                } else {
                    content_reviews.addClass('ellipsis_3 height_72');
                    $(this).text('View less');
                }
            })

        let options = {
            series: [90, 10],
            chart: {
                type: 'donut',
                height: '100%'
            },
            plotOptions: {
                pie: {
                    startAngle: -90,
                    endAngle: 90,
                    offsetY: 10,
                    expandOnClick: false, // Vô hiệu hóa hiệu ứng mở rộng khi click
                    donut: {
                        size: '80%', // Điều chỉnh kích thước của donut
                        labels: {
                            show: false
                        }
                    }
                }
            },
            stroke: {
                width: 0, // Chiều rộng của viền giữa các phần
                colors: undefined // Màu của viền giữa các phần, undefined để sử dụng màu nền
            },
            fill: {
                colors: ['#FFBA55', '#E2E8F0'] // Màu sắc cho từng phần
            },
            grid: {
                padding: {
                    bottom: -10
                }
            },
            legend: {
                show: false // Ẩn phần chú thích
            },
            dataLabels: {
                enabled: false // Ẩn phần trăm
            },
            tooltip: {
                enabled: false, // Tắt tooltip khi hover vào biểu đồ,
            },
            states: {
                normal: {
                    filter: {
                        type: 'none',
                        value: 0,
                    }
                },
                hover: {
                    filter: {
                        type: 'none',
                        value: 0,
                    }
                },
                active: {
                    filter: {
                        type: 'none',
                        value: 0,
                    }
                },
            },
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom',
                        show: false // Ẩn phần chú thích cho màn hình nhỏ
                    }
                }
            }]
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();

        // validate form
        $('.unika_form_review').validate({
            errorPlacement: function(error, element) {
                error.appendTo(element.parents(".box_validate"));
                error.wrap("<span class='errors'>");
                element.parents('.box_validate').addClass('validate_input');
            },
            highlight: function(element) {
                $(element).parents('.box_validate').addClass('validate_input')
                $(element).addClass('form-control-danger')
            },
            success: function(label, element) {
                $(element).parents('.box_validate').removeClass('validate_input')
                $(element).removeClass('form-control-danger')
                label.parents('.errors').remove();
            },
            ignore: [],
            debug: false,
            rules: {
                unika_fullname: "required",
                unika_title: "required",
                unika_review: "required",
            },
            messages: {
                unika_fullname: "Please enter your name!",
                unika_title: "Please enter title!",
                unika_review: "Please enter your review!",
            },
            submitHandler: function(event) {

                var rates = $('#unika_rates').val();
                var fullname = $('#unika_fullname').val();
                var title = $('#unika_title').val();
                var content = $('#unika_review').val();
                var type = 'cruise';
                var data = {
                    rates: rates,
                    fullname: fullname,
                    title: title,
                    content: content,
                    type: type,
                    table_id: cruise_id
                };
                $.ajax({
                    type: "POST",
                    data: data,
                    dataType: "json",
                    url: "/index.php?mod="+mod+"&act=ajSubmitFormReviewCruise",
                    beforeSend: function (xhr) {
                        $('.unika_item_submit').val("Processing...").prop('disabled', true);
                    },
                    success: function (res) {
                        console.log(res);
                        var rates = $('#unika_rates').val(5);
                        var fullname = $('#unika_fullname').val('');
                        var title = $('#unika_title').val('');
                        var content = $('#unika_review').val('');
                        $('.unika_item_submit').val("Submit your review").prop('disabled', false);
                        if (res.result == true) {
                            alert("Successfully! Thank you for rating!");
                        } else {
                            alert("You have already rated!");
                        }
                    },
                    error: function () {
                        console.error("Fail");
                    }
                });
            }
        });

        //View more, view less Reviews
        $('.content_reviews').each(function () {
            let height = $(this).height();
            if (height > 72) {
                $(this).addClass('ellipsis_3 height_72');

                let item_reviews = $(this).parents('.item_reviews');
                item_reviews.append(`<button class="view_more unika_view_more"> View more </button>`);
            }
        })
    })
</script>
{/literal}