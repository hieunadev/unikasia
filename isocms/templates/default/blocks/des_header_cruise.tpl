<!-- Không format code để tránh hiển thị lỗi -->
<div class="cru_header">
    <h1 class="cru_header_title">
        {if $show eq 'CruiseCatCountry'}
            {if $cruise_cat_country_id ne ''}
                {$clsCruiseCatCountry->getBannerTitle($cruise_cat_country_id)}
            {else}
                {$clsCountry->getTitle($country_id)} Cruise
            {/if}
        {else}
            Cruise
        {/if}
    </h1>
    <div class="cru_header_description">
        {$clsCruiseCatCountry->getBannerIntro($cruise_cat_country_id)}
    </div>
</div>
<div class="cru_header_background_image">
    {if $show eq 'CruiseCatCountry'}
        {if $cruise_cat_country_id ne ''}
            <img src="{$clsCruiseCatCountry->getBannerImageHorizontal($cruise_cat_country_id, 1920, 600)}" width="1920" height="600" alt="{$clsCruiseCatCountry->getBannerTitle($cruise_cat_country_id)}">
        {else}
            <img src="{$clsCountry->getCruiseBannerImage($country_id, 1920, 600)}" width="1920" height="600" alt="{$clsCountry->getTitle($country_id)}">
        {/if}
    {elseif $show eq 'CruiseCat'}
        <img src="{$URL_IMAGES}/destination/bg_cruise.png" width="1920" height="600" alt="Cruise">
    {/if}
</div>
{literal}
<style>
    .cru_header_background_image {
        position: absolute;
        top: 0;
        left: 0;
        filter: brightness(65%);
        width: 100%;
        /* z-index: 1; */
    }

    .cru_header_title {
        color: #FFF;
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px;
    }

    .cru_header_title p,
    .cru_header_description p {
        margin-bottom: unset;
    }

    .cru_header_description {
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

    .cru_header {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -15%);
        z-index: 1;
    }

    .cruise_cat_body .bground_header {
        position: relative;
    }
</style>
{/literal}