<div class="des_header_background_image">
    <img src="{$clsCountry->getBannerDescription($country_id, 1920, 600)}" width="1920" height="600" alt="{$info_country.title}">
    <div class="des_header">
        <div class="container">
            <div class="des_header_bg">{$info_country.title}</div>
            <div class="des_header_intro">
                <h1 class="des_header_title">{$info_country.header_title}</h1>
                <div class="des_header_info ellipsis_2_line">
                    {$clsCountry->getHeaderDescription($country_id)}
                </div>
                <a href="#" title="{$core->get_Lang('Create your trip to Vietnam')}" class="des_header_link">
                    {$core->get_Lang('Create your trip to Vietnam')} <i class="fa-sharp fa-regular fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>

{literal}
<style>
    .des_header_background_image {
        position: relative;
        margin-top: -138px;
    }

    .des_header_background_image img {
        width: 100%;
        object-fit: cover;
        filter: brightness(65%);
    }

    .des_header {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
    }

    .des_header_bg {
        color: rgba(255, 255, 255, 0.15);
        font-family: Inter;
        font-size: 261px;
        font-style: normal;
        font-weight: 900;
        line-height: normal;
        letter-spacing: -2.61px;
        text-transform: uppercase;
    }

    .des_header_intro {
        position: absolute;
        top: 35%;
        left: 50%;
        transform: translateX(-50%);
    }

    .des_header_title {
        color: var(--Neutral-6, #FFF);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px;
        text-transform: uppercase;
    }

    .des_header_info {
        color: var(--Neutral-5, #F0F0F0);
        text-align: center;
        font-family: "SF Pro Display";
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        margin-top: 4px;
        margin-bottom: 48px;
    }

    .des_header_info p {
        margin-bottom: unset;
    }

    .des_header_link {
        display: inline-flex;
        padding: 12px 20px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 8px;
        background: var(--Primary, #FFA718);
        color: #fff !important;
        transition: ease-in-out all 0.3s;
    }

    .des_header_link:hover {
        background: #E88F00;
    }

    .des_header_link .fa-arrow-right {
        margin-left: 8px;
    }
</style>
{/literal}