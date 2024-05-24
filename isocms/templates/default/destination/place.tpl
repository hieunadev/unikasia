<section class="page_container des_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    {$core->getBlock('des_tailor_made_travel')}
    {$core->getBlock('explore_our_trips')}
    {$core->getBlock('des_list_travel_style')}
    <div class="des_list_hotel">
        <div class="container">
            <div class="des_list_hotel_title">
                <h2>{$clsConfiguration->getOutTeam('HotelTitle')}</h2>
                <div class="des_list_hotel_description">
                    {$clsConfiguration->getOutTeam('HotelDescription')}
                </div>
            </div>
            <div class="des_list_hotel_content">
                <div class="container">
                    <div class="owl-carousel owl-theme des_list_hotel_carousel">
                        {if $list_hotel_country}
                        {foreach from=$list_hotel_country key=key item=item}
                        {assign var=hotel_id value=$item.hotel_id}
                        <div class="des_list_hotel_item item">
                            <a href="{$clsHotel->getLink($hotel_id)}" title="{$clsHotel->getTitle($hotel_id)}">
                                <div class="des_list_hotel_item_image">
                                    <img src="{$clsHotel->getImage($hotel_id, 296, 200)}" width="296" height="200" alt="{$clsHotel->getTitle($hotel_id)}">
                                </div>
                            </a>
                            <div class="des_list_hotel_item_intro">
                                <div class="des_list_hotel_item_title">
                                    <h3><a href="{$clsHotel->getLink($hotel_id)}" title="{$clsHotel->getTitle($hotel_id)}">{$clsHotel->getTitle($hotel_id)}</a></h3>
                                    <div class="des_list_hotel_item_star">
                                        {section name=i start=0 loop=$item.star_id step=1}
                                        <i class="fa-sharp fa-solid fa-star"></i>
                                        {/section}
                                    </div>
                                </div>
                                <div class="des_list_hotel_item_type">
                                    <i class="fa-light fa-house"></i> {$clsHotel->getTypeHotel($hotel_id)}
                                </div>
                                <div class="des_list_hotel_item_place">
                                    <i class="fa-light fa-location-dot"></i> {$clsHotel->getAddress($hotel_id)}
                                </div>
                                <div class="des_list_hotel_item_rate">
                                    <span class="des_rate_number">4.5</span>
                                    <span class="des_rate_text">Very good</span>
                                    <span class="des_rate_total">(9 reviews)</span>
                                </div>
                                <div class="des_list_hotel_item_price">
                                    <span class="des_price_title">Avg price per night</span>
                                    <span class="des_price_show_text">US</span>
                                    <span class="des_price_show_number">${$item.price_avg}</span>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="des_our_team">
        <div class="container">
            <div class="des_our_team_title">
                <h2>{$clsConfiguration->getOutTeam('OurTeamTitle')}</h2>
                <div class="des_our_team_description">
                    {$clsConfiguration->getOutTeam('OurTeamDescription')}
                </div>
            </div>
            <div class="des_our_team_content">
                <div class="des_our_team_content_img">
                    <img src="{$clsConfiguration->getImage('OurTeamBanner', 1047, 403)}" width="1047" height="403" alt="Our Team">
                </div>
                <div class="des_our_team_list">
                    <div class="row">
                        {section name=i loop=4 start=1}
                        {assign var=key value=$smarty.section.i.index}
                        <div class="col-sm-12 col-md-4 col-lg-3">
                            <div class="des_our_team_item">
                                <div class="des_our_team_item_img">
                                    <img src="{$clsConfiguration->getImage('OurTeamStepIcon_'|cat:$key, 48, 48)}" width="48" height="48" alt="{$clsConfiguration->getOutTeam('OurTeamStepTitle_'|cat:$key)}">
                                </div>
                                <div class="des_our_team_item_info">
                                    <h3>{$clsConfiguration->getOutTeam('OurTeamStepTitle_'|cat:$key)}</h3>
                                    <div class="des_our_team_item_description">
                                        {$clsConfiguration->getOutTeam('OutTeamStepDescription_'|cat:$key)}
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/section}
                    </div>
                </div>
            </div>
        </div>
    </div>
    {$core->getBlock('customer_review')}
    <div class="des_gallery">
        <div class="container-fluid">
            <div class="des_gallery_title">
                <h2>{$clsConfiguration->getOutTeam('GalleryTitle')}</h2>
            </div>
            <div class="des_gallery_content">
                <div class="owl-carousel owl-theme des_gallery_list">
                    <div class="item des_grow" data-merge="1">
                        <div class="des_gallery_item">
                            <a data-fancybox="gallery" href="{$URL_IMAGES}/destination/gallery.png">
                                <img src="{$URL_IMAGES}/destination/gallery.png" width="479" height="403" alt="Gallery" class="img100" title="Gallery">
                            </a>
                        </div>
                    </div>

                    <div class="item des_grow" data-merge="1">
                        <div class="des_gallery_item">
                            <a data-fancybox="gallery" href="https://images.unsplash.com/photo-1715586042534-4534fad6863d?q=80&w=1975&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                                <img src="https://images.unsplash.com/photo-1715586042534-4534fad6863d?q=80&w=1975&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" width="479" height="403" alt="Gallery" class="img100" title="Gallery">
                            </a>
                        </div>
                    </div>
                    <div class="item des_grow" data-merge="1">
                        <div class="des_gallery_item">
                            <a data-fancybox="gallery" href="https://media.istockphoto.com/id/1481276382/photo/panorama-of-phang-nga-bay-with-mountains-at-sunset-in-thailand.webp?b=1&s=170667a&w=0&k=20&c=nafyVsrlYfAblKjR4SbpbpzKU56zaxAEEQ1PJhjV5Ko=">
                                <img src="https://media.istockphoto.com/id/1481276382/photo/panorama-of-phang-nga-bay-with-mountains-at-sunset-in-thailand.webp?b=1&s=170667a&w=0&k=20&c=nafyVsrlYfAblKjR4SbpbpzKU56zaxAEEQ1PJhjV5Ko=" width="479" height="403" alt="Gallery" class="img100" title="Gallery">
                            </a>
                        </div>
                    </div>
                    <div class="item des_grow" data-merge="1">
                        <div class="des_gallery_item">
                            <a data-fancybox="gallery" href="https://media.istockphoto.com/id/1254474165/photo/tropical-leaves-abstract-green-leaves-texture-nature-background.webp?b=1&s=170667a&w=0&k=20&c=biSlIchE6-xYY0_MLX5yrboockYYaGF04uM79eTKSX8=">
                                <img src="https://media.istockphoto.com/id/1254474165/photo/tropical-leaves-abstract-green-leaves-texture-nature-background.webp?b=1&s=170667a&w=0&k=20&c=biSlIchE6-xYY0_MLX5yrboockYYaGF04uM79eTKSX8=" width="479" height="403" alt="Gallery" class="img100" title="Gallery">
                            </a>
                        </div>
                    </div>
                    <div class="item des_grow" data-merge="1">
                        <div class="des_gallery_item">
                            <a data-fancybox="gallery" href="https://media.istockphoto.com/id/1480110801/photo/small-abstract-wave-splashing-in-golden-light-on-shoreline.webp?b=1&s=170667a&w=0&k=20&c=jRQfsM7HN4rjVBVeHuEFLV1JQpt1vFDuxbcY-m74KJA=">
                                <img src="https://media.istockphoto.com/id/1480110801/photo/small-abstract-wave-splashing-in-golden-light-on-shoreline.webp?b=1&s=170667a&w=0&k=20&c=jRQfsM7HN4rjVBVeHuEFLV1JQpt1vFDuxbcY-m74KJA=" width="479" height="403" alt="Gallery" class="img100" title="Gallery">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {$core->getBlock('top_attraction')}
    <div class="des_list_faq">
        <div class="container">
            <div class="des_list_faq_title">
                <h2>{$clsConfiguration->getOutTeam('FAQTitle')}</h2>
            </div>
            <div class="des_list_faq_content">
                <div class="accordion" id="accordion_destination">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="box_left">
                                {if $list_faq_country}
                                {foreach from=$list_faq_country key=key item=item}
                                {assign var="faq_id" value=$item.faq_id}
                                {if $key eq 0}
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading_{$key}">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_{$key}" aria-expanded="true" aria-controls="collapse_{$key}">
                                            {$clsFAQ->getTitle($faq_id)}
                                        </button>
                                    </h2>
                                    <div id="collapse_{$key}" class="accordion-collapse collapse show" aria-labelledby="heading_{$key}" data-bs-parent="#accordion_destination">
                                        <div class="accordion-body">
                                            {$clsFAQ->getContent($faq_id)}
                                        </div>
                                    </div>
                                </div>
                                {elseif $key gt 0 && $key le 5}
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading_{$key}">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_{$key}" aria-expanded="false" aria-controls="collapse_{$key}">
                                            {$clsFAQ->getTitle($faq_id)}
                                        </button>
                                    </h2>
                                    <div id="collapse_{$key}" class="accordion-collapse collapse" aria-labelledby="heading_{$key}" data-bs-parent="#accordion_destination">
                                        <div class="accordion-body">
                                            {$clsFAQ->getContent($faq_id)}
                                        </div>
                                    </div>
                                </div>
                                {/if}
                                {/foreach}
                                {/if}
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="box_right">
                                {if $list_faq_country}
                                {foreach from=$list_faq_country key=key item=item}
                                {assign var="faq_id" value=$item.faq_id}
                                {if $key gt 5}
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading_{$key}">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_{$key}" aria-expanded="false" aria-controls="collapse_{$key}">
                                            {$clsFAQ->getTitle($faq_id)}
                                        </button>
                                    </h2>
                                    <div id="collapse_{$key}" class="accordion-collapse collapse" aria-labelledby="heading_{$key}" data-bs-parent="#accordion_destination">
                                        <div class="accordion-body">
                                            {$clsFAQ->getContent($faq_id)}
                                        </div>
                                    </div>
                                </div>
                                {/if}
                                {/foreach}
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {$core->getBlock('update_news')}
    {$core->getBlock('also_like')}
</section>

<script>
    var country_id = "{$country_id}";
    var city_id = "{$city_id}";
</script>

<script>
    Fancybox.bind("[data-fancybox]", {});
</script>

{literal}
<script>
    if ($('.des_gallery_list').length > 0) {
        var $owl = $('.des_gallery_list');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 0,
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
                    margin: 15,
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 4
                }
            }
        });
    }

    if ($('.des_list_hotel_carousel').length > 0) {
        var $owl = $('.des_list_hotel_carousel');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 32,
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
                    items: 3
                },
                1000: {
                    items: 4
                }
            }
        });
    }
</script>
{/literal}