{assign var=title_hotel value=$clsHotel->getTitle($hotel_id,$oneItem)}
{assign var=hotel__id value=$hotel_id}
{assign var=intro_hotel value=$oneItem.intro}
{assign var=overview_hotel value=$oneItem.overview}
{assign var=bookingPolicy_hotel value=$clsHotel->getHotelBookingPolicy($hotel_id,oneItem)}
{assign var = getImageStar value = $clsHotel->getStarNumber($hotel_id)}
{assign var = roomFaciliti value = $clsHotel->getRoomFaci($hotel_id, $oneItem)}

{if $clsISO->getCheckActiveModulePackage($package_id,'member','default','default')}
    {assign var= ratingValue value= $clsReviews->getRateAvg($hotel_id,'hotel')}
    {assign var= bestRating value= $clsReviews->getBestRate($hotel_id,'hotel')}
    {assign var= ratingCount value= $clsReviews->getToTalReview($hotel_id,'hotel')}
{else}
    {assign var= ratingValue value= $clsReviews->getRateAvgNoLogin($hotel_id,'hotel')}
    {assign var= bestRating value= $clsReviews->getBestRate($hotel_id,'hotel')}
    {assign var= ratingCount value= $clsReviews->getToTalReviewNoLogin($hotel_id,'hotel')}
{/if}

{math equation=x*2 assign="rating_value_of_10" x=$ratingValue}
{assign var=textRateAvg value=$clsReviews->getTextRateAvg($hotel__id,'hotel')}
{literal}
    <script type="application/ld+json">
        {
            "@context": "https://schema.org",
            "@type": "Hotel",
            "name": "{/literal}{$title_hotel}{literal}",
            "description": "{/literal}{$intro_hotel|html_entity_decode|replace:'"':'\"'|strip_tags}{literal}",
            "address": {
                "@type": "PostalAddress",
                "addressCountry": "{/literal}{$_LANG_ID}{literal}",
                "addressLocality": "",
                "addressRegion": "{/literal}{$district_name}{literal}",
                "postalCode": "",
                "streetAddress": "{/literal}{$clsHotel->getAddress($hotel_id,$oneItem)}{literal}"
            },
            "telephone": "{/literal}{$oneItem.phone}{literal}",
            "photo": [
            {/literal}
            {section name=i loop=$listImage}
                {literal}
                    "{/literal}{$DOMAIN_NAME}{$listImage[i].image}{literal}",
                    {/literal}{/section}{literal}
                    "{/literal}{$DOMAIN_NAME}{$oneItem.image}{literal}"
                ]
            }
        </script>
    {/literal}

    <link rel="stylesheet" href="{$URL_CSS}/detail_hotel.css?v={$upd_version}" as="style" />

<section class="detail_hotel_body pageen stayBody computer">
    <div class="page_container page_detail_stay bg_fff">
        <nav class="breadcrumb-main  breadcrumb-cruise bg-default breadcrumb-more bg_fff">
            <div class="container">
                <ul class="breadcrumb hidden-xs mt0 bg_fff navbarHeads" itemscope
                    itemtype="https://schema.org/BreadcrumbList">
                    <li class="breadcrumb-nav-first">{$core->get_Lang('You are here')}</li>
                    <li class="breadcrumb-nav-list" style="margin-left: 24px;">
                        <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            <a itemprop="item" href="{$PCMS_URL}" title="{$core->get_Lang('Home')}">
                                <span itemprop="name" class="breadcrumb-activeItem">{$core->get_Lang('Home')}</span></a>
                            <meta itemprop="position" content="1" />
                            <img style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/arow.svg" alt="error">
                        </div>
                        <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            <a itemprop="item" href="{$clsISO->getLink('hotel')}" title="{$core->get_Lang('Hotels')}">
                                <span itemprop="name" class="breadcrumb-activeItem">{$core->get_Lang('Hotels')}</span></a>
                            <meta itemprop="position" content="2" />
                            <img style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/arow.svg" alt="error">
                        </div>

                        <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            {if $oneItem.country_id}
                                {assign var=title_country value=$clsCountryEx->getTitle($oneItem.country_id)}
                        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            <a itemprop="item" href="{$clsCountryEx->getLink($oneItem.country_id,'Hotel')}"
                                title="{$title_country}">
                                <span itemprop="name" class="reb detail-hotel-contrys">{$title_country}</span></a>
                            <meta itemprop="position" content="3" />
                            <img style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/arow.svg" alt="error">
                        </li>
                        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="active">
                            <a itemprop="item" href="{$curl}" title="{$title_hotel}">
                                <span itemprop="name" class="reb detailHotesName">{$title_hotel}</span></a>
                            <meta itemprop="position" content="4" />
                        </li>
                    {else}
                        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="active">
                            <a itemprop="item" href="{$curl}" title="{$title_hotel}">
                                <span itemprop="name" class="reb detailHotesName">{$title_hotel}</span></a>
                            <meta itemprop="position" content="3" />
                        </li>
                    {/if}
            </div>

            </li>
            </ul>
            <div class="navbarHeads-title">
				<div class="container">
                {if $oneItem.country_id}
                    {assign var=title_country value=$clsCountryEx->getTitle($oneItem.country_id)}
                    <h1 class="navbarHeads-li">
                        <a href="{$curl}" title="{$title_hotel}">
                            <span itemprop="name" class="reb navbarHeads-nav">{$title_hotel}</span></a>
						<div class="border-icoshare submitted">
						 <div class="share_box">
							<i class="fa-regular fa-share-nodes fa-2xs"></i>                                
							 <script type="text/javascript" src="{$URL_JS}/jquery.sharer.js?v={$upd_version}"></script>
                                {assign var=link_share value=$curl}
                                {assign var=$title_share value=$title_blog}
                                {$core->getBlock('box_share')}
                            </div>
							</div>
                        <meta itemprop="position" content="4" />
                    </h1>
                {else}
                    <h1 class="navbarHeads-li">
                        <a href="{$curl}" title="{$title_hotel}">
                            <span itemprop="name" class="reb navbarHeads-nav">{$title_hotel}</span></a>
                        <meta itemprop="position" content="3" />
                    </h1>
                {/if}

                <div class="detailStartsHotels">
                    <div class="star_hotel">{$getImageStar}</div>
                </div>

                <div class="detailReviewsHotels">
                    {if !isset($ratingCount) || !$ratingCount}
                        <div class="reviews" style=""></div>
                    {else}
                        <div class="reviewsDetailHotels">
                            <div class="rate">{$ratingValue|number_format:1}</div>
                            <p>
                                {$textRateAvg}
                                <span>
                                    ({$ratingCount} {$core->get_Lang('reviews')})
                                </span>
                            </p>
                            <ul class="scroll-title">
                                <li><a href="#Reviews"
                                        class="ShowAllReviewDetailHotel">{$core->get_Lang('Show all reviews')}</a></li>
                            </ul>
                        </div>
                    {/if}
                    {* <a class="view_all_review btn_write_review btn_write_review_login ShowAllReviewDetailHotel"
                        href="javascript:void(0);"
                        title="{$core->get_Lang('Reviews')}">{$core->get_Lang('Show all reviews')}</a> *}

                    <div class="location_scorereview">
						 <div class="record_txt">
                    <div class="txt_score-review">
                <div class="border_score">
                    <p class="numb_scorestay">0.0</p>
                </div>
                <div class="txt_reviewsquality">
                <p class="txt_qualityreview">{$textRateAvg} <span class="txt_reviews">({$ratingCount} {$core->get_Lang('reviews')})</span></p>
					 <ul class="scroll-title">
                            <li><a href="#Reviews"
                                    class="ShowAllReviewDetailHotel">{$core->get_Lang('Show all reviews')}</a></li>
                        </ul>
            </div>		
            </div>			 
            </div>

							<div class="txt_icolocation">
							<i class="fa-sharp fa-solid fa-location-dot" style="color: #9a9aa4;"></i>
							<p class="txt_location">{$clsHotel->getAddress($hotel_id,$arrHotel)}</p>
                            <a role="link" title="map" data-bs-toggle="modal" data-bs-target="#mapModal{$hotel_id}">{$core->get_Lang('Show map')}</a>

                                    <div class="modal fade mapModal" id="mapModal{$hotel_id}" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">

                                        <div class="modal-dialog">

                                            <div class="modal-content">

                                                <div class="modal-header">

                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                                                </div>

                                                <div class="modal-body">

                                                    <iframe src="https://maps.google.it/maps?q={$clsHotel->getAddressMapView($hotel_id,$oneItem)}&output=embed" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

								</div>
							
					
					</div>
					<div class="txt_numbt">
						<div class="txt_numbfromus">
						<p class="txt_fromnum">{$core->get_Lang('from')}</p>
						<p class="txt_txtus">{$core->get_Lang('US')} <span class="txt_numbus">{$clsHotel->getPriceOnPromotion($hotel_id)}</span></p>
						</div>
													

						<div class="btn_contactus">
							<a href="{$PCMS_URL}contact-us" alt="contactus" title="contactus">
                               <button class="btn btn_viewtour">{$core->get_Lang('Contact')} <i
                                                        class="fa-regular fa-arrow-right" style="color: #ffffff;"></i>
                                  </button>
                                        </a>
							</div>
					</div>
                       
                  </div>
</div>
                </div>
    </div>
    </nav>

    <div id="contentPage" class="content hotelPageDetail mt05">
        <div class="hotelDetail">
            <div class="container">
                <section class="section_box_image_top">
                    <div class="row">
                        <div class="col-lg-8">
							{section name=i loop=1}
                            <div class="big_image">
                                <img class="img100" alt="{$clsHotelImage->getTitle($listImage[i].hotel_image_id,$listImage[i])}"
                                    src="{$clsHotelImage->getImage($listImage[i].hotel_image_id,841,420)}" />
                                {if $listImage}
								<div class="view_all" data-fancybox="gallery-hotel" href="{$clsHotelImage->getImage($listImage[i].hotel_image_id,841,420)}">+{$listImage|count}
                                    </div>
								{/if}
                            </div>
							{/section}
							                               

                        </div>
                        <div class="col-lg-4">
                            <div class="list_image_small">
                                {section name=i loop=$listImage start=1}
                                    <div class="small_image" data-fancybox="gallery-hotel" href="{$listImage[i].image}"
                                        {if $smarty.section.i.index gt 4}hidden{/if}>
                                        <img class="img100"
                                            alt="{$clsHotelImage->getTitle($listImage[i].hotel_image_id,$listImage[i])}"
                                            src="{$clsHotelImage->getImage($listImage[i].hotel_image_id,202,202)}" />
                                    </div>
                                {/section}
								
                            </div>
                        </div>
                    </div>
                </section>

                <div class="row">
                    <div class="col-lg-8">
                        <section class="hotel_detail_main">
                            <div class="scroll-nav">
                                <ul class="scroll-title container">
                                    <li><a class="nav-link" data-target=".scroll_overview">{$core->get_Lang('Overview')}</a></li>
                                    <li><a class="nav-link" data-target=".scroll_accommodation">{$core->get_Lang('Accommodation')}</a></li>
                                    <li><a class="nav-link" data-target=".scroll_addons">{$core->get_Lang('Add-ons')}</a></li>
                                    <li><a class="nav-link" data-target=".scroll_inclusion">{$core->get_Lang('Inclusion')}</a></li>
                                    <li><a class="nav-link" data-target=".scroll_thing">{$core->get_Lang('Things to know')}</a></li>
                                    <li><a class="nav-link" data-target=".scroll_reviews">{$core->get_Lang('Reviews')}</a></li>
									
									<div class="txt_numbt">
						<div class="txt_numbfromus">
						<p class="txt_fromnum">{$core->get_Lang('from')}</p>
						<p class="txt_txtus">{$core->get_Lang('US')} <span class="txt_numbus">{$clsHotel->getPriceOnPromotion($hotel_id)}</span></p>
						</div>
						<div class="btn_contactus">
							<a href="{$PCMS_URL}contact-us" alt="contactus" title="contactus">
                               <button class="btn btn_viewtour">{$core->get_Lang('Contact')} <i
                                                        class="fa-regular fa-arrow-right" style="color: #ffffff;"></i>
                                  </button>
                                        </a>
							</div>
					</div>
                                </ul>
								
								
                            </div>
                            <div id="Overview" class="scroll_overview">
                                {if !isset($overview_hotel) || !$overview_hotel}
                                {else}
                                    <div class="nav-content">
                                        <h2 class="nav-content-title title_overview">{$core->get_Lang('Overview')}</h2>
										
                                <div class="list_facilities">

                                    {section name=i loop=$listHotelFacilitiesFavorite}

									
                                    <div class="facilities_item align-items-center">

                                        <img width="16" height="16" src="{$listHotelFacilitiesFavorite[i].image}"/>

                                 

                                        <div class="facilities_name">

                                            {$clsProperty->getTitle($listHotelFacilitiesFavorite[i].property_id)}

                                        </div>

                                    </div>

                                    {/section}
											
										</div>
										
										 <div class="overview-content">{$overview_hotel|html_entity_decode}</div>
                                    </div>

 
										</div>
																				{/if}


                                {* <div class="info_review_top">
                                <div class="info_review_top_left">
                                    {if $clsProperty->getTitle($oneItem.list_TypeHotel)}
                                        <div class="hotel_text_cat">
                                            {$clsProperty->getTitle($oneItem.list_TypeHotel)}
                                        </div>
                                    {/if}
                                    <div class="rank_level">
                                        {$ratingValue|number_format:1}/5 - {$textRateAvg}
                                    </div>
                                    <div class="total_review">
                                        {$ratingCount} {$core->get_Lang('reviews')}
                                    </div>
                                </div>
                                <div class="icon_share">
                                    <i class="ic ic_share"></i>
                                    <div class="share_box">
                                        <script type="text/javascript" src="{$URL_JS}/jquery.sharer.js?v={$up_version}">
                                        </script>
                                        {assign var=link_share value=$curl}
                                        {assign var=title_share value=$title_hotel}
                                        {$clsISO->getBlock('box_share',["link_share"=>$link_share,"title_share"=>$title_share])}
                                    </div>
                                </div>
                            </div> *}
                                {* <div class="box_sec_title">
                                <h1 class="sec_title">
                                    {$title_hotel}
                                    {$clsHotel->getStarNew($hotel_id,$oneItem)}
                                </h1>
                                <div class="address">
                                    <i class="fa fa-map-marker"></i>&nbsp;&nbsp;{$clsHotel->getAddress($hotel_id,$oneItem)}
                                    -
                                    <a role="link" title="map" data-bs-toggle="modal"
                                        data-bs-target="#mapModal{$hotel__id}">{$core->get_Lang('Show map')}</a>
                                    <div class="modal fade mapModal" id="mapModal{$hotel__id}" tabindex="-1"
                                        aria-labelledby="mapModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <iframe
                                                        src="https://maps.google.it/maps?q={$clsHotel->getAddressMapView($hotel_id,$oneItem)}&output=embed"
                                                        width="600" height="450" style="border:0;" allowfullscreen=""
                                                        loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sec_intro">
                                {$overview_hotel|html_entity_decode}
                            </div>

                            {if $lstHotelFacility}
                                <div class="box_facilities">
                                    <div class="box_facilities_title">
                                        {$core->get_Lang('Most popular amenities')}
                                    </div>
                                    <div class="list_facilities">
                                        {section name=i loop=$lstHotelFacility}
                                            <div class="facilities_item align-items-center">
                                                {if $clsProperty->getImage($lstHotelFacility[i])}
                                                    <img width="16" height="16" src="{$clsProperty->getImage($lstHotelFacility[i])}"
                                                        alt="{$clsProperty->getTitle($lstHotelFacility[i])}" />
                                                {/if}
                                                <div class="facilities_name">
                                                    {$clsProperty->getTitle($lstHotelFacility[i])}
                                                </div>
                                            </div>
                                        {/section}
                                    </div>
                                </div>
                            {/if} *}

                        </section>

                    </div>
                    <div class="col-lg-4">
                        <section class="box_right_info_hotel sticky_fix">
                            <div class="box_info_right_top">
								<h3 class="txt_bestprice">{$core->get_Lang('Best price for you')}</h3>
									<div class="price_from_text">
                                        <div class="from_text">
                                            {$core->get_Lang('Avg price package')}
                                        </div>
                                        <div class="val_price">
                                           <p class="txt_prival">US <h3 class="numb_prival">{if $clsHotel->getPriceOnPromotion($hotel_id,'detail')}
                            ${$clsHotel->getPriceAvg($hotel_id)}
                        {else}
                            {$core->get_Lang('Contact us')}
                        {/if}</h3></p>
                                        </div>
								<p class="txt_pricepax">Price includes package</p>
                                </div>
							<div class="btn_contactus">
								 <input type="hidden" name="hotel_id" value="{$hotel_id}">
                                    <input type="hidden" name="ContactHotel" value="ContactHotel">
							<a href="{$PCMS_URL}contact-us" alt="contactus" title="contactus">
                               <button class="btn btn_contactprice">{$core->get_Lang('Contact')} <i
                                                        class="fa-regular fa-arrow-right" style="color: #ffffff;"></i>
                                  </button>
                                        </a>
							</div>
                            </div>
                           
                        </section>
                    </div>
                </div>

                <div id="Accommodation" class="scroll_accommodation">
                    {if !isset($oneItem) || !$oneItem}
                    {else}
                        <div class="nav-content">
                            <div class="nav-content-title tabs2">
                                <h2 class="tabs2-title title-au">{$core->get_Lang('Accommodation')}</h2>
                            </div>
                            <div class="Accommodation-txt">
                                {$oneItem.booking_policy|unescape}
                            </div>
							
<div class="border-accomm">
    <div class="row">
        <div class="col-md-4">
            <div class="column-content">
                <h4>Bathroom</h4>
                <div class="item"><i class="fa-thin fa-toilet-paper-blank-under fa-xl" style="color: #434b5c;"></i> Toilet paper</div>
                <div class="item"><img src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgaWQ9ImJhdGgtdG93ZWwgMSI+CjxwYXRoIGlkPSJWZWN0b3IiIGQ9Ik0yMy42MjUxIDkuMDU3NzRDMjMuNjI0NCA4LjUyNTE1IDIzLjQ1OCA4LjAwNTk3IDIzLjE0ODkgNy41NzIyN0MyMi44Mzk4IDcuMTM4NTYgMjIuNDAzMyA2LjgxMTg1IDIxLjkwMDEgNi42Mzc0OUwxNS4xMTkzIDQuMjg4ODdDMTMuMTU0MiAzLjYxMTQzIDExLjAyNSAzLjU3NDQgOS4wMzc1NiA0LjE4MzEyTDEuOTg3NTYgNi4zNTE3NEMxLjUxOTY4IDYuNDkzODcgMS4xMTAwOSA2Ljc4MzA5IDAuODE5NjA4IDcuMTc2NDVDMC41MjkxMjYgNy41Njk4MiAwLjM3MzIzIDguMDQ2MzcgMC4zNzUwNjIgOC41MzUzN0MwLjM3NTYzIDkuMDYwOTIgMC40ODEwNjMgOS41ODEwNyAwLjY4NTE4NyAxMC4wNjU0QzAuNDgyNzExIDEwLjM0NjMgMC4zNzQxNjkgMTAuNjg0IDAuMzc1MDYyIDExLjAzMDJDMC4zNzUyMjYgMTEuMjY3IDAuNDQ1NzA1IDExLjQ5ODQgMC41Nzc1NiAxMS42OTUxQzAuNzA5NDE1IDExLjg5MTggMC44OTY3MDcgMTIuMDQ0OSAxLjExNTY5IDEyLjEzNUMwLjgyMjA1IDEyLjQzMTQgMC42MDUzODMgMTIuNzk1MiAwLjQ4NDU3NCAxMy4xOTQ2QzAuMzYzNzY0IDEzLjU5NCAwLjM0MjQ3OSAxNC4wMTY5IDAuNDIyNTc1IDE0LjQyNjRDMC41MDI2NyAxNC44MzU5IDAuNjgxNzE0IDE1LjIxOTYgMC45NDQwOTkgMTUuNTQ0QzEuMjA2NDggMTUuODY4NCAxLjU0NDI0IDE2LjEyMzggMS45Mjc5NCAxNi4yODc3TDEwLjE0MDQgMTkuODA3MUMxMS4zNzMyIDIwLjMzNTYgMTIuNzU3MiAyMC4zOTMxIDE0LjAyOTYgMTkuOTY4N0wyMi44MDQ2IDE3LjA0MzdDMjMuMDQzNSAxNi45NjQxIDIzLjI1MTMgMTYuODExMyAyMy4zOTg2IDE2LjYwNjlDMjMuNTQ1OCAxNi40MDI2IDIzLjYyNTEgMTYuMTU3MSAyMy42MjUxIDE1LjkwNTJDMjMuNjI2IDE1LjU1OSAyMy41MTc0IDE1LjIyMTMgMjMuMzE0OSAxNC45NDA0QzIzLjUxOTEgMTQuNDU2MSAyMy42MjQ1IDEzLjkzNTkgMjMuNjI1MSAxMy40MTA0QzIzLjYyNjEgMTIuOTY1NSAyMy40OTYxIDEyLjUzMDIgMjMuMjUxNSAxMi4xNTg2QzIzLjAwNjggMTEuNzg3MSAyMi42NTgyIDExLjQ5NTcgMjIuMjQ5MiAxMS4zMjA5QzIyLjY2MzYgMTEuMTA1NiAyMy4wMTEgMTAuNzgwNyAyMy4yNTM2IDEwLjM4MTdDMjMuNDk2MSA5Ljk4MjY1IDIzLjYyNDYgOS41MjQ3MiAyMy42MjUxIDkuMDU3NzRaTTIyLjg3NTEgMTMuNDEwNEMyMi44NzI5IDEzLjg1MjkgMjIuNzc4OCAxNC4yOTAxIDIyLjU5ODcgMTQuNjk0NEwxNS4xMTk3IDE3LjA3NDFDMTQuNzUzNiAxNy4xOTA2IDE0LjM3MTcgMTcuMjQ5OSAxMy45ODc2IDE3LjI1QzEzLjg3MTcgMTcuMjQ4NyAxMy43NiAxNy4yMDYyIDEzLjY3MjYgMTcuMTMwMUMxMy41ODUzIDE3LjA1MzkgMTMuNTI3OSAxNi45NDkxIDEzLjUxMDggMTYuODM0NUMxMy40OTM3IDE2LjcxOTkgMTMuNTE3OSAxNi42MDI5IDEzLjU3OTMgMTYuNTA0NUMxMy42NDA2IDE2LjQwNjIgMTMuNzM1IDE2LjMzMjkgMTMuODQ1NCAxNi4yOTc5TDIxLjg1OTkgMTMuODYwNEwyMS42NDE3IDEzLjE0MjZMMTMuNjI2NCAxNS41ODA1QzEzLjM0NDEgMTUuNjY4IDEzLjEwMjMgMTUuODUzOCAxMi45NDUgMTYuMTA0MUMxMi43ODc3IDE2LjM1NDQgMTIuNzI1MyAxNi42NTI4IDEyLjc2ODkgMTYuOTQ1MkMxMi44MTI1IDE3LjIzNzYgMTIuOTU5NCAxNy41MDQ3IDEzLjE4MyAxNy42OTgyQzEzLjQwNjUgMTcuODkxNyAxMy42OTE5IDE3Ljk5ODcgMTMuOTg3NiAxOEMxNC40NDkxIDE4LjAwMDEgMTQuOTA3OSAxNy45Mjg5IDE1LjM0NzcgMTcuNzg4OUwyMi43NDEyIDE1LjQzNjVDMjIuODI3NiAxNS41Nzc3IDIyLjg3MzkgMTUuNzM5NyAyMi44NzUxIDE1LjkwNTJDMjIuODc1MSAxNS45OTk3IDIyLjg0NTQgMTYuMDkxOSAyMi43OTAxIDE2LjE2ODVDMjIuNzM0OCAxNi4yNDUyIDIyLjY1NjkgMTYuMzAyNSAyMi41NjcyIDE2LjMzMjRMMTMuNzkyMiAxOS4yNTc0QzEyLjY5MzggMTkuNjIxNiAxMS41MDAzIDE5LjU3MiAxMC40MzU5IDE5LjExNzlMMi4yMjM0NCAxNS42QzEuOTIyMTEgMTUuNDcxMyAxLjY2MTQxIDE1LjI2MzEgMS40NjkxNyAxNC45OTc3QzEuMjc2OTQgMTQuNzMyNCAxLjE2MDM5IDE0LjQxOTggMS4xMzE5NyAxNC4wOTMzQzEuMTAzNTYgMTMuNzY2OSAxLjE2NDM0IDEzLjQzODkgMS4zMDc4MyAxMy4xNDQzQzEuNDUxMzIgMTIuODQ5NyAxLjY3MjE0IDEyLjU5OTYgMS45NDY2OSAxMi40MjA3TDkuOTcxNjkgMTUuMDk1MkMxMS4yNDQxIDE1LjUxOTYgMTIuNjI4IDE1LjQ2MjEgMTMuODYwOCAxNC45MzM2TDIxLjIzNDggMTEuNzczNUwyMS43OTI0IDExLjk0NTJDMjIuMTA2NCAxMi4wNDA3IDIyLjM4MTIgMTIuMjM0NyAyMi41NzYyIDEyLjQ5ODZDMjIuNzcxMiAxMi43NjI1IDIyLjg3NiAxMy4wODIyIDIyLjg3NTEgMTMuNDEwNFpNMjEuNzc2NyAxMC43MjVMMTMuNTY0MiAxNC4yNDQ0QzEyLjQ5OTkgMTQuNjk4OCAxMS4zMDYyIDE0Ljc0ODUgMTAuMjA3OSAxNC4zODM5TDEuNDMyOTQgMTEuNDU4OUMxLjM0MzAyIDExLjQyODkgMS4yNjQ4NSAxMS4zNzE0IDEuMjA5NTcgMTEuMjk0NEMxLjE1NDI5IDExLjIxNzUgMS4xMjQ3MSAxMS4xMjUgMS4xMjUwNiAxMS4wMzAyQzEuMTI2NSAxMC44NjQ3IDEuMTczMDQgMTAuNzAyNiAxLjI1OTY5IDEwLjU2MTVMOC42NTMxOSAxMi45MTM5QzkuMDkyNzMgMTMuMDUzOCA5LjU1MTI3IDEzLjEyNTEgMTAuMDEyNiAxMy4xMjVDMTAuMzA4MSAxMy4xMjM2IDEwLjU5MzQgMTMuMDE2NCAxMC44MTY4IDEyLjgyMjhDMTEuMDQwMiAxMi42MjkzIDExLjE4NyAxMi4zNjIyIDExLjIzMDUgMTIuMDY5OEMxMS4yNzQxIDExLjc3NzUgMTEuMjExNSAxMS40NzkyIDExLjA1NDIgMTEuMjI4OUMxMC44OTY5IDEwLjk3ODcgMTAuNjU1MyAxMC43OTMgMTAuMzcyOSAxMC43MDU1TDIuMzU4NDQgOC4yNjc5OUwyLjE0MDE5IDguOTg1NzRMMTAuMTU0NyAxMS40MjMyQzEwLjI2NDkgMTEuNDU4NSAxMC4zNTg5IDExLjUzMTggMTAuNDIgMTEuNjMwMUMxMC40ODExIDExLjcyODMgMTAuNTA1MyAxMS44NDUxIDEwLjQ4ODIgMTEuOTU5NUMxMC40NzExIDEyLjA3NCAxMC40MTM5IDEyLjE3ODYgMTAuMzI2OCAxMi4yNTQ3QzEwLjIzOTYgMTIuMzMwOCAxMC4xMjgzIDEyLjM3MzUgMTAuMDEyNiAxMi4zNzVDOS42MjgxNCAxMi4zNzUgOS4yNDYwMiAxMi4zMTU3IDguODc5NjkgMTIuMTk5MUwxLjQwMTQ0IDkuODE5MzdDMS4yMjEzMyA5LjQxNTE0IDEuMTI3MjIgOC45Nzc4OSAxLjEyNTA2IDguNTM1MzdDMS4xMjM4MiA4LjIwNjg4IDEuMjI4NTcgNy44ODY3NiAxLjQyMzc0IDcuNjIyNTVDMS42MTg5MSA3LjM1ODMzIDEuODk0MSA3LjE2NDExIDIuMjA4NDQgNy4wNjg3NEw5LjI1ODQ0IDQuODk5NzRDMTEuMDkzNyA0LjMzNTExIDEzLjA2MTEgNC4zNjkzOSAxNC44NzU2IDQuOTk3NjJMMjEuNjU3MSA3LjM0NDc0QzIyLjAwMjYgNy40NjQ0OSAyMi4zMDM5IDcuNjg1OTYgMjIuNTIxMyA3Ljk4MDA2QzIyLjczODcgOC4yNzQxNiAyMi44NjIgOC42MjcxNCAyMi44NzUxIDguOTkyNjJDMjIuODg4MiA5LjM1ODExIDIyLjc5MDUgOS43MTkwMSAyMi41OTQ3IDEwLjAyNzlDMjIuMzk4OSAxMC4zMzY4IDIyLjExNDMgMTAuNTc5MyAyMS43NzgyIDEwLjcyMzVMMjEuNzc2NyAxMC43MjVaIiBmaWxsPSIjNDM0QjVDIi8+CjwvZz4KPC9zdmc+Cg=='/> Towel</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Bath or Shower</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Private bathroom</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Free toiletries</div>
            </div> 
			
			<div class="column-content" style="margin-top: 24px">
				<h4>Bedroom</h4>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Bedspread</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Closet or closet</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Alarm clock</div>
				
			</div>
        </div>
        <div class="col-md-4">
            <div class="column-content">
                <h4>Outside</h4>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Outdoor tables and chairs</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Sun terrace</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Terrace/patio</div>
            </div>
			
			<div class="column-content" style="margin-top: 24px">
                <h4>Kitchen</h4>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Electric kettle</div>
                <div class="item"><i class="fa-light fa-refrigerator fa-xl" style="color: #434b5c;"></i>  Fridge</div>
            </div>
			
			<div class="column-content" style="margin-top: 24px">
                <h4>Work</h4>
                 <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Bicycle rental</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Cycling tour</div>
            </div>
			
        </div>
        <div class="col-md-4">
            <div class="column-content">
                <h4>Reception service</h4>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Lockers</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Private check-in/check-out</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i>Concierge service</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i>Keep your luggage</div>
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i>Tour desk</div>
				
				<div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i>Currency exchange</div>
            </div>
			
			<div class="column-content" style="margin-top: 24px">
                <h4>Cleaning service</h4>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Clean the room every day</div>
                <div class="item"><i class="fa-thin fa-circle-check fa-xl" style="color: #434b5c;"></i> Trouser ironing board</div>
			</div>
			
			
        </div>
    </div>
</div>


                        </div>
                    {/if}

                </div>
            </div>
        </div>
    </div>

    <div id="Add-ons" class="scroll_addons">
        <div class="prix">
			<div class="container">
            <div class="prix-title">
                <h2 class="title-prix">{$core->get_Lang('Add-ons')}</h2>
                <p>{$core->get_Lang('We suggest you some')}</p>
                {* {if $lstHotelRelated}
                     <section class="sec_relate_box">
                    {section name=i loop=$lstHotelRelated}
                        {assign var=hotel_id value = $lstHotelRelated[i].hotel_id}

                        {assign var=arrHotel value = $lstHotelRelated[i]}
                       {$clsISO->getBlock('hotelRelateBox',["hotel_id"=>$hotel_id,"arrHotel"=>$arrHotel])}

                    {/section}
                   </section>

                {/if} *}
            </div>
        </div>
    </div>
		</div>
    <div id="Inclusion" class="scroll_inclusion">
        <div class="prix">
			<div class="container">
            {if !isset($oneItem.other_policy) || !$oneItem.other_policy}
            {else}
                <div class="demander-title">
                    <h2 class="txt_inclus">{$core->get_Lang('Inclusion')}</h2>
                    <div class="Inclusion-txt">
                        {$oneItem.other_policy|html_entity_decode}

                    </div>
                </div>
            {/if}
        </div>
    </div>
		</div>
    <div id="Things" class="scroll_thing">
        <div class="Things">
			<div class="container">
            <h2 class="Things-prix">{$core->get_Lang('Things to know')}</h2>

            <div class="nav-content">
                <div class="nav-content-title tabs2">
                    {assign var=_CheckInRoom value=$clsHotel->getCheckInRoom($hotel_id,$oneItem)}
					
                    {assign var=_CheckOutRoom value=$clsHotel->getCheckOutRoom($hotel_id,$oneItem)}
					
                    {assign var=_BookingPolicy value=$clsHotel->getBookingPolicy($hotel_id,$oneItem)}
					
                    {assign var=_ChildPolicy value=$clsHotel->getChildPolicy($hotel_id,$oneItem)}
					
                    {assign var=_CancellationPolicy value=$clsHotel->getCancellationPolicy($hotel_id,$oneItem)}
					
					{assign var=_ExcludesPolicy value=$clsHotel->getExcludesPolicy($hotel_id,$oneItem)}
					
                    {assign var=_OtherPolicy value=$clsHotel->getOtherPolicy($hotel_id,$oneItem)}
					{if $_CheckInRoom || $_BookingPolicy || $_ChildPolicy || $_CancellationPolicy || $_OtherPolicy ||$listCustomField}
                   
                        <section class="sec_info_hotel">
                            <div class="important_note_box">
                                {if $_CheckInRoom}
                                    <div class="important_note_item">
                                        <h3 class="note_title check_in">
											<i class="fa-solid fa-arrow-right-to-bracket fa-xl" style="color: #004ea8; margin-right:8px"></i>
                                            {$core->get_Lang('Check-in')}</h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_CheckInRoom}
                                            </p>
                                        </div>
                                    </div>
                                {/if}
								
								   {if $_CheckOutRoom}
                                    <div class="important_note_item">
                                        <h3 class="note_title check_out">
											<i class="fa-solid fa-arrow-left-from-bracket fa-xl" style="color: #004ea8; margin-right:8px"></i>
                                            {$core->get_Lang('Check-out')}</h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_CheckOutRoom}
                                            </p>
                                        </div>
                                    </div>
                                {/if}
								
								

                                {if $_ExcludesPolicy ne ''}
                                    <div class="important_note_item">
                                        <h3 class="note_title booking_policy">
											<i class="fa-solid fa-circle-info fa-xl" style="color: #004ea8; margin-right:8px"></i>
                                            {$core->get_Lang('Excludes')}</h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_ExcludesPolicy}</p>
                                        </div>
                                    </div>
                                {/if}
								
								{if $_CancellationPolicy ne ''}
                                    <div class="important_note_item">
                                        <h3 class="note_title cancel_prepay">
											<i class="fa-solid fa-circle-info fa-xl" style="color: #004ea8; margin-right:8px"></i>
                                            {$core->get_Lang('Cancel reservation/ Prepay')}</h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_CancellationPolicy}</p>
                                        </div>
                                    </div>
                                {/if}

                                {if $_ChildPolicy ne ''}
                                    <div class="important_note_item">
                                        <h3 class="note_title bed">
											<img src='data:image/svg+xml;base64, PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIj4KPG1hc2sgaWQ9Im1hc2swXzFfMjc4NTIiIHN0eWxlPSJtYXNrLXR5cGU6bHVtaW5hbmNlIiBtYXNrVW5pdHM9InVzZXJTcGFjZU9uVXNlIiB4PSIwIiB5PSIwIiB3aWR0aD0iMjQiIGhlaWdodD0iMjQiPgo8cGF0aCBkPSJNMCAxLjkwNzM1ZS0wNkgyNFYyNEgwVjEuOTA3MzVlLTA2WiIgZmlsbD0id2hpdGUiLz4KPC9tYXNrPgo8ZyBtYXNrPSJ1cmwoI21hc2swXzFfMjc4NTIpIj4KPHBhdGggZD0iTTE0LjY4MDYgMy4xNjE2MUgyMC4zNzY5QzIxLjU3MTUgMy4xNjE2MSAyMi41Mzk4IDQuMTI5OTcgMjIuNTM5OCA1LjMyNDU3VjE2LjUyNzRDMjIuNTM5OCAxNy43MjIgMjEuNTcxNSAxOC42OTA0IDIwLjM3NjkgMTguNjkwNEg0LjE2Mjk3QzIuOTY4NDEgMTguNjkwNCAyIDE3LjcyMiAyIDE2LjUyNzRWNS4zMjQ1N0MyIDQuMTI5OTcgMi45Njg0MSAzLjE2MTYxIDQuMTYyOTcgMy4xNjE2MUgxMC4xMzAzIiBzdHJva2U9IiMwMDRFQTgiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+CjxwYXRoIGQ9Ik0xMi4wMDkzIDIuODI3MjFDOC42ODQ1OSAyLjk2NzM2IDYuMzY3ODQgNS43OTkyNyA1LjY2MTU0IDguOTU1MjZDNS40Nzk1NSA4Ljg5NzgxIDUuNzYzNTcgOC44NjY4IDUuNTYyNTIgOC44NjY4QzQuNTA3NTggOC44NjY4IDMuNjUyMzQgOS43MjAwNCAzLjY1MjM0IDEwLjc3MjVDMy42NTIzNCAxMS44MjUxIDQuNTA3NTggMTIuNjc4MyA1LjU2MjUyIDEyLjY3ODNDNS44MDQzMyAxMi42NzgzIDUuNTU3ODkgMTIuNjMzNCA1Ljc3MDc4IDEyLjU1MTZDNi41MjExMyAxNS4xNDYzIDguMjA4ODMgMTYuNjY1NiAxMC45MDE3IDE3LjE3NzNWMTguNjg5NkgxMy42MzQzVjE3LjE3NzNDMTYuMzI3MiAxNi42NjU2IDE4LjAxNDggMTUuMTQ2MyAxOC43NjUyIDEyLjU1MTZDMTguOTc4MSAxMi42MzM0IDE4LjczMTYgMTIuNjc4MyAxOC45NzM0IDEyLjY3ODNDMjAuMDI4NCAxMi42NzgzIDIwLjg4MzYgMTEuODI1MSAyMC44ODM2IDEwLjc3MjVDMjAuODgzNiA5LjcyMDA0IDIwLjAyODQgOC44NjY4IDE4Ljk3MzQgOC44NjY4QzE4Ljc3MjQgOC44NjY4IDE5LjA1NjQgOC44OTc4MSAxOC44NzQ0IDguOTU1MjZDMTguMzQxOSA2LjU3NTQ3IDE2Ljg5MzUgNC4zNzk5MyAxNC43ODc4IDMuMzgzODQiIHN0cm9rZT0iIzAwNEVBOCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPHBhdGggZD0iTTEzLjkxMDIgMTAuMDQzVjkuMzczNzFDMTMuOTEwMiA4Ljg0NDc2IDE0LjM0IDguNDE1OTYgMTQuODcwMiA4LjQxNTk2QzE1LjQwMDQgOC40MTU5NiAxNS44MzAyIDguODQ0NzYgMTUuODMwMiA5LjM3MzcxVjEwLjA0M0gxNi4wNDk0IiBzdHJva2U9IiMwMDRFQTgiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+CjxwYXRoIGQ9Ik0xMC42Mjk1IDEwLjA0M1Y5LjM3MzcxQzEwLjYyOTUgOC44NDQ3NiAxMC4xOTk3IDguNDE1OTYgOS42Njk1IDguNDE1OTZDOS4xMzkzMSA4LjQxNTk2IDguNzA5NDggOC44NDQ3NiA4LjcwOTQ4IDkuMzczNzFWMTAuMDQzSDguNDkwMjMiIHN0cm9rZT0iIzAwNEVBOCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPHBhdGggZD0iTTEyLjEwODEgMS40Njg2QzExLjk5MzcgMS40Njg2IDExLjg4MSAxLjQ3NTc2IDExLjc3MDUgMS40ODk2NkMxMS45ODU2IDEuODc0OSAxMi4xMDgxIDIuMzE4NjIgMTIuMTA4MSAyLjc5MTAzQzEyLjEwODEgNC4xNTQ5OCAxMS4wODY0IDUuMjgwNjYgOS43NjU2MiA1LjQ0NjQ1QzEwLjIyMzUgNi4yNjY2OCAxMS4xMDA5IDYuODIxNTMgMTIuMTA4MSA2LjgyMTUzQzEzLjU4ODIgNi44MjE1MyAxNC43ODgxIDUuNjIzMjEgMTQuNzg4MSA0LjE0NTA3QzE0Ljc4ODEgMi42NjY5MyAxMy41ODgyIDEuNDY4NiAxMi4xMDgxIDEuNDY4NloiIHN0cm9rZT0iIzAwNEVBOCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPHBhdGggZD0iTTEzLjUyOTggMTMuMjI0NEMxMy41Mjk4IDE0LjA4NjcgMTIuOTcwNSAxNC43ODU2IDEyLjI4MDUgMTQuNzg1NkMxMS41OTA2IDE0Ljc4NTYgMTEuMDMxMiAxNC4wODY3IDExLjAzMTIgMTMuMjI0NEMxMS4wMzEyIDEyLjM2MjEgMTEuNTkwNiAxMS42NjMyIDEyLjI4MDUgMTEuNjYzMkMxMi45NzA1IDExLjY2MzIgMTMuNTI5OCAxMi4zNjIxIDEzLjUyOTggMTMuMjI0NFoiIHN0cm9rZT0iIzAwNEVBOCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPHBhdGggZD0iTTkuODM1OTQgMjJIMlYyMC4yNDI2QzIgMTkuMzg1MiAyLjY5NTExIDE4LjY5MDEgMy41NTI1NSAxOC42OTAxSDIwLjk4NzNDMjEuODQ0OCAxOC42OTAxIDIyLjUzOTggMTkuMzg1MiAyMi41Mzk4IDIwLjI0MjZWMjJIMTQuNzA0IiBzdHJva2U9IiMwMDRFQTgiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+CjwvZz4KPC9zdmc+'style="margin-right: 8px"/>
                                            {$core->get_Lang('Children and beds')}
                                        </h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_ChildPolicy}</p>
                                        </div>
                                    </div>
                                {/if}

                                
<!--
                                {if $_OtherPolicy ne ''}
                                    <div class="important_note_item">
                                        <h3 class="note_title other_regulation">
                                            {$core->get_Lang('Other regulations')}</h3>
                                        <div class="box_right">
                                            <p class="box_right_content">{$_OtherPolicy}</p>
                                        </div>
                                    </div>
                                {/if}
-->

                                {if $listCustomField}
                                    {section name=i loop=$listCustomField}
                                        {if $listCustomField[i].fieldvalue ne ''}
                                            <div class="important_note_item">
                                                <h3 class="note_title">{$listCustomField[i].fieldname}</h3>
                                                <div class="box_right">
                                                    <p class="box_right_content">
                                                        {$listCustomField[i].fieldvalue|html_entity_decode}</p>
                                                </div>
                                            </div>
                                        {/if}
                                    {/section}
                                {/if}
                            </div>
                        </section>
                    {/if}
                </div>
                <div class="nav-content-data">

                </div>
            </div>
        </div>
    </div>
		</div>
    <div id="Reviews" class="scroll_reviews">
        <div class="Reviews">
			<div class="container">
            <div class="Reviews-title">
                <h2 class="txt_reviews_ct">{$core->get_Lang('Reviews')}</h2>
                <div class="Reviews-content_txt">
                    <div class="reviews_box_top">
                        <div class="row review-evaluation">
                            <div class="col-lg-3 measure-evaluation">
                                <div class="box_score">

                                    <div class="semi-donut margin" style="--percentage : {$ratingValue}; --fill: #FFBA55 ;">
                                    </div>
                                    <div class="score_text">
                                        <h3>{$ratingValue}</h3>
                                        <p class="txt_score">{$textRateAvg}</p>
                                        <p class="number_review">
                                            {$ratingCount} {$core->get_Lang('Reviews')}
                                        </p>
                                    </div>


                                </div>
                            </div>
                            <div class="col-lg-7 measure-evaluation-txt">
                                <div class="box_rate_score">
                                    {if $lstReviewHotel.staff}
                                        {math equation='x/10' x=$lstReviewHotel.staff assign=staff}
                                    {else}
                                        {assign var=staff value=0}
                                    {/if}
                                    <label for="" class="lbl_rate_score">{$core->get_Lang('Wonderful')}</label>
                                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="{$staff}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {$lstReviewHotel.staff}%"></div>
                                        </div>
                                        <span>{$staff}</span>
                                    </div>
                                </div>
                                <div class="box_rate_score">
                                    {if $lstReviewHotel.place}
                                        {math equation='x/10' x=$lstReviewHotel.place assign=place}
                                    {else}
                                        {assign var=place value=0}
                                    {/if}
                                    <label for="" class="lbl_rate_score">{$core->get_Lang('Excellent')}</label>
                                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="{$place}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {$lstReviewHotel.place}%"></div>
                                        </div>
                                        <span>{$place}</span>
                                    </div>
                                </div>
                                <div class="box_rate_score">
                                    {if $lstReviewHotel.amenities}
                                        {math equation='x/10' x=$lstReviewHotel.amenities assign=amenities}
                                    {else}
                                        {assign var=amenities value=0}
                                    {/if}
                                    <label for="" class="lbl_rate_score">{$core->get_Lang('Good')}</label>
                                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="{$amenities}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {$lstReviewHotel.amenities}%">
                                            </div>
                                        </div>
                                        <span>{$amenities}</span>
                                    </div>
                                </div>
                                <div class="box_rate_score">
                                    {if $lstReviewHotel.food_drink}
                                        {math equation='x/10' x=$lstReviewHotel.food_drink assign=food_drink}
                                    {else}
                                        {assign var=food_drink value=0}
                                    {/if}
                                    <label for="" class="lbl_rate_score">{$core->get_Lang('Average')}</label>
                                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="{$food_drink}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {$lstReviewHotel.food_drink}%">
                                            </div>
                                        </div>
                                        <span>{$food_drink}</span>
                                    </div>
                                </div>
								
								<div class="box_rate_score">
                                    {if $lstReviewHotel.food_drink}
                                        {math equation='x/10' x=$lstReviewHotel.food_drink assign=food_drink}
                                    {else}
                                        {assign var=food_drink value=0}
                                    {/if}
                                    <label for="" class="lbl_rate_score">{$core->get_Lang('Bad')}</label>
                                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="{$food_drink}"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: {$lstReviewHotel.food_drink}%">
                                            </div>
                                        </div>
                                        <span>{$food_drink}</span>
                                    </div>
                                </div>

                                <a class="view_all_review btn_write_review btn_write_review_login Write-reviews"
                                    href="javascript:void(0);"
                                    title="{$core->get_Lang('Reviews')}">{$core->get_Lang('Write reviews')}</a>
                            </div>
                        </div>
                    </div>
                    <div class="box_write_review">
                        <div class="clearfix mb20"></div>
									{$core->getBlock('review_stay_No_Login')}
                    </div>
                    {section name=i loop=$lstReview}
                        {assign var=reviews_content value=$clsReviews->getContent($lstReview[i].reviews_id,400,true,$lstReview[i])}
                        <div class="customer_reviews_item review_item">
                            <div class="customer_intro">
                                <div class="customer_avatar avatar">{$lstReview[i].fullname|truncate:1:"":true}
                                </div>
                                <div class="customer_info">
                                    <div class="customer_name">{$lstReview[i].fullname}</div>
                                    <div class="address">{$clsCountry->getTitle($lstReview[i].country_id)}</div>
                                </div>
                            </div>
                            <div class="customer_reviews_text content_review content_review_short">
                                {$clsISO->truncateWord($lstReview[i].content,30,$btn_view_more)|html_entity_decode}
                            </div>
                            <div class="content_review content_review_full" style="display:none">
                                {$lstReview[i].content|html_entity_decode}
                            </div>

                        </div>
                    {/section}
                </div>
            </div>

        </div>
    </div>
		</div>

    {$core->getBlock('box_service_ad')}

    {if $lstHotelRelated}
        <section class="sec_relate_box">
            <div class="headBox">
				<div class="container">
                <h2 class="sec_relate_title text-left">{$core->get_Lang('Maybe you are interested')}</h2>
            </div>
            <div class="container">
                <div class="sec_relate_box-slide owl-carousel_overview owl-carousel">
                    {section name=i loop=$lstHotelRelated}
                        {assign var=hotel_id value = $lstHotelRelated[i].hotel_id}
                        {assign var=arrHotel value = $lstHotelRelated[i]}
                        {$clsISO->getBlock('hotelRelateBox',["hotel_id"=>$hotel_id,"arrHotel"=>$arrHotel])}
                    {/section}
                </div>
            </div>
        </section>
    {/if}
    </div>
		</div>

<section class="recently_hotel">
	<div class="txt_recentlyhotel">
		<div class="container">
                        <h2 class="recentlyViewed">{$core->get_Lang('Recently viewed')}</h2>
                        <div class="recentlyViewed-dev">
                            <div class="clicked-details"></div>
                        </div>


                        <div class="recentlyViewed-mobile">
                            <div class="sec_relate_box-slide owl-carousel_overviewReviews owl-carousel ">
                                <div class="clicked-details">

                                </div>
                            </div>
                        </div>

                        <button class="btnShowViewed">{$core->get_Lang('More')}</button>

                        <button class="btnNoneViewed">{$core->get_Lang('Collapse all')}</button>


                    </div>
		</div>

</section>


    {$core->getBlock('customer_review')}
    {$core->getBlock('also_like')}
    <!-- Modal -->
    <div class="modal fade" id="mdReview" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="box_content"></div>
                </div>
            </div>
        </div>
    </div>
</section>



    <script>

var otherPolicy = '{$oneItem.other_policy|unescape}';

    if (otherPolicy.length > 0) {
        $('.Inclusion-txt li').prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    }
		
	if (otherPolicy.length > 0) {
        $('.Inclusion-txt p').prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    }
		
		
    if (otherPolicy.length > 0) {
    $('.Inclusion-txt .description').each(function() {
        if (!$(this).hasClass('description--house-rule')) {
            $(this).prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
        }
    });
}
    if (otherPolicy.length > 0) {
        $('.Inclusion-txt span').prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    }

    </script>


    {literal}
        <script>
            $(".read_more_review").click(function() {
                var item_review_clone = $(this).closest('.review_item').clone();
                $("#mdReview").find('.box_content').html(item_review_clone);
                $("#mdReview").find(".content_review_short,.read_more_review").hide();
                $("#mdReview").find(".content_review_full").show();
                var bg_color = $(this).closest('.review_item').find('.avatar').css('background-color');
                $("#mdReview").find(".avatar").css('background-color', bg_color);
            });
            Fancybox.bind("[data-fancybox]", {

            });
            $('.list_customer_review_items').owlCarousel({
                loop: false,
                margin: 30,
                nav: true,
                dots: false,
                responsive: {
                    0: {
                        margin: 20,
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    992: {
                        items: 3
                    },
                    1025: {
                        items: 3
                    }
                }
            });

            $('.related_slides').owlCarousel({
                loop: false,
                margin: 30,
                nav: false,
                dots: false,
                responsive: {
                    0: {
                        margin: 20,
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    992: {
                        items: 4
                    },
                    1025: {
                        items: 4
                    }
                }
            });

    $(window).scroll(function() {
        if ($(this).scrollTop() >= 500) {
            $('.scroll-nav').addClass('scroll-nav_sticky');
//			$("#header_fixed").removeClass('nah_header_sticky');
			$('#header_fixed').hide();

			
			
        } else {
            $('.scroll-nav').removeClass('scroll-nav_sticky');
			$('#header_fixed').show();

			

        }
    });
			

			
			var link = document.querySelector('link[href="vietisocms.css"]');


  			if (link) {
				link.parentNode.removeChild(link);
			  }



			$(document).ready(function() {
  $('.scroll-title a').on('click', function(event) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định

    var targetId = $(this).attr('href').substring(1); // Lấy ID mục tiêu (loại bỏ dấu #)
    var $targetElement = $('#' + targetId);

    if ($targetElement.length) {
      var targetOffset = $targetElement.offset().top;
      var headerHeight = $('.header').outerHeight() || 0; // Điều chỉnh nếu có header
      targetOffset -= headerHeight;

      $('html, body').animate({
        scrollTop: targetOffset
      }, 800); // Thời gian cuộn (milliseconds)
    }

    // Loại bỏ #overview khỏi URL (nếu có)
    if (window.location.hash) {
        history.replaceState("", document.title, window.location.pathname + window.location.search);
    }
  });

  // Xử lý trường hợp người dùng nhấp vào liên kết từ một trang khác
  if (window.location.hash) {
    var initialTargetId = window.location.hash.substring(1);
    var $initialTargetElement = $('#' + initialTargetId);

    if ($initialTargetElement.length) {
      var initialTargetOffset = $initialTargetElement.offset().top;
      var headerHeight = $('.header').outerHeight() || 0; 
      initialTargetOffset -= headerHeight;

      $('html, body').animate({
        scrollTop: initialTargetOffset
      }, 0); // Cuộn ngay lập tức (không có animation)

      history.replaceState("", document.title, window.location.pathname + window.location.search);
    }
  }
});

const links = document.querySelectorAll('.nav-link');
            links.forEach(link => {
                link.addEventListener('click', (event) => {
                    $('.nav-link').removeClass('active');
                    $(event.currentTarget).addClass('active');
                    const targetClass = event.currentTarget.getAttribute('data-target');
                    const targetElement = document.querySelector(targetClass);
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            })
        </script>
    {/literal}

