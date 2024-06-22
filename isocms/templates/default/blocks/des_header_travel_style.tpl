<!-- Bắt buộc ko format code để tránh hiển thị lỗi -->
<div class="trvs_header">
    <div class="container">
        {if $show == 'CatCountry'}
            <h1 class="trvs_header_title">{$clsCategory_Country->getBannerTitle($trvs_id)}</h1>
            <div class="trvs_header_description">
                {$clsCategory_Country->getBannerDescription($trvs_id)}
            </div>
            <a href="{$clsTour->getLink2(0, 1)}" title="Create your trip" class="trvs_header_link">
                Create your trip <i class="fa-sharp fa-regular fa-arrow-right" aria-hidden="true"></i>
            </a>
        {elseif $show == 'topAttractionCountry'}
            <h1 class="trvs_header_title">{$clsCountry->getTopAttBannerTitle($country_id)}</h1>
            <div class="trvs_header_description"></div>
        {/if}
    </div>
</div>
<div class="trvs_header_background_image">
    {if $show == 'CatCountry'}
        <img src="
        {if $url_banner}
            {$clsCategory_Country->getBannerImage2($trvs_id, 1920, 600)}
        {else}
            https://unikasia.vietiso.com/isocms/templates/default/skin/images/destination/bg_trvs.png
        {/if}
        " width="1924" height="792" alt="Travel Style">
    {elseif $show == 'topAttractionCountry'}
        <img src="{$clsCountry->getTopAttBannerImage($country_id, 1920, 600)}" width="1920" height="600" alt="Top Attraction">
    {/if}
</div>
{literal}
<style>
    .trvs_header_background_image {
        position: absolute;
        top: 0;
        left: 0;
        filter: brightness(65%);
        width: 100%;
        /* z-index: 1; */
    }

    .trvs_header_title p {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: Reey;
        font-size: 32px;
        font-style: normal;
        font-weight: 400;
        line-height: 52px;
    }

    .trvs_header_title {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: Reey;
        font-size: 32px;
        font-style: normal;
        font-weight: 400;
        line-height: 52px;
    }

    .trvs_header_description {
        color: var(--Neutral-5, #F0F0F0);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        margin-top: 22px;
        margin-bottom: 40px;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .trvs_header_description p {
        margin-bottom: 0;
    }

    .trvs_header_link {
        display: table;
        margin: 0 auto;
        padding: 12px 20px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 8px;
        background: var(--Primary, #FFA718);
        color: #fff !important;
        transition: ease-in-out all 0.3s;
    }

    .trvs_header_link:hover {
        background: #E88F00;
    }

    .trvs_header_link .fa-arrow-right {
        margin-left: 8px;
    }

    .trvs_header {
        padding-top: 162px;
        padding-bottom: 53px;
        position: relative;
        z-index: 1;
    }

    .des_page_container {
        margin-top: unset;
    }

    .trvs_header_background_image img {
        width: 100%;
    }

    .trvs_header {
        padding: 162px 0;
    }

    .destination_topattraction_body .trvs_header_title {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px; 
        text-transform: uppercase;
    }
    @media screen and (max-width: 414px) {
        .trvs_header {
            padding: 75px 0;
        }

        .destination_topattraction_body .trvs_header_title {
            font-size: 32px;
            line-height: 52px;
        }
    }
</style>
{/literal}