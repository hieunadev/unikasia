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
                            <div class="count_star">{$clsReviews->getReviews($CruiseID, 'avg_point', 'cruise')}</div>
                            <p>{$clsReviews->getReviews($CruiseID, 'txt_review', 'cruise')}</p>
                            <span class="view">({$clsReviews->getReviews($CruiseID, '', 'cruise')} reviews)</span>
                            <a href="#reviews" class="show_all">Show all reviews</a>
                        </div>
                    </div>
                    <div class="price_contact d-flex align-items-center justify-content-between ">
                        <div class="d-flex justify-content-between flex-column ">
                            <span class="cruise_price_1">from</span>
                            <div class="cruise_price">
                                {if $clsCruiseItinerary->getMinPriceItinerary($CruiseID) eq 0}
                                    {$core->get_Lang('Contact')}
                                {else}
                                    {$core->get_Lang('US')}
                                    <span>$ {$clsCruiseItinerary->getMinPriceItinerary($CruiseID)}</span>
                                {/if}
                            </div>
                        </div>
                        <a href="https://unikasia.vietiso.com/contact-us" class="d-flex align-items-center justify-content-center button_contact">
                            {$core->get_Lang('Contact')}
                            <div class="div_img">
                                <i class="fa-sharp fa-light fa-arrow-right"></i>
                            </div>
                        </a>
                    </div>
                </div>
                {if $arr_cruise_gallery}
                <div class="cruise unika_list_img">
                    {foreach from=$arr_cruise_gallery key=key item=item}
                        {assign var="CruiseGalID" value=$item.cruise_image_id}
                        {assign var="CruiseGalTitle" value=$clsCruiseImage->getTitle($CruiseGalID)}
                        {assign var="CruiseGalImage" value=$clsCruiseImage->getImage($CruiseGalID, 742, 491)}
                        <a href="{$CruiseGalImage}" data-fancybox="gallery" class="div_img cruise_img cruise_img_{$key+1}">
                            <img src="{$CruiseGalImage}" alt="{$CruiseGalTitle}" width="742" height="491">
                        </a>
                    {/foreach}
                    <!-- <a href="images/img2.png" data-fancybox="gallery" class="div_img cruise_img cruise_img_2">
                            <img src="images/img2.png" alt="Image">
                        </a>
                        <a href="images/img3.png" data-fancybox="gallery" class="div_img cruise_img cruise_img_3">
                            <img src="images/img3.png" alt="Image">
                        </a>
                        <a href="images/img4.png" data-fancybox="gallery" class="div_img cruise_img cruise_img_4">
                            <img src="images/img4.png" alt="Image">
                            <div class="cruise_shadow d-flex align-items-center justify-content-center ">
                                <span class="">+40</span>
                                <div class="div_img">
                                    <i class="fa-sharp fa-light fa-images"></i>
                                </div>
                            </div>
                        </a> -->
                </div>
                {/if}
            </div>
        </div>
        <div class="d-flex justify-content-center unika_overview" id="overview">
            <div class="container">
                <div class="d-flex  justify-content-between overviews content_2_item">
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
                                            {if $clsCruiseItinerary->getMinPriceItinerary($CruiseID) eq 0}
                                                {$core->get_Lang('Contact')}
                                            {else}
                                                {$core->get_Lang('US')}
                                                <span>$ {$clsCruiseItinerary->getMinPriceItinerary($CruiseID)}</span>
                                            {/if}
                                        </div>
                                    </div>
                                    <a href="https://unikasia.vietiso.com/contact-us" class="d-flex align-items-center justify-content-center button_contact">
                                        Contact
                                        <div class="div_img">
                                            <i class="fa-sharp fa-light fa-arrow-right" aria-hidden="true"></i>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="unika_collapse_content overview" >
                            <h2 class="title_2">
                                O<span>verv</span>iew
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
                                {$core->get_Lang('US')}
                                <span>$1250</span>
                            </div>
                            <span>{$core->get_Lang('Price includes room for 2 pax')}</span>
                        </div>
                        <a href="https://unikasia.vietiso.com/contact-us" class="contact d-flex align-items-center justify-content-center">{$core->get_Lang('Contact')}</a>
                    </div>
                </div>
                {if $arr_itinerary}
                <div class="collapse_content content_2_item" id="itineraries">
                    <div class="title_2">{$core->get_Lang('Itineraries')}</div>
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
                        <!-- <button class="item_btn_itineraries active">2 days itinerary</button> -->
                    </div>
                    {if $arr_itinerary_day}
                        {foreach from=$arr_itinerary_day key=key item=item}
                            {assign var="CruiseItineraryID" value=$item.info[0]}
                            {assign var="Child" value=$item.child}
                            <div class="unika_list_itineraries {if $key eq 0 } active {/if} unika_list_itineraries_{$CruiseItineraryID}">
                                <div class="list_new  d-flex flex-column">
                                    {if $Child}
                                        {foreach from=$Child key=k item=i}
                                            {assign var="CruiseItineraryDayID" value=$i.cruise_itinerary_day_id}
                                            {assign var="CruiseItineraryDayTitle"
                                            value=$clsCruiseItineraryDay->getTitle($CruiseItineraryDayID)}
                                            {assign var="CruiseItineraryDayImage"
                                            value=$clsCruiseItineraryDay->getImage($CruiseItineraryDayID, 346, 240)}
                                            {assign var="CruiseItineraryDayContent"
                                            value=$clsCruiseItineraryDay->getContent($CruiseItineraryDayID)}
                                            <div class="item_new">
                                                <div class="title_new d-flex justify-content-between align-items-center  cursor item_itineraries">
                                                    <div class="title_itineraries d-flex align-items-center ">
                                                        <div class="itineraries_fa">
                                                            <i class="fa-light fa-location-dot"></i>
                                                        </div>
                                                        <h3>{$CruiseItineraryDayTitle}</h3>
                                                    </div>
                                                    <div class="div_img">
                                                        <i class="fa-light fa-angle-down img_arrow"></i>
                                                        <i class="fa-light fa-angle-up img_arrow1"></i>
                                                    </div>
                                                </div>
                                                <div class="content_new">
                                                    <div class="new justify-content-between">
                                                        <div class="div_img">
                                                            <img src="{$CruiseItineraryDayImage}" width="346" height="240" alt="{$CruiseItineraryDayTitle}">
                                                        </div>
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
                            <h2 class="title_2">{$core->get_Lang('Things to know')}</h2>
                            <span class="span_thing_now">
                                {$core->get_Lang('Centara Mirage Resort Mui Ne takes special requests.. Contact now!')}
                            </span>
                        </div>
                        <a href="https://unikasia.vietiso.com/contact-us" class="d-flex align-items-center justify-content-center  button_contact">
                            {$core->get_Lang('Contact')}
                            <div class="div_img"><i class="fa-sharp fa-light fa-arrow-right" aria-hidden="true"></i>
                            </div>
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
                    <h2 class="title_2">{$core->get_Lang('Optional extensions')}</h2>
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
                    <h2 class="title_2">{$core->get_Lang('Reviews')}</h2>

                    <div class="reviews d-flex flex-column align-items-center justify-content-center ">
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
                        <form action="" class="unika_form_review">
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
                                        <input type="hidden" id="rates" name="unika_rates" class="unika_rating_input" value="5">
                                    </div>
                                </div>
                                <div class="unika_form_body">
                                    <div class="unika_body_item box_validate">
                                        <input type="text" class="unika_item_input" name="unika_fullname" placeholder="* Full name">
                                    </div>
                                    <div class="unika_body_item box_validate">
                                        <input type="text" class="unika_item_input" name="unika_title" placeholder="* Title of review">
                                    </div>
                                    <div class="unika_body_item box_validate">
                                        <textarea name="unika_review" class="unika_item_textara" id="" placeholder="* Your review"></textarea>
                                    </div>
                                    <div class="unika_body_item">
                                        <input type="submit" class="unika_item_submit" value="Submit your review">
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="list_reviews width-100 d-flex flex-column ">

                            <div class="item_reviews width-100 d-flex flex-column justify-content-start ">
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
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $list_related_cruise}    
            <div class=" d-flex justify-content-center">
                <div class="container">
                    <div class=" interested d-flex justify-content-center  flex-column align-items-center">
                        <h2 class="title_2">{$core->get_Lang('Maybe you are interested')}</h2>
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
                                            <div class="reviews d-flex align-items-center justify-content-start ">
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
                        <h2 class="title_2">{$core->get_Lang('Recently viewed')}</h2>
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
                                            <div class="reviews d-flex align-items-center justify-content-start ">
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
<style>
    .ellipsis_3 {
        display: -webkit-box !important;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
        text-align: left;
    }

    .height_72 {
        height: 72px;
    }

    .content_right_item li {
        color: var(--Neutral-1, #111D37);
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
    }
    
    .unikasia_cruise_detail{
        padding-top: 32px
    }

    .unika_cruise_detail {
        padding-top: 30px;
    }

    .unika_content_include li::marker,
    .unika_content_exclude li::marker {
        content: '';
    }

    .unika_content_include li::before {
        display: flex;
        align-items: center;
        justify-content: center;
        content: '\f00c';
        font-family: "Font Awesome 6 Pro";
        color: #13B97D;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        border: 1px solid #13B97D;
        position: relative;
    }

    .unika_content_exclude li::before {
        display: flex;
        align-items: center;
        justify-content: center;
        content: '\f00d';
        font-family: "Font Awesome 6 Pro";
        color: #FF4D00;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        border: 1px solid #FF4D00;
        position: relative;
    }

    .unika_content_include li,
    .unika_content_exclude li {
        display: flex;
        gap: 12px;
    }

    .content_right_item ul {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .thing_now_icon {
        font-size: 20px;
        width: 24px;
        text-align: center;
        color: #004EA8;
    }

    .btn_thing_know.active .thing_now_icon {
        color: #FFFFFF;
    }

    .unika_list_itineraries{
        display: none;
    }

    .unika_list_itineraries.active{
        display: block;
    }

    .unika_cruise_detail .div_img {
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .unika_cruise_detail .backcrump {
        padding: 30px 0px;
    }

    .unika_cruise_detail .backcrump_txt {
        font-size: 16px;
        font-weight: 600;
        line-height: 24px;
        color: #111D37;
        padding-right: 24px;
    }

    .unika_cruise_detail .item_bacrump {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: #FFA718;
    }

    .unika_cruise_detail .content_backcrump span {
        font-size: 16px;
        font-weight: 400;
        line-height: 24px;
        color: #111D37;
    }

    .unika_cruise_detail .content_backcrump {
        gap: 8px;
    }

    .unika_cruise_detail .list_btn {
        gap: 9px;
    }

    .unika_cruise_detail .cruise_information {
        padding-top: 4px;
        gap: 20px;
    }

    .unika_cruise_detail .cruise_star_rating {
        gap: 12px;
    }

    .unika_cruise_detail .rating .div_img {
        width: 24px;
        height: 24px;
    }

    .unika_cruise_detail .cruise_medium {
        gap: 8px;
    }

    .unika_cruise_detail .cruise_medium p {
        font-size: 16px;
        font-weight: 400;
        line-height: 24px;
        color: #111D37;
        margin: 0;
    }

    .unika_cruise_detail .price_contact {
        gap: 13px;
    }

    .unika_cruise_detail .cruise_price_1 {
        font-size: 14px;
        font-weight: 400;
        line-height: 20px;
        color: #959AA4;
        text-align: right;
    }

    .unika_cruise_detail .cruise_price {
        color: #FFA718;
        font-size: 20px;
        font-weight: 400;
        line-height: 32px;
        width: max-content;
    }

    .unika_cruise_detail .cruise_price span {
        font-size: 24px;
        font-style: normal;
        font-weight: 600;
        line-height: 36px;
        color: #FFA718;
        padding-left: 5px;
    }

    .btn_content_1 {
        width: 36px;
        height: 36px;
        border: unset;
        border-radius: 8px;
    }

    .content_1 .title {
        font-size: 32px;
        line-height: 52px;

    }

    .unika_cruise_detail .button_contact {
        width: 148px;
        background: #FFA718;
        height: 48px;
        border-radius: 8px;
        gap: 12px;
        color: #FFFFFF;
        transition: all .3s ease-in-out;
        cursor: pointer;
    }

    .unika_cruise_detail .button_contact:hover {
        background-color: #e88f00;
    }

    .unika_cruise_detail .count_star {
        padding: 4px;
        border-radius: 8px 8px 8px 0;
        background: #004EA8;
        width: 32px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #FFFFFF;
        font-size: 16px;
        line-height: 24px;
        font-weight: 600;
    }

    .unika_cruise_detail .view {
        color: #959aa4;
        font-weight: 400;
        line-height: 24px;
    }

    .unika_cruise_detail .show_all {
        color: #3f6df6;
        transition: all .3s ease-in-out;
    }

    .unika_cruise_detail .show_all:hover {
        color: #FFA718;
    }

    .cruise_img {
        border-radius: 8px;
    }

    .cruise_img_4 {
        position: relative;
    }

    .cruise_shadow {
        position: absolute;
        width: 100%;
        height: 100%;
        gap: 8px;
        border-radius: 8px;
        background: url(../images/img_shadow.png) no-repeat;
        background-size: 100%;
    }

    .content_left {
        width: calc(100% - 437px);
    }

    .unika_cruise_detail .content_right {
        padding: 24px;
        border-radius: 8px;
        height: fit-content;
        gap: 16px;
        background: var(--Accent-1, #FFF9F1);
    }

    .unika_cruise_detail .content_right .title {
        font-size: 24px;
        line-height: 36px;
        color: #111D37;
        font-weight: 600;
    }

    .unika_cruise_detail .content_right .content {
        min-width: 337px;
        background: #004EA8;
        padding: 16px 24px;
        border-radius: 8px;
        gap: 8px;
    }

    .unika_cruise_detail .content_right .contact {
        background: #FFA718;
        width: 337px;
        height: 48px;
        border-radius: 8px;
        color: #FFFFFF;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        transition: all .3s ease-in-out;
    }

    .unika_cruise_detail .content_right .contact:hover {
        background: #e88f00;
    }

    .unika_detail_collapse {
        height: fit-content;
        gap: 32px;
    }

    .unika_cruise_detail .item_collapse {
        cursor: pointer;
        color: #959AA4;
        font-size: 20px;
        font-weight: 600;
        line-height: 32px;
        width: max-content;
        transition: all .3s ease-in-out;
    }

    .unika_cruise_detail .item_collapse:hover {
        color: #FFA718;
    }

    .item_collapse.active {
        color: #111D37;
        padding-left: 6px;
        border-left: 6px solid #FFA718;
    }

    #overview{
        padding-top: 20px;
    }

    .overview {
        padding-top: 60px;
    }

    .information .div_img {
        width: 20px;
        height: 20px;
    }

    .unika_cruise_detail .information .txt {
        padding-left: 26px;
        padding-top: 6px;
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        color: #434B5C;
    }

    .unika_cruise_detail .information {
        padding-top: 24px;
        padding-bottom: 48px;
        gap: 16px;
    }

    .unika_item_information{
        gap: 15px;
    }

    .information .item {
        max-width: max-content;
    }

    .information d-flex flex-column 

    .collapse_content .name span {
        font-size: 14px !important;
        color: #434B5C;
    }

    .btn_itineraries {
        padding: 24px 0;
        gap: 16px;
    }

    .item_btn_itineraries {
        border: 1px solid #FFA718;
        border-radius: 8px;
        background: #FFFFFF;
        padding: 12px 16px;
    }

    .item_btn_itineraries.active {
        background: #FFA718;
        color: #FFFFFF;
    }

    .content_new .div_img {
        width: 346px;
        position: relative;
        margin: 16px 0;
    }

    .content_new .content {
        width: calc(100% - 378px);
        padding: 16px 0 32px 0;
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    .img_new {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: #FFA718;
    }

    .infor p {
        font-size: 18px;

        width: calc(100% - 40px - 16px);
    }

    .content_new {
        padding-left: 58px;
        position: relative;
        min-height: 20px;
    }

    .item_new::after {
        content: '';
        display: flex;
        width: 94.3%;
        right: 0;
        justify-content: end;
        border-top: 1px solid #D3DCE1;
        bottom: 10px;
        position: absolute;
    }

    .content_new::before {
        content: '';
    }

    .content_new::before {
        content: '';
        border-left: 1px dashed #959AA4;
        position: absolute;
        height: 100%;
        left: 20px;
    }

    .item_new {
        position: relative;
    }

    .item_new:last-child .content_new::before {
        display: none;
    }

    #things_to_know {
        max-width: 1312px;
        padding: 80px 0;
    }

    #things_to_know .content_left {
        width: 220px;
        border-right: 1px solid #D3DCE1;
    }

    #things_to_know .content_right {
        width: calc(100% - 220px);
        background: #FFFFFF;
        overflow-y: scroll;
        max-height: 390px;
    }

    #things_to_know .content_right::-webkit-scrollbar {
        width: 3px;
        height: 3px;
        background-color: #F5F5F5;
    }

    #things_to_know .content_right::-webkit-scrollbar-thumb {
        background-color: #cccccc;
    }

    #things_to_know .content {
        border: 1px solid #D3DCE1;
        border-radius: 8px;
        margin-top: 21px;
        max-width: 1312px;
    }

    .btn_thing_know {
        padding: 16px 24px;
        border-bottom: 1px solid #D3DCE1;
        gap: 6px;
        cursor: pointer;
    }

    .btn_thing_know:last-child {
        border-bottom: unset;
    }

    .btn_thing_know.active {
        background: #FFA718;
    }

    .btn_thing_know.active span {
        color: #FFFFFF;
    }

    .btn_thing_know span {
        text-align: left;
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        color: #111D37;
    }

    #optional_extensions {
        background: #FFF9F1;
        border-radius: 40px 40px 0 0;
        padding-top: 30px;
    }

    .item_content {
        width: calc(50% - 16px);
        padding-top: 40px;
    }

    .item_content .title_right,
    .item_content .title_left {
        padding: 8px 36px 8px 16px;
        width: fit-content;
        border-radius: 0 0 40px 0;
        color: #FFFFFF;
        font-size: 18px;
        font-style: normal;
        font-weight: 600;
        line-height: 28px;
    }

    .title_right {
        background: #13B97D;
    }

    .title_left {
        background: #FF3930;
    }

    .list_extensions {
        padding-top: 19px;
    }

    .img_extensions {
        max-width: 243px;
        min-width: 180px;
        max-height: 168px;
        border-radius: 8px;
    }

    .content_extensions {
        width: max-content;
        gap: 16px;
    }

    .reviews {
        max-width: 868px;
        width: 868px;
        padding: 0 30px;
    }

    .statistical_right {
        width: 198px;
        height: 198px;
        position: relative;
    }

    .statistical {
        width: 100%;
        background: #F7FAFC;
        border-radius: 8px;
        padding: 34px 36px;
        height: fit-content;
    }

    .content_statistical p {
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px;
        color: var(--Primary, #FFA718);
    }

    .percent {
        width: 66%;
        border-radius: 80px;
        background: #E2E8F0;
        height: 8px;
        position: relative;
    }

    .statistical_left {
        width: calc(100% - 259px);
        gap: 6px;
    }

    .item_statiscal {
        width: 100%;
        float: left;
    }

    .percent div {
        width: 50%;
        background: #FFA718;
        height: 8px;
        border-radius: 80px;
    }

    .item_statiscal p {
        width: 75px;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        color: var(--Neutral-2, #434B5C);
    }

    .item_statiscal span {
        width: 50px;
        text-align: right;
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-2, #434B5C);
    }

    .btn_write {
        background: #F7FAFC;
        border: unset;
        color: #FFA718;
        font-size: 18px;
        font-style: normal;
        font-weight: 600;
        line-height: 28px;
    }

    .content_reviews {
        color: #434B5C;
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
    }

    .view_more {
        width: fit-content;
        background: #FFFFFF;
        border: unset;
    }

    .item_reviews {
        padding-bottom: 16px;
        border-bottom: 1px solid #D3DCE1;
        gap: 16px;
    }

    #reviews {
        padding-top: 70px;
        gap: 24px;
    }

    .btn_love div {
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        width: 20px;
        height: 20px;
    }

    .img_item {
        position: relative;
        width: 100%;
        border-radius: 8px;
    }

    .item_interested {
        width: 100%;
        gap: 12px;
    }

    .img_interested {
        width: 20px;
        height: 20px;
    }

    .txt_interested {
        width: calc(100% - 25px);
        font-size: 14px;
        font-style: normal;
        font-weight: 400;
        line-height: 20px;
        color: var(--Neutral-2, #434B5C);
    }

    .count_reviews {
        padding: 4px;
        background: #004EA8;
        color: #FFFFFF;
        border-radius: 4px 4px 4px 0;
        font-size: 14px;
        font-style: normal;
        font-weight: 500;
        line-height: 20px;
    }

    .list_intersted {
        float: left;
        width: 100%;
    }

    .top_attractions_content {
        border-radius: 40px 40px 0px 0px;
        padding: 80px 0px;
        padding-bottom: 132px;
        background: #FFF9F1;
        position: relative;
    }

    .top_attractions_item {
        width: calc(50% - 20px);
        height: 797px;
    }

    .img_top_attractions {
        max-width: 257px;
        position: relative;
        border-radius: 8px;
        min-width: 200px;
    }

    .content_attractions {
        padding: 19px 20px 19px 20px;
        border-radius: 8px;
        background: #FFFFFF;
        position: relative;
        left: -10px;
        gap: 8px;
    }

    .list_top_attractions {
        position: relative;
    }

    .list_top_attractions::-webkit-scrollbar {
        width: 0px;
    }

    .btn_top_attractions {
        padding: 12px 42px;
        background: #FFA718;
        border-radius: 8px;
        gap: 8px;
        color: #FFFFFF;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        transition: all .3s ease-in-out;
    }

    .btn_top_attractions:hover {
        background: #e88f00;
    }

    .item_sites {
        position: relative;
    }

    .item_sites .div_img {
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .item_sites img:hover {
        object-fit: cover;
        -moz-transform: scale(1.2);
        -webkit-transform: scale(1.2);
        transform: scale(1.2);
    }

    .content_site {
        position: absolute;
        bottom: -5px;
        padding: 43px;
        width: 100%;
        background: linear-gradient(180deg, rgba(31, 36, 45, 0) 0%, #16181D 100%);
        font-size: 24px;
        line-height: 36px;
        font-weight: 600;
        color: var(--Neutral-6, #FFF);
    }

    .img_map {
        height: 100%;
    }

    .optional_extensions {
        padding: 48px 0px;
    }

    .interested,
    .blogs {
        padding: 80px 0px;
        padding-bottom: 0;
        gap: 32px;
        position: relative;
        float: left;
        width: 100%;
    }

    .list_sites {
        float: left;
        width: 100%;
    }

    #things_to_know .item_right .div_img {
        width: 24px;
        height: 24px;
    }

    #things_to_know .item_right span {
        width: calc(100% - 36px);
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    #itineraries{
        padding-top: 80px;
    }

    .cruise_title {
        font-size: 32px;
        line-height: 52px;
        font-weight: 600;
        color: #111D37;
    }

    .content_interested .reviews {
        padding: 0;
        width: 100%;
        gap: 7px;
    }

    .btn_thing_know .div_img {
        width: 24px;
        height: 24px;
    }

    .content_new .new {
        display: none;
    }

    .content_new .new.show {
        display: flex;
        align-items: start;
    }

    .img_arrow1 {
        display: none;
    }

    .img_1 {
        width: 67%;
    }

    .slick-track {
        float: left;
    }

    .content_statistical {
        position: absolute;
        top: 50px;
    }

    .sites {
        padding-top: 40px;
        width: 100%;
        background: #FFFFFF;
        border-radius: 40px 40px 0px 0px;
        gap: 48px;
    }

    /* css blog reviews */
    .reviews2 {
        float: left;
        width: 100%;
        max-width: 1312px;
        padding-bottom: 80px;
    }

    .item_review {
        width: 100%;
        position: relative;
    }

    .img_review {
        position: relative;
    }

    .content_review {
        padding: 24px;
        border-radius: 20px 20px 8px 8px;
        position: relative;
        margin-top: -24px;
        background: #FFFFFF;
        gap: 16px;
    }

    .img_review_author {
        width: 48px;
        height: 48px;
        border-radius: 50%;
    }

    .content_author {
        width: calc(100% - 48px - 11px);
    }

    .title_2,
    .title_2 span {
        font-size: 32px;
        font-weight: 600;
        line-height: 52px;
        color: #111D37;
        z-index: 0;
    }

    .unika_cruise_detail .title_2 span {
        position: relative;
    }

    .unika_cruise_detail .title_2 span::after {
        content: "";
        position: absolute;
        background-color: #ffa718;
        z-index: -1;
        height: 8px;
        width: 100%;
        left: 0;
        bottom: 8px;
    }

    .unika_cruise_detail .information .item .name span,
    .unika_cruise_detail .location .name span {
        font-size: 14px;
        font-style: normal;
        font-weight: 400;
        color: #434B5C;
        margin-left: 6px;
        line-height: 20px;
    }

    .unika_cruise_detail .content_right .content p {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: #FFFFFF;
    }

    .unika_cruise_detail .content_right .content span {
        font-size: 12px;
        font-style: normal;
        font-weight: 400;
        line-height: 16px;
        color: #D3DCE1;
    }

    .unika_cruise_detail .content_right .content div {
        font-size: 20px;
        font-style: normal;
        font-weight: 400;
        line-height: 33px;
        color: #FFFFFF;
    }

    .unika_cruise_detail .content_right .content div span {
        font-size: 24px;
        font-style: normal;
        font-weight: 600;
        line-height: 36px;
        color: #FFFFFF;
        margin-left: 6px;
    }

    .unika_cruise_detail .title_itineraries {
        width: 100%;
        gap: 18px;
        cursor: pointer;
    }

    .itineraries_fa {
        width: 40px;
        font-size: 20px;
        height: 40px;
        text-align: center;
        color: #FFFFFF;
        background: #FFA718;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .unika_cruise_detail .title_itineraries h3 {
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        color: #111D37;
        width: calc(100% - 24px - 18px);
    }

    .span_thing_now {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: #959AA4;
    }

    .item_right {
        gap: 12px;
    }

    .list_extensions {
        gap: 24px;
    }

    .item_extensions {
        padding: 12px;
        border-radius: 8px;
        border: 1px solid var(--Neutral-5, #F0F0F0);
        background: #FFF;
    }

    .list_extensions {
        gap: 24px;
    }

    .item_extensions {
        padding: 12px;
        border-radius: 8px;
        border: 1px solid var(--Neutral-5, #F0F0F0);
        background: #FFF;
        gap: 24px;
    }

    .title_extentions {
        font-size: 20px;
        font-style: normal;
        font-weight: 600;
        line-height: 30px;
        color: #111D37;
        transition: all .3s ease-in-out;
    }

    .title_extentions:hover {
        color: #FFA718;
    }

    .money_extention_1 {
        font-size: 14px;
        font-style: normal;
        font-weight: 400;
        line-height: 20px;
        color: #959AA4;
    }

    .money_extention_2 {
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        color: #FFA718;
        margin-left: 3px;
    }

    .money_extention_3 {
        color: var(--Primary, #FFA718);
        font-size: 24px;
        font-style: normal;
        font-weight: 600;
        line-height: 36px;
        margin-left: 3px;
    }

    .content_statistical .span_1 {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    .content_statistical .span_2 {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-3, #959AA4);
    }

    .unika_cruise_detail .div_img {
        transition: all .3s ease-in-out;
        border-radius: 8px;
    }

    .unika_cruise_detail .div_img img:hover {
        object-fit: cover;
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
        transition: all .3s ease-in-out;
    }

    .cruise_img_1 img,
    .cruise_img_2 img,
    .cruise_img_3 img,
    .cruise_img_4 img {
        height: 100%;
        width: 100%;
    }

    .swiper {
        width: 100%;
        height: 100%;
        z-index: 1;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .swiper-button-next:after,
    .swiper-button-prev:after {
        display: none;
    }

    .list_reviews {
        padding-top: 50px;
        gap: 32px;
    }

    .list_reviews {
        padding-top: 50px;
        gap: 32px;
    }

    .customer {
        gap: 15px;
    }

    .customer a {
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    .customer span {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-3, #959AA4);
    }

    .item_reviews .rating .div_img {
        width: 20px;
        height: 20px;
    }

    .title_reviews {
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        color: var(--Neutral-1, #111D37);
    }

    .customer .div_img {
        width: 51px;
        height: 51px;
        border-radius: 50%;
    }

    .view_more {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: #FFA718;
    }

    .title_interested {
        color: var(--Neutral-1, #111D37);
        font-size: 18px;
        font-style: normal;
        font-weight: 600;
        line-height: 28px;
        transition: all .3s ease-in-out;
    }


    .title_interested:hover {
        color: #FFA718;
    }

    .content_interested {
        gap: 12px;
    }

    .content_interested {
        gap: 12px;
    }

    .unika_cruise_detail .content_interested .rating .div_img {
        width: 16px;
        height: 16px;
    }

    .content_interested_title {
        gap: 4px;
    }

    .txt_interested span {
        font-size: 14px;
        font-style: normal;
        font-weight: 600;
        line-height: 20px;
        color: var(--Neutral-2, #434B5C);
    }

    .reviews .span_1 {
        font-size: 14px;
        font-style: normal;
        font-weight: 500;
        line-height: 20px;
        color: var(--Neutral-2, #434B5C);
    }

    .reviews .span_2 {
        font-size: 12px;
        font-style: normal;
        font-weight: 400;
        color: var(--Neutral-3, #959AA4);
        line-height: 16px;
    }

    .money_viwed_span {
        font-size: 14px;
        font-style: normal;
        font-weight: 500;
        line-height: 29px;
        color: var(--Neutral-3, #959AA4);
        margin-right: 6px;
    }

    .money_viwed_div {
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        color: var(--Primary, #FFA718);
    }

    .money_viwed_div span {
        font-size: 24px;
        font-style: normal;
        font-weight: 600;
        line-height: 36px;
        color: var(--Primary, #FFA718);
        margin-left: 2px;
    }

    .title_blogs {
        font-size: 18px;
        font-style: normal;
        font-weight: 600;
        line-height: 28px;
        color: var(--Neutral-1, #111D37);
        transition: all .3s ease-in-out;
    }

    .title_blogs:hover {
        color: #FFA718;
    }

    .content_blogs {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    .unika_ready_start {
        background: url(https://unikasia.vietiso.com/isocms/templates/default/skin/images/hotel/Frames1.png) no-repeat, #FFA718;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .unika_start {
        display: flex;
        padding: 60px 0;
        flex-direction: column;
        max-width: 604px;
        align-items: center;
    }

    .unika_title_ready {
        font-size: 32px;
        font-style: normal;
        font-weight: 600;
        line-height: 52px;
        color: var(--Neutral-1, #111D37);
        text-align: center;
    }

    .unika_content_ready {
        padding-top: 5px;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        text-align: center;
        color: var(--Neutral-2, #434B5C);
    }

    .unika_link_ready {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 12px 20px;
        border-radius: 8px;
        background: var(--Neutral-1, #111D37);
        max-width: 237px;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        color: #FFFFFF;
        margin-top: 48px;
        gap: 8px;
        transition: all .3s ease-in-out;
    }

    .unika_link_ready:hover {
        border: 1px solid white
    }

    .unika_social {
        position: fixed;
        top: 40%;
        right: 15px;
        z-index: 3;
    }

    .unika_social_icons {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .unika_social_icon {
        color: #959AA4;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 40px;
        background: #FFF;
        box-shadow: 0px 12px 32px 0px rgba(125, 135, 158, 0.09);
    }

    .unika_social_icon:hover {
        color: #FFA718;
        box-shadow: 0px 12px 24px 0px rgba(255, 167, 24, 0.36);
    }

    .rating_reviews .div_img {
        width: 18px;
        height: 18px;
    }

    .unika_author_blogs {
        gap: 10px;
    }

    .unika_content_author div {
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        color: var(--Neutral-1, #111D37);
    }

    .unika_content_author {
        gap: 3px;
    }

    .unika_content_author span {
        font-size: 14px;
        font-style: normal;
        font-weight: 400;
        line-height: 20px;
        color: var(--Neutral-2, #434B5C);
    }

    .top_attractions {
        background: #FFFFFF;
    }

    .unika_attractions {
        gap: 50px;
    }

    .attractions {
        gap: 39px;
        height: max-content;
    }

    .img_top_attractions img {
        height: 100%;
    }

    .content_attractions .title {
        font-size: 20px;
        font-style: normal;
        font-weight: 500;
        line-height: 32px;
        color: var(--Neutral-1, #111D37);
        transition: all .3s ease-in-out;
    }

    .content_attractions .title:hover {
        color: #FFA718;
    }

    .content_attractions .span {
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Neutral-2, #434B5C);
        text-align: justify;
    }

    .content_attractions .link {
        gap: 8px;
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        color: var(--Primary, #FFA718);
    }

    .unika_img_map {
        max-height: 797px;
    }

    .unika_also_like {
        background: #FFF9F1;
    }

    .swiper-button-prev {
        left: -5%;
        top: 60%;
        z-index: 2;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        fill: #FFF;
        background: #FFFFFF;
        border-radius: 50%;
        filter: drop-shadow(0px 6px 18px rgba(0, 0, 0, 0.08));
    }

    .swiper-button-next {
        right: -5%;
        top: 60%;
        z-index: 2;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        fill: #FFF;
        background: #FFFFFF;
        border-radius: 50%;
        filter: drop-shadow(0px 6px 18px rgba(0, 0, 0, 0.08));
    }

    .unika_tailor_made {
        position: fixed;
        bottom: 0px;
        transform: translate(-50%, -50%);
        left: 50%;
        z-index: 2;
    }

    .unika_link_tailor {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 9px;
        background: #fff;
        padding: 13px 15px 14px;
        border-radius: 39.5px;
        letter-spacing: 1.6px;
        color: var(--Neutral-1, #111d37);
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        box-shadow: 0px 12px 32px 0px rgba(125, 135, 158, 0.09);
    }

    .unika_img_tailor {
        width: 52px;
        height: 52px;
        background: #ffa718;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 100%;
    }

    .unika_form_review {
        margin-top: 20px;
        width: 100%;
        display: none;
    }

    .unika_form_content {
        border: 1px solid rgba(36, 107, 72, 0.12);
        border-radius: 4px;
        -moz-border-radius: 4px;
        -webkit-border-radius: 4px;
        -khtml-border-radius: 4px;
    }

    .unika_form_header {
        padding: 20px 25px;
        color: #FFA718;
        background: rgba(255, 167, 24, 0.08);
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .title_form {
        color: #FFA718;
        font-size: 16px;
        line-height: 24px;
        font-weight: 600;
    }

    .unika_rate_star {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 28px;
        width: 28px;
        color: #cccccc;
        cursor: pointer;
        border: 1px solid #DDD;
        border-radius: 50%;
    }

    .unika_rate_star.active {
        color: #F9D932;
    }

    .unika_form_rating {
        display: flex;
        gap: 8px;
        align-items: center;
        justify-content: start;
    }

    .unika_form_body {
        padding: 15px;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .unika_item_input {
        width: 100%;
        border: 1px solid #ccc;
        height: 50px;
        line-height: 50px;
        padding: 0 15px;
    }

    .unika_item_textara {
        width: 100%;
        padding: 15px;
        min-height: 120px;
        border: 1px solid #ccc;
    }

    .unika_item_submit {
        float: right;
        background: #FFA718;
        border: unset;
        padding: 6px 40px;
        border-radius: 4px;
        color: #FFFFFF;
        font-weight: 600;
    }

    .error {
        padding-top: 5px;
        font-size: 14px;
        line-height: 20px;
        color: red;
    }

    .cruise_img.img_1 img {
        height: 100%;
    }

    .cruise_shadow span {
        font-size: 24px;
        font-style: normal;
        font-weight: 600;
        line-height: 36px;
        color: #FFFFFF;
    }

    .unika_detail_fixed.fixed {
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        background: #FFFFFF;
        z-index: 4;
        box-shadow: 0px 0px 5px 0px rgba(125, 135, 158);
        padding: 0 10px;
    }

    .unika_detail_fixed_content.container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px;
        padding: 10px 0;
    }

    .price_contact_fixed {
        display: none;
    }

    .price_contact_fixed.active {
        display: flex;
    }

    .unika_detail_fixed.fixed .unika_detail_collapse {
        flex-wrap: nowrap !important;
    }

    .content_right_item {
        display: none;
    }

    .content_right_item.active {
        display: flex;
    }

    .item_top_attractions {
        transition: all .3s ease-in-out;
    }

    .item_top_attractions:hover {
        box-shadow: 0px 12px 24px 0px rgba(255, 167, 24, 0.36);
    }

    .top_attractions_item .swiper-slide {
        background: unset;
    }

    .top_attractions_item .swiper-button-prev,
    .top_attractions_item .swiper-button-next {
        transform: translate(-50%, -50%) rotate(90deg);
        left: 50%;
        background: #FFFFFF;
        z-index: 2;
        fill: #FFF;
        filter: drop-shadow(0px 6px 18px rgba(0, 0, 0, 0.08));
    }

    .top_attractions_item .swiper-button-prev {
        top: 30px;
        left: 50%;
    }

    .top_attractions_item .swiper-button-next {
        bottom: -15px;
        top: unset;
    }

    .fa-chevron-right:before,
    .fa-chevron-left:before {
        color: #434B5C;
    }

    .collapse_content .title {
        gap: 15px;
    }

    .unikasia_reviews {
        gap: 24px;
    }

    .unika_content_facility {
        flex-direction: row;
        flex-wrap: wrap;
        gap: 10px;
    }

    .unika_content_facility .item_right {
        width: calc(100% / 3 - 10px);
    }

    .content_facility_item {
        display: flex;
        flex-direction: column;
        gap: 12px;
        border-right: 1px solid #CCC;
        padding: 24px;
        border-bottom: 1px solid #CCC;
        width: 48%;
    }

    .content_facility_item:nth-child(2n) {
        border-right: unset;
        padding-right: 0;
    }

    .unika_list_img {
        display: grid;
        gap: 11px;
        padding: 32px 0;
    }

    .cruise_img_1 {
        grid-column: 1 / 4;
        grid-row: 1 / 5;
    }

    .cruise_img_2 {
        grid-column: 4 / 6;
        grid-row: 1 / 4;
    }

    .cruise_img_3 {
        grid-column: 4;
        grid-row: 4;
    }

    .cruise_img_4 {
        grid-column: 5;
        grid-row: 4;
    }

    .cruise_img_1 img {
        height: 100%;
    }

    @media screen and (min-width: 1920px) {
        .information .item {
            max-width: calc(25% - 10px);
        }
    }

    @media screen and (max-width: 1200px) {
        .cruise_img_1 {
            grid-column: 1/5;
            grid-row: 1;
        }

        .cruise_img_2 {
            grid-column: 1 / 5;
            grid-row: 2;
        }

        .cruise_img_3 {
            grid-column: 1/3;
            grid-row: 3;
        }

        .cruise_img_4 {
            grid-column: 3 / 5;
            grid-row: 3;
        }
    }

    @media screen and (max-width: 1025px) {
        .item_extensions {
            justify-content: start !important;
            width: 100%;
        }

        .content_new .div_img,
        .content_new .div_img img,
        .content_new .content {
            width: 100%;
        }

        .content_new .new {
            flex-direction: column;
        }

        .attractions {
            flex-direction: column;
        }

        .top_attractions_item {
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .optional_extensions .content {
            flex-direction: column;
        }

        .item_content {
            width: 100%;
        }

        .interested {
            padding: 50px 0;
            padding-bottom: 0;
        }

        .overviews {
            flex-direction: column;
            gap: 30px;
        }

        .content_left {
            width: 100%;
        }

    }

    @media screen and (max-width: 991px) {
        .unikasia_cruise_detail{
            padding-top: 0px
        }

        .unika_detail_collapse {
            gap: 20px;
        }

        .unika_content_facility {
            gap: 24px;
            flex-direction: column;
        }

        .unika_content_facility .item_right {
            width: 100%;
        }

        .content_facility_item {
            border-bottom: 1px solid #CCC;
            border-right: unset;
            width: 100%;
            padding: 0 0 24px 0;
        }

        .unika_detail_fixed_content.container .item_collapse {
            font-size: 16px;
            line-height: 24px;
        }

        .unika_detail_fixed_content.container {
            overflow-x: scroll;
        }

        .unika_detail_fixed_content.container::-webkit-scrollbar {
            height: 3px;
            background-color: #F5F5F5;
        }

        .unika_detail_fixed_content.container::-webkit-scrollbar-thumb {
            background-color: #cccccc;
        }

        .reviews {
            width: 100%;
        }
    }

    @media screen and (max-width: 768px) {
        .unika_tailor_made {
            display: none;
        }

        .statistical {
            flex-direction: column;
        }

        .content_new .new {
            flex-direction: column;
            gap: 15px;
        }

        .content_new .content {
            width: 100%;
        }

        .content_new .div_img {
            max-width: 100%;
            width: auto;
            height: fit-content;
            border-radius: 8px;
        }

        .statistical_left {
            width: 100%;
        }

        .reviews2 {
            padding-bottom: 20px;
        }

        .top_attractions {
            padding: 40px 0;
        }

        .top_attractions::after {
            display: none;
        }

        .sites {
            padding-top: 20px;
        }

        .cruise {
            flex-wrap: wrap;
        }

        .img_1 {
            width: 100%;
        }

        #overview {
            padding-top: 30px;
        }
    }

    @media screen and (max-width: 545px) {
        .content_new {
            padding-left: 35px;
        }

        .percent {
            width: 33%;
        }

        .div_img.img_extensions img {
            width: 100%;
        }

        #things_to_know .content {
            flex-direction: column;
            overflow: hidden;
        }

        #things_to_know .content_left {
            display: flex;
            overflow-x: scroll;
            width: 100%;
        }

        #things_to_know .content_left::-webkit-scrollbar {
            height: 3px;
            background-color: #F5F5F5;
        }

        #things_to_know .content_left::-webkit-scrollbar-thumb {
            background-color: #cccccc;
        }

        .btn_thing_know {
            padding: 10px;
            width: fit-content;
            border-right: 1px solid #D3DCE1;
        }

        .btn_thing_know:last-child {
            border-bottom: 1px solid #D3DCE1;
            border-right: unset;
        }

        #things_to_know .content_right {
            width: 100%;
        }

        .btn_thing_know span {
            width: max-content;
        }

        .collapse {
            gap: 20px;
        }

        .item_top_attractions {
            flex-direction: column;
        }

        .content_attractions {
            width: 100%;
            left: 0;
            top: -20px;
        }

        .img_top_attractions {
            max-width: 100%;
            width: auto;
        }

        .img_top_attractions img {
            border-radius: 8px;
            width: 100%;
        }

        .item_top_attractions {
            max-width: 100%;
        }

        .item_extensions {
            flex-direction: column;
            gap: 10px;
            width: 100%;
        }

        .img_extensions {
            width: 100%;
            max-width: 100%;
        }

        .content_extensions {
            width: 100%;
        }

        #things_to_know {
            padding: 20px 0;
        }

        #reviews,
        .interested {
            padding-top: 20px;
        }

        .unika_start {
            padding: 60px 24px;
        }

        .unika_link_ready {
            max-width: 100%;
            width: 100%;
        }

        .unika_title_ready {
            font-size: 24px;
            font-style: normal;
            font-weight: 600;
            line-height: 36px;
        }

        .unika_content_ready {
            font-size: 14px;
            font-style: normal;
            font-weight: 400;
            line-height: 20px;
        }
    }
</style>
{/literal}

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
                if (self.find('.new').hasClass('show')) {
                    self.find('.new').removeClass('show');
                    self.find('.img_arrow1').hide();
                    self.find('.img_arrow').show();
                } else {
                    self.find('.new').addClass('show');
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
            submitHandler: function() {
                $.ajax({
                type: "POST",
                url: "",
                beforeSend: function (xhr) {
                    $('.unika_item_submit').val("Processing...").prop('disabled', true);
                },
                success: function (res) {
                    $('.unika_item_submit').val("Submit your review").prop('disabled', false);
                    alert("Successfully! Please check email!");
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