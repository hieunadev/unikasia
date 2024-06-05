<div class="trvg_header">
    <h1 class="trvg_header_title">WHEN TO GO TO?</h1>
    <a href="{$clsTour->getLink2(0, 1)}" title="Create your trip" class="trvg_header_link">Create your trip</a>
</div>
<div class="trvg_header_background_image">
    <img src="
    {if $url_banner}
        {$clsGuideCat->getBanner($guidecat_id, 1920, 600)} 
    {else}
        https://unikasia.vietiso.com/isocms/templates/default/skin/images/destination/bg_trvg.png
    {/if}
    " width="1920" height="600" alt="Travel Guide">
</div>
{literal}
<style>
    /* .destination_travel_guide_body .bground_header {
        background: linear-gradient(rgba(24, 28, 26, 0.4), rgba(24, 28, 26, 0.4)),
            url("https://unikasia.vietiso.com/isocms/templates/default/skin/images/destination/bg_trvg.png");
        background-repeat: no-repeat;
        background-size: cover;
    } */
    .trvg_header_background_image {
        position: absolute;
        top: 0;
        left: 0;
        filter: brightness(65%);
        width: 100%;
        /* z-index: 1; */
    }

    .trvg_header {
        padding-top: 130px;
        padding-bottom: 192px;
        position: relative;
        z-index: 1;
    }

    .trvg_header_title {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px;
    }

    .trvg_header_link {
        padding: 12px 20px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 8px;
        background: var(--Primary, #FFA718);
        display: table;
        margin: 0 auto;
        margin-top: 48px;
        color: #fff !important;
        transition: ease-in-out all 0.3s;

    }

    .trvg_header_link:hover {
        background: #E88F00;
    }
</style>
{/literal}