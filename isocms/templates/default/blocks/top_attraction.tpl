<div class="top_attractions">
    <div class="top_attractions_content">
        <div class="container">
            <div class="unika_attractions d-flex flex-column align-items-center justify-content-center ">
                <h2 class="title_2">
                    {$clsConfiguration->getOutTeam('TopDestinationTitle_'|cat:$_LANG_ID)}
                    <p>
                        {if $clsCountry->getTitle($country_id)}
                        {$clsCountry->getTitle($country_id)}
                        {else}
                        South East Asia
                        {/if}
                    </p>
                </h2>
                <div class=" d-flex attractions justify-content-center align-items-start 0">
                    <div class="top_attractions_item list_top_attractions">
                        <div class="unika_top_attractions swiper">
                            <div class="swiper-wrapper">

                                {section name=i loop=$listSelected}
                                <div class="swiper-slide">
                                    <div class="item_top_attractions d-flex ">
                                        <a href="{$clsCity->getLink2($listSelected[i].city_id)}" title="{$clsCity->getTitle($listSelected[i].city_id)}" class="div_img img_top_attractions">
                                            <img src="{$clsCity->getImage($listSelected[i].city_id, 257, 158)}" alt="{$clsCity->getTitle($listSelected[i].city_id)}">
                                        </a>
                                        <div class="content_attractions d-flex flex-column align-items-start justify-content-center">
                                            <h3>
                                                <a href="{$clsCity->getLink2($listSelected[i].city_id)}" title="{$clsCity->getTitle($listSelected[i].city_id)}" class="title ellipsis_1">
                                                    {$clsCity->getTitle($listSelected[i].city_id)} {$core->get_Lang('Holidays')}
                                                </a>
                                            </h3>
                                            <span class="span ellipsis_2">
                                                {$clsISO->limit_textIso($clsCity->getIntro($listSelected[i].city_id)|html_entity_decode, 15)}
                                            </span>
                                            <a href="javascript:void(0);" class="link d-flex align-items-center justify-content-start cancel_link">
                                                {$clsTourDestination->countTourByCity($listSelected[i].city_id)} {$core->get_Lang('tours from USD')} ${$clsTourDestination->getMinPriceByCity($listSelected[i].city_id)}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                {/section}
                            </div>
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </div>
                        <div class="swiper-button-prev">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="top_attractions_item">
                        <div class="unika_img_map">
                            <iframe id="city-map" src="{$clsCountry->getMapLink($country_id)}" width="100%" height="797px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn_top_attractions d-flex align-items-center justify-content-center ">
                    {$core->get_Lang('Explore all attractions')}
                    <div class="div_img">
                        <i class="fa-light fa-arrow-right"></i>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
{literal}
<style>
    .top_attractions {
        background: #FFFFFF;
    }

    .top_attractions_content {
        border-radius: 40px 40px 0px 0px;
        padding: 80px 0px;
        background: #FFF9F1;
        position: relative;
    }

    .top_attractions_item {
        width: calc(50% - 20px);
        height: 797px;
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

    .unika_attractions {
        gap: 50px;
    }

    .title_2 {
        display: flex;
        gap: 5px;
    }

    .title_2 span {
        position: relative;
    }

    .title_2 span::after {
        content: "";
        position: absolute;
        background-color: #ffa718;
        z-index: -1;
        height: 8px;
        width: 100%;
        left: 0;
        bottom: 7px;
    }

    .title_2,
    .title_2 span {
        font-size: 32px;
        font-weight: 600;
        line-height: 52px;
        color: #111D37;
        z-index: 0;
        text-decoration: none !important;
    }

    .title_2 p {
        margin-bottom: unset;
    }

    .attractions {
        width: 100%;
        gap: 39px;
        height: max-content;
    }

    .list_top_attractions {
        position: relative;
    }

    .list_top_attractions::-webkit-scrollbar {
        width: 0px;
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

    .item_top_attractions {
        transition: all .3s ease-in-out;
        width: 100%;
    }

    .item_top_attractions:hover {
        box-shadow: 0px 12px 24px 0px rgba(255, 167, 24, 0.36);
    }

    .img_top_attractions {
        transition: all .3s ease-in-out;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .img_top_attractions img:hover {
        object-fit: cover;
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
        transition: all .3s ease-in-out;
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

    .img_top_attractions {
        max-width: 257px;
        position: relative;
        border-radius: 8px;
        min-width: 200px;
        width: 100%;
    }

    .content_attractions {
        padding: 19px 20px 19px 20px;
        border-radius: 8px;
        background: #FFFFFF;
        position: relative;
        left: -10px;
        gap: 8px;
        width: calc(100% - 250px);
    }

    .btn_top_attractions {
        padding: 12px 42px;
        background: #FFA718;
        border-radius: 8px;
        gap: 8px;
        color: #FFFFFF !important;
        font-size: 16px;
        font-style: normal;
        font-weight: 500;
        line-height: 24px;
        transition: all .3s ease-in-out;
    }

    .btn_top_attractions:hover {
        background: #e88f00;
    }

    @media screen and (max-width: 1025px) {
        .top_attractions_item {
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .attractions {
            flex-direction: column;
        }
    }

    @media screen and (max-width: 768px) {
        .top_attractions_item {
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .top_attractions {
            padding: 40px 0;
        }

        .top_attractions::after {
            display: none;
        }
    }

    @media screen and (max-width: 545px) {
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

        .title_2 {
            display: unset;
        }
    }
</style>
{/literal}
{literal}
<script>
    $(document).ready(function() {
        new Swiper('.unika_top_attractions', {
            slidesPerView: 4.53,
            spaceBetween: 24,
            direction: 'vertical', // Make the swiper vertical
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                0: {
                    slidesPerView: 2,
                },
                450: {
                    slidesPerView: 1.75,
                },
                546: {
                    slidesPerView: 4.53,
                },
            }
        });
    });
</script>
{/literal}







<!-- <section class="top-attractions">
    <div class="container">
        <h2 class="txt_title_attractions d-flex justify-content-center">{$clsConfiguration->getOutTeam('TopDestinationTitle')} <p>&#160;{if $clsCountry->getTitle($country_id)} {$clsCountry->getTitle($country_id)} {else}South East Asia {/if}</p>
        </h2>
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <div class="list-holidays">
                    {section name=i loop=$listSelected}
                    <div class="holiday">
                        <div class="hnv_item_holiday">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-5 col-lg-5">
                                    <a href="{$clsCity->getLink($listSelected[i].city_id)}" title="{$clsCity->getTitle($listSelected[i].city_id)}">
                                        <div class="hnv_item_image_holiday">
                                            <img class="img_holiday" src="{$clsCity->getImage($listSelected[i].city_id, 257, 158)}" onerror="this.src='{$URL_IMAGES}/none_image.png'" width="257" height="158">
                                        </div>
                                    </a>
                                </div>
                                <div class="col-12 col-sm-12 col-md-7 col-lg-7">
                                    <div class="content_holiday">
                                        <h3 class="title_hodiday pb-0">
                                            <a class="txt-hover-home  city-title" href="{$clsCity->getLink($listSelected[i].city_id)}" title="{$clsCity->getTitle($listSelected[i].city_id)}">
                                                {$clsCity->getTitle($listSelected[i].city_id)} Holidays
                                            </a>
                                        </h3>
                                        <p class="txt_holiday pb-0">{$clsISO->limit_textIso($clsCity->getIntro($listSelected[i].city_id)|html_entity_decode, 15)}</p>
                                        <p class="txt_detail_holiday pb-0">{$clsTourDestination->countTourByCity($listSelected[i].city_id)} tours from USD ${$clsTourDestination->getMinPriceByCity($listSelected[i].city_id)}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/section}
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                <iframe id="city-map" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d8479708.1163098!2d98.40041518043569!3d16.03001272123944!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31157a4d736a1e5f%3A0xb03bb0c9e2fe62be!2sVietnam!5e0!3m2!1sen!2sus!4v1715618209377!5m2!1sen!2sus" width="100%" height="797px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
        <div class="btn-attraction text-center mt-5">
            <button class="btn txt_btn">{$core->get_Lang('Explore all attractions')}
                <i class="fa-light fa-arrow-right ms-2"></i>
            </button>
        </div>
    </div>
</section> -->

<!-- <style>
    .top-attractions .btn-attraction .txt_btn {
        border: none;
    }


    .content_holiday .title_hodiday a:hover {
        color: #FFA718;
    }

    .top-attractions .holiday:hover {

        box-shadow: 0px 12px 24px 0px rgba(255, 167, 24, 0.36);

    }

    .btn-attraction .txt_btn {
        transition: ease-in-out all 0.3s;
    }

    .btn-attraction .txt_btn:hover {
        background: #e88f00 !important;
    }
</> -->

<!-- <script>
    $(document).ready(function() {
        $(".city-title").click(function(event) {
            event.preventDefault();
            var cityTitle = $(this).attr("title");
            var newSrc = "https://maps.google.it/maps?q=" + encodeURIComponent(cityTitle) + "&output=embed";
            $("#city-map").attr("src", newSrc);
        });
    });
</script> -->