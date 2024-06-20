<section class="page_container trvg_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    {$core->getBlock('des_tailor_made_travel')}
    <div class="des_tailor_detail_travel_guide">
        <div class="container">
            <div class="row unika_des_travel_guide">
                <div class="col-12 col-sm-12 col-md-12 col-lg-9">
                    {if $deviceType != 'computer'}
                    {*van code new*}
                    {$core->getBlock('des_travel_guide_side_mobile')}
                    <!-- <div class="unika_sort_filter">
						<div class="unika_btn_sort_filter">Sort & filter</div>
					</div>
					<div class="unika_mobile_travel_guide">
						<div class="unika_mobile_travel_guide_content">
							<div class="unika_mobile_travel_top">
								<div>Sort & filter</div>
								<div class="unika_mobile_travel_close">
									<i class="fa-sharp fa-light fa-xmark" aria-hidden="true"></i>
								</div>
							</div>
							<form action="" method="GET" class="form_search_guide">
								<div class="des_travel_guide_search">
									<button class="btn_search_guide"><i class="fa-light fa-magnifying-glass"></i></button>
									<input type="text" name="keyword" class="keyword_search_guide" placeholder="Search">
									<input type="hidden" value="search_guide">
								</div>
							</form>
							<div class="des_travel_guide_category">
								<div class="des_travel_guide_category_title"> <h2>Vietnam</h2> </div>
								<div class="des_travel_guide_category_list"> 
									<a href="https://unikasia.vietiso.com/en/guides/vietnam/places-to-go-c29" title="Places To Go" class="active">Places To Go</a> 
									<a href="https://unikasia.vietiso.com/en/guides/vietnam/cuisine-c23" title="Cuisine">Cuisine</a> 
									<a href="https://unikasia.vietiso.com/en/guides/vietnam/top-attractions-c2" title="Top Attractions">Top Attractions</a> 
									<a href="https://unikasia.vietiso.com/en/guides/vietnam/travel-file-c28" title="Travel File">Travel File</a> 
								</div>
							</div>
						</div>
					</div> -->
                    {*van code new*}
                    {/if}
                    <div class="des_travel_guide_list">
                        {if $trvg_intro}
                        <div class="des_tailor_detail_travel_guide_description">
                            {$trvg_intro}
                        </div>
                        {/if}
                        <div class="row">
                            {if $listGuide}
                            {foreach from=$listGuide key=key item=item}
                            {assign var="guide_id" value=$item.guide_id}
                            <div class="col-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="des_travel_guide_item">
                                    <div class="des_travel_guide_image">
                                        <img src="{$clsGuide->getImage($guide_id, 292, 219)}"
                                            alt="{$clsGuide->getTitle($guide_id)}" width="292" height="219">
                                        <a href="{$clsGuide->getLink2($guide_id)}" class="des_travel_guide_link"
                                            title="{$clsGuide->getTitle($guide_id)}">
                                            SEE DETAILS <i class="fa-sharp fa-regular fa-arrow-right"
                                                aria-hidden="true"></i>
                                        </a>
                                    </div>
                                    <div class="des_travel_guide_intro">
                                        <div class="des_travel_guide_title">
                                            <h3><a href="{$clsGuide->getLink2($guide_id)}"
                                                    title="{$clsGuide->getTitle($guide_id)}">{$clsGuide->getTitle($guide_id)}</a>
                                            </h3>
                                        </div>
                                        <div class="des_travel_guide_place">
                                            <i class="fa-sharp fa-light fa-location-dot"></i>
                                            {$clsGuide->getPlaceGuide($guide_id)}
                                        </div>
                                        <div class="des_travel_guide_description">
                                            {$clsGuide->getIntro($guide_id)}
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
                            <div class="owl-carousel owl-theme trvg_list_guidecat_carousel">
                                {foreach from=$arr_recent_view key=key item=item}
                                {assign var="guideID" value=$item}
                                <div class="item des_travel_guide_item" data-merge="1">
                                    <div class="des_travel_guide_image">
                                        <img src="{$clsGuide->getImage($guideID, 292, 219)}"
                                            alt="{$clsGuide->getTitle($guideID)}" width="292" height="219">
                                        <a href="{$clsGuide->getLink2($guideID)}" class="des_travel_guide_link"
                                            title="{$clsGuide->getTitle($guideID)}">
                                            SEE DETAILS <i class="fa-sharp fa-regular fa-arrow-right"
                                                aria-hidden="true"></i>
                                        </a>
                                    </div>
                                    <div class="des_travel_guide_intro">
                                        <div class="des_travel_guide_title">
                                            <h3><a href="{$clsGuide->getLink2($guideID)}"
                                                    title="{$clsGuide->getTitle($guideID)}">{$clsGuide->getTitle($guideID)}</a>
                                            </h3>
                                        </div>
                                        <div class="des_travel_guide_place">
                                            <i class="fa-sharp fa-light fa-location-dot"></i>
                                            {$clsGuide->getPlaceGuide($guideID)}
                                        </div>
                                        <div class="des_travel_guide_description">
                                            {$clsGuide->getIntro($guideID)}
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
            </div>
        </div>
    </div>
    {$core->getBlock('why_choose_us')}
    {$core->getBlock('customer_review')}
    {$core->getBlock('also_like')}
</section>

{literal}
<script>
if ($('.trvg_list_guidecat_carousel').length > 0) {
    var $owl = $('.trvg_list_guidecat_carousel');
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

//van code new
// $(document)
//     .on('click', '.unika_sort_filter', function() {
//         $('.unika_mobile_travel_guide').slideToggle();
//         $('.unika_header_2').css({
//             "z-index": 0
//         });
//     })
//     .on('click', '.unika_mobile_travel_close', function() {
//         $('.unika_mobile_travel_guide').hide();
//         $('.unika_header_2').css({
//             "z-index": 3
//         });
//     })
//van code new
</script>
{/literal}