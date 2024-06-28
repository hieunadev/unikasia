<div class="des_tailor_made_travel">
    <div class="container">
        <div class="des_tailor_menu">
            <div class="des_tailor_top">
                <!-- <a href="#" class="des_tailor_btn" title="TAILOR-MADE TRAVEL">
                    <div class="des_tailor_img">
                        <img src="{$URL_IMAGES}/destination/hn_voyages.png" alt="">
                    </div>
                    TAILOR-MADE TRAVEL
                </a> -->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav des_tailor_menu">
                                <li class="nav-item">
                                    <a class="nav-link" data-link="des_tailor_detail_destination_place" href="{$clsCountry->getLink($country_id)}" title="{$core->get_Lang('OVERVIEW')}">
                                        {$core->get_Lang('OVERVIEW')}
                                    </a>
                                </li>
                                <li class="nav-item dropdown des_tailor_dropdown">
                                    <a class="nav-link dropdown-toggle" data-link="des_tailor_detail_tour_cat" href="javascript:void(0);" id="navbarDropdownMenuLink1" role="button" data-bs-toggle="dropdown" aria-expanded="false" title="{$clsCountry->getTitle($country_id)} {$core->get_Lang('TOURS')}">
                                        {$clsCountry->getTitle($country_id)} {$core->get_Lang('TOURS')} <i class="fa-light fa-angle-down"></i>
                                    </a>
                                    <ul class="dropdown-menu des_tailor_dropdown_menu" aria-labelledby="navbarDropdownMenuLink1">
                                        {if $arr_trvs_country}
                                        {foreach from=$arr_trvs_country key=key item=item}
                                        <li><a class="dropdown-item" href="{$clsCategory_Country->getLink2($item.category_country_id)}" title="{$clsTourCategory->getTitle($item.cat_id)}">{$clsTourCategory->getTitle($item.cat_id)}</a></li>
                                        {/foreach}
                                        {/if}
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$clsCityStore->getLink($country_id)}" data-link="des_tailor_detail_destination_topattraction" title="{$core->get_Lang('TOP ATTRACTION')}">
                                        {$core->get_Lang('TOP ATTRACTION')}
                                    </a>
                                </li>
                                <li class="nav-item dropdown des_tailor_dropdown">
                                    <a class="nav-link dropdown-toggle" data-link="des_tailor_detail_guide_cat" href="{$clsGuide->getLinkGuideCat($country_slug)}" id="navbarDropdownMenuLink2" role="button" data-bs-toggle="dropdown" aria-expanded="false" title="{$core->get_Lang('TRAVEL GUIDE')}">
                                        {$core->get_Lang('TRAVEL GUIDE')} <i class="fa-light fa-angle-down"></i>
                                    </a>
                                    <ul class="dropdown-menu des_tailor_dropdown_menu" aria-labelledby="navbarDropdownMenuLink2">
                                        {if $arr_trvg_country}
                                        {foreach from=$arr_trvg_country key=key item=item}
                                        <li><a class="dropdown-item" href="{$clsGuide->getLinkGuideCat($country_slug, $item.slug, $item.guidecat_id)}" title="{$clsGuideCat->getTitle($item.guidecat_id)}">{$clsGuideCat->getTitle($item.guidecat_id)}</a></li>
                                        {/foreach}
                                        {/if}
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" title="{$core->get_Lang('BEST TIME')}">{$core->get_Lang('BEST TIME')}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{$clsCountry->getLink($country_id, " Hotel")}" title="{$core->get_Lang('STAY')}">{$core->get_Lang('STAY')}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="des_tailor_detail_destination_place hnv_hide">
                <div class="des_tailor_mid">
                    <div class="des_tailor_title">
                        <h2>{$clsCountry->getOverviewTitle($country_id)}</h2>
                    </div>
                    <div class="des_tailor_description">
                        {$clsCountry->getOverviewDescription($country_id)}
                    </div>
                </div>
                <div class="des_tailor_bot">
                    {if $arr_why}
                    <div class="owl-carousel owl-theme des_list_why_choose_country">
                        {foreach from=$arr_why key=key item=item}
                        {assign var=why_id value=$item.why_id}
                        <div class="item des_tailor_item">
                            <div class="des_tailor_item_img">
                                <img src="{$clsWhy->getImageUrl($why_id)}" alt="Tailor Image">
                            </div>
                            <div class="des_tailor_item_title">
                                <h2>{$clsWhy->getTitle($why_id)}</h2>
                            </div>
                            <div class="des_tailor_item_description">
                                {$clsWhy->getIntro($why_id)}
                            </div>
                        </div>
                        {/foreach}
                    </div>
                    {/if}
                </div>
            </div>
            <div class="des_tailor_detail_tour_cat hnv_hide">
                <div class="des_tailor_travel_style_image">
                    <img src="{$clsCategory_Country->getImageHorizontal($id_current_trvs, 1280, 552)}" width="1280" height="552" alt="Travel Style">
                    <div class="des_tailor_travel_style_content">
                        <div class="des_tailor_travel_style_title">
                            <h2>{$clsCategory_Country->getIntroTitle($id_current_trvs)}</h2>
                        </div>
                        <div class="des_tailor_travel_style_description">
                            {$clsCategory_Country->getIntroDescription($id_current_trvs)}
                        </div>
                        {if $intro_youtube}
                        <a href="{$intro_youtube}" data-fancybox="gallery" class="des_tailor_travel_style_play">
                            PLAY <i class="fa-sharp fa-solid fa-circle-play"></i>
                            <span class="wave_1"></span>
                            <span class="wave_2"></span>
                        </a>
                        {/if}
                    </div>
                </div>
                <div class="des_travel_style_dream">
                    <div class="des_group_dream">
                        <div class="des_dream_rec">
                            <p>{$clsConfiguration->getValue('TrvsTailorMadeTourTitle_'|cat:$_LANG_ID)|html_entity_decode}</p>
                            <a href="{$clsTour->getLink2(0, 1)}" title="Ask">{$core->get_Lang('ASK FOR A QUOTE')} <i class="fa-solid fa-arrow-right-long"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{literal}
<style>
    .des_tailor_travel_style_image {
        position: relative;
        margin-bottom: 80px;
    }

    .des_tailor_travel_style_image img {
        border-radius: 8px;
        filter: brightness(0.7);
        width: 100%;
        height: auto;
    }

    .des_tailor_travel_style_content {
        position: absolute;
        top: 124px;
        left: 60px;
        width: 781px;
    }

    .des_tailor_travel_style_title h2 {
        color: var(--Neutral-6, #FFF);
        font-family: "SF Pro Display";
        font-size: 32px;
        font-style: normal;
        font-weight: 600;
    }

    .des_tailor_travel_style_description {
        color: var(--Neutral-5, #F0F0F0);
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        margin-top: 24px;
        margin-bottom: 48px;
    }

    .des_tailor_travel_style_description p {
        margin-bottom: 0;
    }

    .des_tailor_travel_style_play {
        display: inline-flex;
        padding: 12px 20px;
        justify-content: center;
        align-items: center;
        gap: 12px;
        border-radius: 8px;
        background: var(--Neutral-6, #FFF);
        color: #333;
        transform: scaleX(1);
    }

    /* Video Animate */
    .wave_1,
    .wave_2 {
        content: "";
        position: absolute;
        z-index: -1;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        display: block;
        border: 1px solid white;
        border-radius: 12px;
    }

    .wave_1 {
        width: 115px;
        height: 60px;
        animation: pulse-border 1200ms ease-out infinite;
    }

    .wave_2 {
        width: 120px;
        height: 65px;
        animation: pulse-border 1500ms ease-out infinite;
    }

    @keyframes pulse-border {
        0% {
            transform: translate(-50%, -50%) scale(1);
            opacity: 1;
        }

        100% {
            transform: translate(-50%, -50%) scale(var(--scale-end, 1.1));
            opacity: 0;
        }
    }

    .wave_1 {
        --scale-end: 1.05;
    }

    .wave_2 {
        --scale-end: 1.25;
    }

    /* dream */
    .des_group_dream {
        height: 296px;
        padding: 80px 0;
        position: relative;
        margin-bottom: 20px;
    }

    .des_group_dream .des_dream_rec {
        max-width: 879.048px;
        height: 91px;
        border: solid 2px var(--Neutral-4, #d3dce1);
        border-radius: 5px;
        margin: 0 auto;
        position: relative;
        display: flex;
        text-align: center;
        justify-content: center;
        align-items: center;
        top: 23px;
    }

    .des_group_dream .des_dream_rec p {
        position: relative;
        top: -35px;
        background: #fff;
        padding: 0px 10px;
        max-width: 825px;
        color: var(--black_color) !important;
        text-align: center;
        font-family: Reey;
        font-size: 32px !important;
        font-weight: 400 !important;
        line-height: 52px !important;
        margin-bottom: 40px;
    }

    .des_group_dream .des_dream_rec a {
        position: absolute;
        bottom: -24px;
        display: flex;
        width: 263.944px;
        padding: 12px 20px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 8px;
        background: var(--Primary, #ffa718);
        color: #fff;
        transition: ease-in-out all 0.3s;
    }

    .des_group_dream .des_dream_rec a:hover {
        background: #E88F00;
    }

    .des_group_dream .des_dream_rec .fa-arrow-right-long {
        margin-left: 8px;
        margin-bottom: 3px;
    }

    .des_list_why_choose_country .owl-item {
        margin-right: unset;
        height: unset;
        min-width: unset;
    }

    @media screen and (max-width: 1170px) {}

    @media screen and (max-width: 1024px) {}

    @media screen and (max-width: 800px) {}

    @media screen and (max-width: 600px) {}

    @media screen and (max-width: 414px) {
        .des_group_dream {
            height: 232px;
            padding: 48px 0;
        }

        .des_group_dream .des_dream_rec {
            width: 327px;
        }

        .des_group_dream .des_dream_rec p {
            font-size: 20px !important;
            font-weight: 400 !important;
            line-height: 40px !important;
            width: 300px;
        }

        .des_group_dream .des_dream_rec a {
            position: absolute;
            bottom: -24px;
            font-size: 16px !important;
            font-weight: 500 !important;
            line-height: 24px !important;
        }

        .des_tailor_travel_style_content {
            position: absolute;
            top: 30px;
            left: 15px;
            right: 15px;
            width: unset;
        }
    }

    @media screen and (max-width: 375px) {}
</style>
{/literal}

{literal}
<script>
    $(document).ready(function() {
        // Act .nav-link tương ứng khi load trang
        $('.nav-link').each(function() {
            var dataLink = $(this).data('link');
            if (dataLink === 'des_tailor_detail_' + mod + '_' + act) {
                $(this).addClass('hnv_active');
            }
        });
        // Show data .nav-link tương ứng khi load trang
        $('.hnv_hide').hide();
        $('.des_tailor_detail_' + mod + '_' + act).removeClass('hnv_hide').addClass('hnv_show');
        // // Xử lý sự kiện click .nav-link
        // $('.nav-link').click(function(e) {
        //     e.preventDefault();
        //     // Act .nav-link
        //     $('.nav-link').removeClass('hnv_active');
        //     $(this).addClass('hnv_active');
        //     // Show data của .nav-link
        //     var dataLink = $(this).data('link');
        //     $('.hnv_hide').hide();
        //     $('.' + dataLink).show();
        // });
    });
    $(window).scroll(function() {
        var isSticky = $(this).scrollTop() >= 500;
        $('.des_tailor_top').toggleClass('des_tailor_top_sticky', isSticky);
    });
    if ($('.des_list_why_choose_country').length > 0) {
        var $owl = $('.des_list_why_choose_country');
        $owl.owlCarousel({
            lazyLoad: true,
            loop: false,
            margin: 0,
            nav: false,
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
</script>
{/literal}