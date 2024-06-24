<!-- Bắt buộc ko format code để tránh hiển thị lỗi -->
<div class="trvs_header_background_image2">
    {if $show == 'CatCountry'}
        <img src="{$clsCategory_Country->getBannerImage2($trvs_id, 1920, 600)}" width="1920" height="600" alt="">
    {elseif $show == 'topAttractionCountry'}
        <img src="{$clsCountry->getTopAttBannerImage($country_id, 1920, 600)}" width="1920" height="600" alt="Top Attraction">
    {/if}
    <div class="trvs_header2">
        <div class="container">
            {if $show == 'CatCountry'}
                <h1 class="trvs_header_title2">{$clsCategory_Country->getBannerTitle($trvs_id)}</h1>
                <div class="trvs_header_description2">
                    {$clsCategory_Country->getBannerDescription($trvs_id)}
                </div>
                <a href="{$clsTour->getLink2(0, 1)}" title="{$core->get_Lang('Create your trip')}" class="trvs_header_link">
                    {$core->get_Lang('Create your trip')} <i class="fa-sharp fa-regular fa-arrow-right" aria-hidden="true"></i>
                </a>
            {elseif $show == 'topAttractionCountry'}
                <h1 class="trvs_header_title2">{$clsCountry->getTopAttBannerTitle($country_id)}</h1>
                <a href="{$clsTour->getLink2(0, 1)}" title="{$core->get_Lang('Create your trip')}" class="trvs_header_link">
                    {$core->get_Lang('Create your trip')} <i class="fa-sharp fa-regular fa-arrow-right" aria-hidden="true"></i>
                </a>
            {/if}
        </div>
    </div>
</div>

{literal}
<style>
    .trvs_header_background_image2 {
        margin-top: -138px;
        position: relative;
        width: 100%;
    }
    .trvs_header_background_image2 img {
        width: 100%;
        filter: brightness(65%);
    }
    .trvs_header2 {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .trvs_header_title2 p {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: Reey;
        font-size: 32px;
        font-style: normal;
        font-weight: 400;
        line-height: 52px;
    }
    .trvs_header_title2 {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: Reey;
        font-size: 32px;
        font-style: normal;
        font-weight: 400;
        line-height: 52px;
    }
    .trvs_header_description2 {
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
    .trvs_header_description2 p {
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
    .destination_topattraction_body .trvs_header_title2 {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px; 
        text-transform: uppercase;
    }
    .destination_topattraction_body .trvs_header_link {
        margin-top: 48px;
    }
    @media screen and (max-width: 414px) {
        .destination_topattraction_body .trvs_header_title2 {
            font-size: 32px;
            line-height: 52px;
        }
    }
</style>
{/literal}