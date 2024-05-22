<section class="page_container des_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    {$core->getBlock('des_tailor_made_travel')}
    {$core->getBlock('explore_our_trips')}
    {$core->getBlock('des_list_travel_style')}
    <div class="des_list_hotel">
        <div class="container">
            <div class="des_list_hotel_title">
                <h2>Our favorite vacation spot</h2>
                <div class="des_list_hotel_description">
                    Our range of travel types includes classic, luxury, honeymoons, family, beach breaks and solo travel, as well as wellness and lots more.
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
                <h2>Our Team</h2>
                <div class="des_our_team_description">
                    My colleagues and I are at your disposal to answer all your dreams of escape to Vietnam, Cambodia, Laos, Myanmar !
                </div>
            </div>
            <div class="des_our_team_content">
                <div class="des_our_team_content_img">
                    <img src="{$URL_IMAGES}/destination/our_team_2.png" alt="Our Team">
                </div>
                <div class="des_our_team_list">
                    <div class="row">
                        <div class="col-sm-12 col-md-4 col-lg-3">
                            <div class="des_our_team_item">
                                <div class="des_our_team_item_img">
                                    <img src="{$URL_IMAGES}/destination/our_team.png" alt="Enthusiasm">
                                </div>
                                <div class="des_our_team_item_info">
                                    <h3>Enthusiasm</h3>
                                    <div class="des_our_team_item_description">
                                        Who knows Asia better than us?  We are his children, we live there!  Let’s create your private trip together
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-4 col-lg-3">
                            <div class="des_our_team_item">
                                <div class="des_our_team_item_img">
                                    <img src="{$URL_IMAGES}/destination/our_team2.png" alt="Enthusiasm">
                                </div>
                                <div class="des_our_team_item_info">
                                    <h3>Dedicated, 24/7 care</h3>
                                    <div class="des_our_team_item_description">
                                        Who knows Asia better than us?  We are his children, we live there!  Let’s create your private trip together
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-4 col-lg-3">
                            <div class="des_our_team_item">
                                <div class="des_our_team_item_img">
                                    <img src="{$URL_IMAGES}/destination/our_team3.png" alt="Enthusiasm">
                                </div>
                                <div class="des_our_team_item_info">
                                    <h3>No fees incurred</h3>
                                    <div class="des_our_team_item_description">
                                        Who knows Asia better than us?  We are his children, we live there!  Let’s create your private trip together
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
    <div class="des_gallery">
        <div class="container-fluid">
            <div class="des_gallery_title">
                <h2>Vietnam is beautiful through the lens</h2>
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
                <h2>Frequently Asked Questions </h2>
            </div>
            <div class="des_list_faq_content">
                <div class="accordion" id="accordionExample">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="box_left">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Accordion Item #1
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Accordion Item #2
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Accordion Item #3
                                        </button>
                                    </h2>
                                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="box_right">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            Accordion Item #4
                                        </button>
                                    </h2>
                                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFive">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                            Accordion Item #5
                                        </button>
                                    </h2>
                                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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