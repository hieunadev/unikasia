<div class="des_list_travel_style">
    <div class="container">
        <div class="des_travel_style_title">
            <h2>Ways to travel that may meet your interest </h2>
            <div class="des_travel_style_description">
                Our range of travel types includes classic, luxury, honeymoons, family, beach breaks and solo travel, as well as wellness and lots more.
            </div>
        </div>
        <div class="des_travel_style_content">
            <div class="container">
                <div class="owl-carousel owl-theme des_list_travel_style_carousel">
                    <div class="des_travel_style_item item">
                        <a href="#" title="Beach breaks">
                            <img src="{$URL_IMAGES}/destination/travel_style.png" alt="Beach breaks">
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="#" title="Beach breaks">Beach breaks</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="des_travel_style_item item">
                        <a href="#" title="Beach breaks">
                            <img src="{$URL_IMAGES}/destination/travel_style.png" alt="Beach breaks">
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="#" title="Beach breaks">Beach breaks</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="des_travel_style_item item">
                        <a href="#" title="Beach breaks">
                            <img src="{$URL_IMAGES}/destination/travel_style.png" alt="Beach breaks">
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="#" title="Beach breaks">Beach breaks</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="des_travel_style_item item">
                        <a href="#" title="Beach breaks">
                            <img src="{$URL_IMAGES}/destination/travel_style.png" alt="Beach breaks">
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="#" title="Beach breaks">Beach breaks</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="des_travel_style_item item">
                        <a href="#" title="Beach breaks">
                            <img src="{$URL_IMAGES}/destination/travel_style.png" alt="Beach breaks">
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="#" title="Beach breaks">Beach breaks</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{literal}
<script>
    $(document).ready(function() {
        if ($('.des_list_travel_style_carousel').length > 0) {
            var $owl = $('.des_list_travel_style_carousel');
            $owl.owlCarousel({
                lazyLoad: true,
                loop: true,
                margin: 34,
                nav: true,
                navText: ["<i class='fa-solid fa-angle-left'></i>", "<i class='fa-solid fa-angle-right'></i>"],
                dots: false,
                // autoplay: false,
                // autoplayTimeout:3000,	
                // animateOut: 'fadeOut',
                // animateIn: 'fadeIn',
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1
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

        
    });
</script>
{/literal}