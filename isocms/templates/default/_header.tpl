<header class="header-home">
    <div class="bground_header">
        <div id="header_fixed">
            <nav class="txt_header1">
                <div class="container">
                    <div class="row border-bottom" id="header_top">
                        <div class="col-md-6 d-flex align-items-center ps-0">
                            <p class="txt_pcust">Who knows Asia better than us? We are his children, we live there!</p>
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
                                    <img class="img_logo_voyages_1" src="{$URL_IMAGES}/home/logo-hnvoyages.png" alt="Logo" width="143" height="53">
                                    <img class="img_logo_voyages_2 d-none" src="{$URL_IMAGES}/home/logo_header_2.png" alt="Logo" width="143" height="53">
                                </a></h1>
                        </div>
                        <div class="col-lg-8 col-md-12 col-sm1-12 d-none d-md-flex align-items-center justify-content-center">
                            <div class="dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    Destinations <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Destination 1</a>
                                    <a class="dropdown-item" href="#">Destination 2</a>
                                    <a class="dropdown-item" href="#">Destination 3</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    Travel Styles <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">TS 1</a>
                                    <a class="dropdown-item" href="#">TS 2</a>
                                    <a class="dropdown-item" href="#">TS 3</a>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    Stay <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Stay 1</a>
                                    <a class="dropdown-item" href="#">Stay 2</a>
                                    <a class="dropdown-item" href="#">Stay 3</a>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    Cruises <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Cruise 1</a>
                                    <a class="dropdown-item" href="#">Cruise 2</a>
                                    <a class="dropdown-item" href="#">Cruise 3</a>
                                </div>
                            </div>
                            <div class="dropdown txt_dropdown">
                                <button class="btn dropdown-toggle txt_dropdown" type="button" data-bs-toggle="dropdown">
                                    Blog <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Cruise 1</a>
                                    <a class="dropdown-item" href="#">Cruise 2</a>
                                    <a class="dropdown-item" href="#">Cruise 3</a>
                                </div>
                            </div>
                            <div class="button txt_dropdown">
                                <button class="btn txt_dropdown">About Us</button>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 d-flex align-items-center justify-content-end pe-0">
                            <div class="drop_down ml-3">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="text-decoration: none;">
                                    <i class="flag-icon flag-icon-us"></i>
                                    <i class="far fa-angle-down text-white ms-2"></i>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-vn"></i> Vietnamese</a>
                                    <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-fr"></i> Français</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $mod eq 'destination' && $act eq 'place'}
        {$core->getBlock('des_header_destination')}
        {/if}
        {if $mod eq 'destination' && $act eq 'travel_style'}
        {$core->getBlock('des_header_travel_style')}
        {/if}
        {if $mod eq 'destination' && $act eq 'travel_guide'}
        {$core->getBlock('des_header_travel_guide')}
        {/if}
        {if ($mod eq 'destination' && $act eq 'travel_guide_detail') || ($mod eq 'destination' && $act eq 'attraction')}
        {$core->getBlock('des_header_travel_guide_detail')}
        {/if}
    </div>
    {if $mod eq 'homepackage'}
    {$core->getBlock('slider_home')}
    {/if}
</header>