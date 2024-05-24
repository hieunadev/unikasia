<header class="header-home">
    <div class="bground_header">
        <div id="header_fixed">
            <nav class="txt_header1">
                <div class="container">
                    <div class="row border-bottom" id="header_top">
                        <div class="col-md-6 d-flex align-items-center ps-0">
                            <p class="txt_pcust">{$core->get_Lang('Who knows Asia better than us? We are his children, we live there!')}</p>
                        </div>
                        <div class="col-md-6 d-flex align-items-center justify-content-end icon-txt-mail-span pe-0">
                            <img src="{$URL_IMAGES}/home/Message.png" alt="ico_mail" class="img_icon">
                            <a href="mailto:info@hanoivoyage.com">
                                <span class="me-4">info@hanoivoyage.com</span>
                            </a>
                            <img src="{$URL_IMAGES}/home/Call.png" alt="ico_phone" class="img_icon">
                            <a href="tel:0983033966">
                                <span>Whatsapp: 0983033966</span>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="text-light py-3 nah_bg_header_bot">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 d-flex align-items-center ps-0">
                            <h1><a href="/" title="Home">
                                    <img class="img_logo_voyages_1" src="{$clsConfiguration->getValue('HeaderLogo')}" alt="Logo" width="143" height="53">
                                    <img class="img_logo_voyages_2 d-none" src="{$URL_IMAGES}/home/logo_header_2.png" alt="Logo" width="143" height="53">
                                </a></h1>
                        </div>
                        <div class="col-lg-8 col-md-12 col-sm1-12 d-none d-md-flex align-items-center justify-content-center">
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    {$core->get_Lang('Destinations')} <i class="fas fa-angle-down ms-1"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <div class=" dropdown_destination">
                                        <div class="dropdown-menu_country">
                                            {section name=i loop=$lstCountry}
                                                <a class="dropdown-item" href="{$clsCountry->getLink($lstCountry[i].country_id)}" data-img="img_{$lstCountry[i].title}">{$lstCountry[i].title}</a>
                                            {/section}
                                        </div>
                                        <div class="dropdown-menu_img_country">
                                            {section name=i loop=$lstCountry}
                                                <div class="menu_img_country">
                                                    <img id="img_{$lstCountry[i].title}" src="{$lstCountry[i].image}" onerror="this.src='{$URL_IMAGES}/none_image.png'" alt="{$lstCountry[i].slug}">
                                                </div>
                                            {/section}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    {$core->get_Lang('Stay')} <i class="fas fa-angle-down ms-1"></i>
                                </button>
                                <div class="dropdown-menu dropdown-stay-parent">
                                    <div class="dropdown-menu-stay">
                                        {section name=i loop=$lstCountry}
                                        <a class="dropdown-item position-relative overflow-hidden" href="{$clsCountry->getLink($lstCountry[i].country_id, "Hotel")}">
                                            <img src="{$lstCountry[i].image}" onerror="this.src='{$URL_IMAGES}/none_image.png'" alt="{$lstCountry[i].slug}">
                                            <span class="text-light">{$lstCountry[i].title}</span>
                                        </a>
                                        {/section}
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    {$core->get_Lang('Cruises')} <i class="fas fa-angle-down ms-1"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Cruise 1</a>
                                    <a class="dropdown-item" href="#">Cruise 2</a>
                                    <a class="dropdown-item" href="#">Cruise 3</a>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    {$core->get_Lang('Blog')} <i class="fas fa-angle-down ms-1"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Cruise 1</a>
                                    <a class="dropdown-item" href="#">Cruise 2</a>
                                    <a class="dropdown-item" href="#">Cruise 3</a>
                                </div>
                            </div>
                            <div class="button txt_dropdown">
                                <button class="btn txt_dropdown">{$core->get_Lang('About Us')}</button>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 d-flex align-items-center justify-content-end pe-0">
                            <div class="drop_down ml-3">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="text-decoration: none;">
                                    <img src="{$URL_IMAGES}/home/flag_us.png" alt="">
                                    <i class="far fa-angle-down text-white ms-2"></i>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="--bs-dropdown-min-width: unset;">
                                    <a class="dropdown-item" href="#"><img src="{$URL_IMAGES}/home/flag_france.png" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            {$core->getBlock('slider_home')}
    </div>
</header>

<style>
.txt_dropdown .dropdown-menu {
    border: none;
    box-shadow: 0px 12px 32px 0px rgba(125, 135, 158, 0.09);;
}
.dropdown-menu_img_country img {
    display: none;
}
.txt_dropdown .dropdown-menu {
    padding: 24px;
}

.dropdown-menu_img_country .menu_img_country:hover img,
.dropdown-menu-stay .dropdown-item img:hover{
    transform: scale(1.2);
}

.txt_dropdown .dropdown-item {
    padding: 0 0 12px 0;
    text-transform: none;
}
/* Menu Destination */
.dropdown-menu_img_country img.active {
    display: block;
}
.dropdown_destination {
    display: flex;
    width: 578px;
    max-height: 482px;
    justify-content: space-between;
    overflow: hidden;
}

.dropdown-menu_img_country .menu_img_country{
    max-width: 344px;
    max-height: 434px;
    overflow: hidden;
    border-radius: 8px;
}
.dropdown-menu_img_country .menu_img_country img{
    width: 344px;
    height: 434px;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.dropdown-menu_img_country img {
    width: 100%;
    height: auto;
}

/* Menu Stay */
.dropdown-stay-parent {
    transform: translate(-37%, 38px) !important;
}
.dropdown-menu-stay {
    display: flex;
    gap: 10px;
    max-width: 928px;
    max-height: 311px;
}
.dropdown-menu-stay .dropdown-item{
    width: 166px;
    max-height: 261px;
    border-radius: 8px;
}
.dropdown-menu-stay .dropdown-item img{
    height: 261px;
    object-fit: cover;
    transition: transform 0.3s ease;
}
.dropdown-menu-stay .dropdown-item span{
    position: absolute;
    left: 50%;
    bottom: 12px;
    z-index: 1;
    transform: translateX(-50%);
}
</style>
{literal}
    <script>
        $(document).ready(function() {
            $('.menu_img_country img').first().addClass('active');
            $('.dropdown-item').hover(
                function() {
                    $('.menu_img_country img').removeClass('active');
                    let imgId = $(this).data('img');
                    $('#' + imgId).addClass('active');
                }
            );
        });
    </script>
{/literal}