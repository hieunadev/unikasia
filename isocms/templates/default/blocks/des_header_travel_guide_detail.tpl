{if $mod eq 'guide' && $act eq 'detail'}
<div class="trvgd_header d-flex">
    <div class="trvgd_header_image">
        <img src="{$clsGuide->getImage($guide_id, 1035, 861)}" alt="{$clsGuide->getTitle($guide_id)}" width="1034" height="861">
    </div>
    <div class="trvgd_header_intro">
        <div class="trvgd_header_txt">
            <span class="trvgd_header_place">
                {$country_title} &ensp;|&ensp; <a href="{$guidecat_link}" title="{$guidecat_title}">{$guidecat_title}</a>
            </span>
            <h1 class="trvgd_header_title">{$clsGuide->getTitle($guide_id)}</h1>
            <div class="trvgd_header_description">
                {$clsGuide->getIntro($guide_id)}
            </div>
            <div class="trvgd_header_source">
                <div class="box_left">
                    <i class="fa-light fa-clock"></i> {$clsGuide->getPublishDate($guide_id)}
                </div>
                <div class="box_right">
                    <i class="fa-light fa-user"></i>
                    {if $guide_info['author'] ne ''}
                    {$guide_info['author']}
                    {else}
                    UnikAsia
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
{elseif $mod eq 'destination' && $act eq 'attraction'}
<div class="trvgd_header d-flex">
    <div class="trvgd_header_image">
        <img src="{$clsCity->getImage($city_id, 1035, 861)}" alt="{$clsCity->getTitle($city_id)}" width="1034" height="861">
    </div>
    <div class="trvgd_header_intro">
        <div class="trvgd_header_txt">
            <span class="trvgd_header_place">
                {$clsCountry->getTitle($country_id)}
            </span>
            <h1 class="trvgd_header_title">{$clsCity->getTitle($city_id)}</h1>
            <div class="trvgd_header_description ellipsis_5_line">
                {$clsCity->getIntro($city_id)}
            </div>
        </div>
    </div>
</div>
{/if}
{literal}
<style>
    .trvgd_header_image {
        width: 53.9%;
        height: 100vh;
    }

    .trvgd_header_image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .trvgd_header_intro {
        background: #111D37;
        padding: 220px 320px 220px 47px;
        color: #fff;
        height: 100vh;
        width: calc(100% - 53.9%);
        padding: 47px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .trvgd_header_place {
        color: #fff;
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        text-transform: uppercase;
    }

    .trvgd_header_place a {
        color: #fff;
        transition: all .3s ease-in-out;
    }

    .trvgd_header_place a:hover {
        color: #ffa718;
    }

    .trvgd_header_title {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 32px;
        font-style: normal;
        font-weight: 600;
        line-height: 52px;
        margin-top: 12px;
        margin-bottom: 26px;
    }

    .trvgd_header_description {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        margin-bottom: 35px;
    }

    .trvgd_header_source {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        display: flex;
        flex-direction: row;
        gap: 25px;
    }

    .trvgd_header_source .box_left,
    .trvgd_header_source .box_right {
        display: flex;
        flex-direction: row;
        gap: 7px;
        align-items: center;
    }

    .trvgd_header .col-md-7,
    .trvgd_header .col-lg-7,
    .trvgd_header .col-md-7,
    .trvgd_header .col-lg-5 {
        padding: 0;
    }

    .guide_detail_body .trvgd_header_intro {
        padding-top: 138px;
    }


    @media (min-width: 1440px) {
        .trvgd_header_intro {
            padding-right: calc((100vw - 1310px)/2);
        }
    }

    @media (max-width: 1023px) {
        .trvgd_header {
            flex-direction: column-reverse;
        }

        .trvgd_header_image {
            width: 100%;
            height: 100%;
        }

        .trvgd_header_intro {
            width: 100%;
            height: 100%;
            padding: 50px 10px;
        }

        .trvgd_header_txt {
            max-width: 930px;
            margin: 0 auto;
        }
    }

    @media (max-width: 991px) {
        .trvgd_header_txt {
            max-width: 690px;
        }
    }
</style>
{/literal}