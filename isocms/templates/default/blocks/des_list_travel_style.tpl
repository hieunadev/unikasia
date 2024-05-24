<div class="des_list_travel_style">
    <div class="container">
        <div class="des_travel_style_title">
            <h2>{$clsConfiguration->getOutTeam('TravelStyleTitle')}</h2>
            <div class="des_travel_style_description">
                {$clsConfiguration->getOutTeam('TravelStyleDescription')}
            </div>
        </div>
        <div class="des_travel_style_content">
            <div class="container">
                <div class="owl-carousel owl-theme des_list_travel_style_carousel">
                    {if $list_travel_style}
                    {foreach from=$list_travel_style key=key item=item}
                    {assign var=tourcat_id value=$item.tourcat_id}
                    <div class="des_travel_style_item item">
                        <a href="{$clsTourCategory->getLink($item.tourcat_id)}" title="{$clsTourCategory->getTitle($item.tourcat_id)}">
                            <div class="des_travel_style_item_image">
                                <img src="{$clsTourCategory->getImage($tourcat_id, 294, 462)}" width="294" height="462" alt="{$clsTourCategory->getTitle($item.tourcat_id)}">
                            </div>
                            <div class="des_travel_style_item_intro">
                                <div class="des_travel_style_item_title">
                                    <h3><a href="{$clsTourCategory->getLink($item.tourcat_id)}" title="{$clsTourCategory->getTitle($item.tourcat_id)}">{$clsTourCategory->getTitle($item.tourcat_id)}</a></h3>
                                </div>
                                <div class="des_travel_style_item_description">
                                    {$clsTourCategory->getIntro($tourcat_id)}
                                </div>
                            </div>
                        </a>
                    </div>
                    {/foreach}
                    {/if}
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
                loop: false,
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