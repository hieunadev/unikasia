<section class="page_container trvgd_page_container">
    {$core->getBlock('des_nav_breadcrumb')}
    <div class="trvgd_main">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-9">
                    <div class="trvgd_content">
                        {$clsGuide->getContent($guide_id)}
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-3">
                    {$core->getBlock('des_travel_guide_side')}
                </div>
            </div>
        </div>
    </div>
    <div class="trvgd_similar">
        {if $lstRelated}
        <div class="container">
            <div class="trvgd_similar_title">
                <h2>{$core->get_Lang('Similar travel guide')}</h2>
            </div>
            <div class="trvgd_similar_content">
                <div class="owl-carousel owl-theme trvgd_similar_travel_guide">
                    {foreach from=$lstRelated key=key item=item}
                    {assign var=link value=$clsGuide->getLink2($item.guide_id)}
                    {assign var=title value=$clsGuide->getTitle($item.guide_id)}
                    {assign var=intro value=$clsGuide->getIntro($item.guide_id)}
                    {assign var=image value=$clsGuide->getImage($item.guide_id, 292, 216)}
                    {assign var=place value=$clsGuide->getPlaceGuide($item.guide_id)}
                    <div class="item" data-merge="1">
                        <div class="trvgd_similar_item">
                            <div class="trvgd_similar_item_image">
                                <a href="{$link}" title="{$title}">
                                    <img src="{$image}" alt="{$title}" width="292" height="216" loading="lazy" />
                                </a>
                            </div>
                            <div class="trvgd_similar_item_intro">
                                <div class="trvgd_similar_item_title">
                                    <h3><a href="{$link}" title="{$title}">{$title}</a></h3>
                                </div>
                                <div class="trvgd_similar_item_place">
                                    <i class="fa-sharp fa-light fa-location-dot"></i> {$place}
                                </div>
                                <div class="trvgd_similar_item_description">
                                    {$intro}
                                </div>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
        {/if}
    </div>
    <div class="trvgd_recent_view">
        <div class="container">
            <div class="trvgd_recent_view_title">
                <h2>{$core->get_Lang('Recently viewed')}</h2>
            </div>
            <div class="trvgd_recent_view_content">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <div class="trvgd_similar_item">
                            <div class="trvgd_similar_item_image">
                                <a href="#" title="Cao Dai Temple">
                                    <img src="https://media.istockphoto.com/id/1254474165/photo/tropical-leaves-abstract-green-leaves-texture-nature-background.webp?b=1&s=170667a&w=0&k=20&c=biSlIchE6-xYY0_MLX5yrboockYYaGF04uM79eTKSX8=" alt="Cao Dai Temple" width="292" height="216" loading="lazy" />
                                </a>
                            </div>
                            <div class="trvgd_similar_item_intro">
                                <div class="trvgd_similar_item_title">
                                    <h3><a href="#" title="Cao Dai Temple">Cao Dai Temple</a></h3>
                                </div>
                                <div class="trvgd_similar_item_place">
                                    <i class="fa-sharp fa-light fa-location-dot"></i> Da Nang, Vietnam
                                </div>
                                <div class="trvgd_similar_item_description">
                                    Explore several breathtaking landscapes - Discover local daily lifestyles - Get closer to the...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{literal}
<script>
    if ($('.trvgd_similar_travel_guide').length > 0) {
        var $owl = $('.trvgd_similar_travel_guide');
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
                    items: 4
                }
            }
        });
    }
</script>
{/literal}