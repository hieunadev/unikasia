{if $_LANG_ID eq 'vn'}
{if $mod ne 'cart'} 
{if $act ne 'success'}
<header id="header" class="header">
	{if $deviceType eq 'computer'}
	<div class="container_header_top container-fluid">
		<div class="container">
			<div class="row header__desktop--right header_top">
				<div class="col-xl-6">
					<div class="header_top_left d-flex align-items-center">
						{if $mod eq 'home'}
						<h1 id="logo" class="logo" title="{$PAGE_NAME}">
							<a  title ="{$PAGE_NAME}" class="navbar-brand" href="{$DOMAIN_NAME}{$extLang}">
								<img alt="{$PAGE_NAME}" src="{$clsConfiguration->getImageValue('HeaderLogo')}" width="98" height="47" class="img100"/>
							</a>
						</h1>
						{else}
						<p id="logo" class="logo">
							<a title ="{$PAGE_NAME}" class="navbar-brand" href="{$DOMAIN_NAME}{$extLang}">
								<img alt="{$PAGE_NAME}" src="{$clsConfiguration->getImageValue('HeaderLogo')}" width="98" height="47" class="img100"/>
							</a>
						</p>
						{/if}
						<div class="box_search_top">
						<form class="form_search_top" method="post" action="{$extLang}/">
							<input type="text" class="search_top" name="key" autocomplete="off" placeholder="{$core->get_Lang('Search by destination, tour')},....">
							<input type="hidden" name="Hid_Search" value="Hid_Search" />
						</form>	
						</div>		

					</div>
				</div>
				<div class="col-xl-6">
					<div class="header_top_right">
						<ul class="header__desktop--right__menu list_style_none">
							<li class="dropdown menu_lang">
								{if $listLang}
								<li class="dropdown language_select">
									<a class="slt_country" data-bs-toggle="dropdown" style="cursor:pointer" title="{$clsISO->getFullLanguage($_LANG_ID)}" role=link aria-disabled=true><i class="flag flag-20 flag-20-{$_LANG_ID} pd0_15"></i> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu menu-language">
										{section name=i loop=$listLang}
										{if $listLang[i] ne $_LANG_ID}
										<li><a class="color_333" href="{if $listLang[i] ne $LANG_DEFAULT}{$DOMAIN_NAME}/{$listLang[i]}{else}{$DOMAIN_NAME}{/if}" title="{$clsISO->getFullLanguage($listLang[i])}"><i class="flag flag-20 flag-20-{$listLang[i]}"></i> {$clsISO->getFullLanguage($listLang[i])}</a></li>
										{/if}
										{/section}
									</ul>
								</li>
								{/if}
							</li>
							{if $clsISO->getCheckActiveModulePackage($package_id,'setting','cart','customize')}
							<li class="cart__box">
								<a href="{$clsISO->getLink('cart')}" rel="nofollow" title="{$core->get_Lang('Cart')}" class="cart__header"><span class="icon__cart"><span class="number__item" id="number_cart">0</span></span><span class="cart">{$core->get_Lang('Cart')}</span></a>
							</li>
							{/if}


							{if !$clsISO->getCheckActiveModulePackage($package_id,'member','default','default')}
							{if $clsISO->getCheckActiveModulePackage($package_id,'blog','default','default')}
							<li>
								<a href="{$clsISO->getLink('blog')}" title="{$core->get_Lang('Travel Blog')}" class=""> {$core->get_Lang('Travel Blog')}</a>
							</li>
							{/if}
							{/if}
							{if $clsISO->getCheckActiveModulePackage($package_id,'faqs','default','default')}
							<li>
								<a href="{$clsISO->getLink('faqs')}" rel="nofollow" title="{$core->get_Lang('FAQs')}" class=""> {$core->get_Lang('FAQs')}</a>
							</li>
							{/if}
							{if $clsISO->getCheckActiveModulePackage($package_id,'member','default','default')}
							<script src = "https://accounts.google.com/gsi/client" async defer > </script> 
							{if $loggedIn eq ''}
								<li class="loggedIn_li">
									<a href="{$clsProfile->getLink('signin')}" class="signin_head login" title="{$core->get_Lang('Sign in')}"> {$core->get_Lang('Sign in')}</a>
									<a href="{$clsProfile->getLink('signup')}" class="signin_head register btn_main" title="{$core->get_Lang('Sign up')}">
										{$core->get_Lang('Sign up')}</a>
								</li>
							{else}
								<li class="loggedIn">
									<a class="profile_owner dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" role=link aria-disabled=true>
										{assign var=_avatar value = $clsProfile->getImageAvatar($profile_id,20,20)}
										<img class="img-cover w20_h20" src="{if $_avatar ne ''}{$_avatar}{else}{$URL_IMAGES}/member.jpg{/if}"/>
										&nbsp;{$clsProfile->getUsername($profile_id)} <i class="fa fa-caret-down"></i>
									</a>
									<ul class="dropdown-menu dropdown-mene-profile" role="menu">
										<li><a role="menuitem" href="{$clsProfile->getLink('my_profile')}">{$core->get_Lang('My Profile')}</a> </li>
										<li><a role="menuitem" href="{$clsProfile->getLink('my_booking')}">{$core->get_Lang('My Booking')}</a> </li>
										<li><a role="menuitem" href="{$clsProfile->getLink('my_review')}" title="{$core->get_Lang('My Tour Reviews')}">{$core->get_Lang('My Tour Reviews')}</a>
										</li>
										{*<li><a role="menuitem" href="{$clsProfile->getLink('my_wishlist')}">{$core->get_Lang('My Wishlist')}</a> </li>*}
										<li>
											<a role="menuitem" href="{$clsProfile->getLink('my_offer')}" title="{$core->get_Lang('My Offers &amp; Discounts')}">{$core->get_Lang('My Offers &amp; Discounts')}</a>
										 </li>
			<!--							<li><a role="menuitem" href="{$clsProfile->getLink('contact_info')}">{$core->get_Lang('Contact Information')}</a> </li>-->
										{assign var=_provider value = $clsProfile->getOauthProvider($profile_id)}
										{if $_provider eq '_REGSITER'}
											<li><a role="menuitem" href="{$clsProfile->getLink('change_pass')}">{$core->get_Lang('Change Password')}</a> </li>
										{/if}
										<li><a role="menuitem" href="{$clsProfile->getLink('logout')}"><i class="fa fa-sign-out" aria-hidden="true"></i> {$core->get_Lang('Logout')}</a></li>
									</ul>
								</li>
								{*<li><a href="{$extLang}/account/my-wishlist.html" title="{$core->get_Lang('Wishlist')}"> <i class="fa fa-heart" aria-hidden="true"></i> {$numWishlist}</a></li>*}
							{/if}
							{/if}
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<div class="container">
		<div class="row header__desktop--left header_main">
			<div class="col-xl-12">
				<nav class="main__menu" id="main__menu">
                    <ul class="main__menu--ul ul_main_menu">
                        {if $package_id!=1}
                            <li class="relative">
                                <a href="javascript:void(0);" class="mnu-main mnu-level-1 dropdown-toggle"
                                   id="dropdownMenuDomestic" data-bs-toggle="dropdown" data-target="mg-s-tours"
                                   aria-expanded="false" rel="nofollow"
                                   role="link">{$core->get_Lang('Domestic tours')}</a>
                                <div class="dropdown-menu mega-menu mg-dropdown mg-s-tours header-mega-menu-new dropdownMenuDomestic"
                                     aria-labelledby="dropdownMenuDomestic">
                                    <div class="d-flex-menu">
                                        <div class="d-nav-menu">
                                            <ul class="nav nav-tabs nav-pills nav-stacked" role="tablist">
                                                {section name=i loop=$lstRegionTour}
                                                    {assign var=TitleRegion value=$lstRegionTour[i].title}
                                                    {assign var=slugRegion value=$lstRegionTour[i].slug}
                                                    {assign var=listCityTourByRegion value=$lstRegionTour[i].listCityTourByRegion}
                                                    <li role="presentation">
                                                        <div class="tab-menu {if $smarty.section.i.first}active{/if}"
                                                             title="{$TitleRegion}" href="#{$slugRegion}" role="tab"
                                                             data-bs-toggle="tab"
                                                             aria-expanded="{if $smarty.section.i.first}true{else}false{/if}">{$TitleRegion}</div>
                                                    </li>
                                                {/section}
                                            </ul>
                                        </div>
                                        <div class="tab-content">
                                            {section name=i loop=$lstRegionTour}
                                                {assign var=TitleRegion value=$lstRegionTour[i].title}
                                                {assign var=slugRegion value=$lstRegionTour[i].slug}
                                                {assign var=listCityTourByRegion value=$lstRegionTour[i].listCityTourByRegion}
                                                <div role="tabpanel"
                                                     class="tab-pane {if $smarty.section.i.first}show{/if}"
                                                     id="{$slugRegion}">
                                                    <div class="flex_colum">
                                                        <div class="mega-item-menu">
                                                            <a class="label" role="link"
                                                               title="{$TitleRegion}">{$TitleRegion}</a>
                                                            <ul>
                                                                {section name=j loop=$listCityTourByRegion}
                                                                    <li>
                                                                        <a href="{$clsCity->getLinkInbound($listCityTourByRegion[j].city_id,$listCityTourByRegion[j])}"
                                                                           title="{$listCityTourByRegion[j].title}">
                                                                            {$listCityTourByRegion[j].title}
                                                                        </a>
                                                                    </li>
                                                                {/section}
                                                            </ul>
                                                        </div>

                                                    </div>
                                                </div>
                                            {/section}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="relative">
                                <a href="javascript:void(0);" class="mnu-main mnu-level-1 dropdown-toggle"
                                   id="dropdownMenuDes" data-bs-toggle="dropdown" data-target="mg-s-tours"
                                   aria-expanded="false" rel="nofollow"
                                   role="link">{$core->get_Lang('Outbound tours')}</a>
                                <div class="dropdown-menu mega-menu mg-dropdown mg-s-tours header-mega-menu-new"
                                     aria-labelledby="dropdownMenuDes">
                                    <div class="d-flex-menu">
                                        <div class="d-nav-menu">
                                            <ul class="nav nav-tabs nav-pills nav-stacked" role="tablist">
                                                {section name=i loop=$lstCountryTourOutbound}
                                                    {assign var=country__id value=$lstCountryTourOutbound[i].country_id}
                                                    {assign var=title_country value=$lstCountryTourOutbound[i].title}
                                                    <li><a class="tab-menu"
                                                           href="{$clsCountryEx->getLinkOutbound($country__id,$lstCountryTourOutbound[i])}"
                                                           title="{$title_country}">{$title_country}</a></li>
                                                {/section}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="relative">
                                <a href="javascript:void(0);" class="mnu-main mnu-level-1 dropdown-toggle"
                                   id="dropdownMenuTravelStyle" data-bs-toggle="dropdown" data-target="mg-s-tours"
                                   aria-expanded="false" rel="nofollow" role="link">{$core->get_Lang('Travel styles')}</a>
                                {if $clsISO->getCheckActiveModulePackage($package_id,'tour','category_country','default')}
                                    <div class="dropdown-menu mega-menu mg-dropdown mg-s-tours header-mega-menu-new dropdownMenuTravelStyle"
                                         aria-labelledby="dropdownMenuTravelStyle">
                                        <div class="d-flex-menu">
                                            <div class="d-nav-menu">
                                                <ul class="nav nav-tabs nav-pills nav-stacked" role="tablist">
                                                    {section name=i loop=$lstCountryTourOutbound}
                                                        {assign var=country__id value=$lstCountryTourOutbound[i].country_id}
                                                        {assign var=title_country value=$lstCountryTourOutbound[i].title}
                                                        {assign var=lstCountryCat value=$clsCategory_Country->getListCatCountry($country__id)}
                                                        {if $lstCountryCat}
                                                            <li role="presentation">
                                                                <div class="tab-menu {if !$first}active{/if}"
                                                                     title="{$title_country}"
                                                                     href="#Country_{$country__id}" role="tab"
                                                                     data-bs-toggle="tab"
                                                                     aria-expanded="{if $smarty.section.i.first}true{else}false{/if}">{$title_country}</div>
                                                            </li>
                                                            {assign var=first value=1}
                                                        {/if}
                                                    {/section}
                                                </ul>
                                            </div>
                                            <div class="tab-content">
                                                {section name=i loop=$lstCountryTourOutbound}
                                                    {assign var=country__id value=$lstCountryTourOutbound[i].country_id}
                                                    {assign var=title_country value=$lstCountryTourOutbound[i].title}
                                                    {assign var=lstCountryCat value=$clsCategory_Country->getListCatCountry($country__id)}
                                                    {if $lstCountryCat}
                                                        <div role="tabpanel"
                                                             class="tab-pane {if !$first2}show{/if}"
                                                             id="Country_{$country__id}">
                                                            <div class="flex_colum">
                                                                <div class="mega-item-menu">
                                                                    <a class="label" role="link"
                                                                       title="{$title_country}">{$title_country}</a>
                                                                    <ul>
                                                                        {section name=j loop=$lstCountryCat}
                                                                            {assign var=oneCategoryCountry value=$clsTourCategory->getOne($lstCountryCat[j].cat_id,'title,slug')}
                                                                            {assign var=title_category_country value=$oneCategoryCountry.title}
                                                                            {if $title_category_country}
                                                                                <li>
                                                                                    <a href="{$clsTourCategory->getLinkCatCountry($lstCountryCat[j].cat_id,$country__id,$oneCategoryCountry)}"
                                                                                       title="{$title_category_country}">
                                                                                        {$title_category_country}
                                                                                    </a>
                                                                                </li>
                                                                            {/if}
                                                                        {/section}
                                                                    </ul>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        {assign var=first2 value=1}
                                                    {/if}
                                                {/section}
                                            </div>
                                        </div>
                                    </div>
                                {else}
                                    {if $lstCatTour}
                                        <ul class="dropdown-menu dropdown_travelstyle" role="menu">
                                            {section name=j loop=$lstCatTour}
                                                {assign var=title_category value=$lstCatTour[j].title}
                                                <li><a title="{$title_category}"
                                                       href="{$clsTourCategory->getLink($lstCatTour[j].tourcat_id,$lstCatTour[i])}">{$title_category} </a>
                                                </li>
                                            {/section}
                                        </ul>
                                    {/if}
                                {/if}
                            </li>
                            <li class="relative">
                                <a href="javascript:void(0);"
                                   class="mnu-main mnu-level-1 dropdown-toggle {if ($mod=='tour' || $mod=='tour_new') && $act!='contact'}active{/if}"
                                   id="dropdownMenuOther" data-bs-toggle="dropdown" data-target="mg-s-tours"
                                   aria-expanded="false" rel="nofollow"
                                   role="link">{$core->get_Lang('Other Products')}</a>
                                <div class="dropdown-menu mega-menu mg-dropdown mg-s-tours header-mega-menu-new dropdownMenuOther"
                                     aria-labelledby="dropdownMenuOther">
                                    <div class="d-flex-menu">
                                        <div class="d-nav-menu">
                                            <ul class="nav nav-tabs nav-pills nav-stacked" role="tablist">

                                                <li role="presentation">
                                                    <div class="tab-menu active" title="{$core->get_Lang('Stay')}"
                                                         href="#stay" role="tab" data-bs-toggle="tab"
                                                         aria-expanded="true">{$core->get_Lang('Stay')}</div>
                                                </li>
                                                <li role="presentation">
                                                    <div class="tab-menu" title="{$core->get_Lang('Cruise')}"
                                                         href="#cruise" role="tab" data-bs-toggle="tab"
                                                         aria-expanded="true">{$core->get_Lang('Cruise')}</div>
                                                </li>
                                                <li role="presentation">
                                                    <a class="tab-menu color_1c1c1c"
                                                       title="{$core->get_Lang('Voucher')}"
                                                       href="{$clsISO->getLink('voucher')}">{$core->get_Lang('Voucher')}</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane show" id="stay">
                                                <div class="flex_colum">
                                                    <div class="mega-item-menu">
                                                        <ul>
                                                            {section name=i loop=$lstCountryHotel}
                                                                {assign var=country_hotel_title value=$lstCountryHotel[i].title}
                                                                <li>
                                                                    <a href="{$clsCountryEx->getLink($lstCountryHotel[i].country_id,'Hotel',$lstCountryHotel[i])}"
                                                                       title="{$country_hotel_title}">{$country_hotel_title}</a>
                                                                </li>
                                                            {/section}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="cruise">
                                                <div class="flex_colum">
                                                    <div class="mega-item-menu">
                                                        <ul>
                                                            {section name=i loop=$lstCruiseCat}
                                                                {assign var=_cruisecat_id value=$lstCruiseCat[i].cruise_cat_id}
                                                                {assign var=title_cruisecat value=$lstCruiseCat[i].title}
                                                                {assign var=link_cruisecat value=$clsCruiseCat->getLink($_cruisecat_id,$lstCruiseCat[i])}
                                                                {if $clsISO->getCheckActiveModulePackage($package_id,'cruise','cruise_sub_category','customize')}
                                                                    {assign var=childCat value=$clsCruiseCat->getMenuChild($_cruisecat_id)}
                                                                    <li><a href="{$link_cruisecat}"
                                                                           title="{$title_cruisecat}">{$title_cruisecat}</a>
                                                                        {$childCat}
                                                                    </li>
                                                                {else}
                                                                    <li><a href="{$link_cruisecat}"
                                                                           title="{$title_cruisecat}">{$title_cruisecat}</a>
                                                                    </li>
                                                                {/if}
                                                            {/section}
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        {else}
                            <li class="relative">
                                <a href="{$clsISO->getLink('search_tour')}" title="{$core->get_Lang('Our')}"
                                   class="color_1c1c1c"> {$core->get_Lang('Our')}</a>
                            </li>
                            <li class="relative subMenu">
                                <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);"
                                   title="{$core->get_Lang('Travel Styles')}" role=link aria-disabled=true>{$core->get_Lang('Travel Styles')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu dropdown_hotel nav_menu_child" role="menu">
                                    {section name=i loop=$lstCatTour}
                                        {assign var = title_category value = $lstCatTour[i].title}
                                        <li class="menuhover"><a
                                                    href="{$clsTourCategory->getLink($lstCatTour[i].tourcat_id,$lstCatTour[i])}"
                                                    title="{$title_category}">{$title_category}</a></li>
                                    {/section}
                                </ul>
                            </li>
                            <li class="relative">
                                <a href="{$clsISO->getLink('tailor')}"
                                   title="{$core->get_Lang('Tailor made tour')}"> {$core->get_Lang('Tailor made tour')}</a>
                            </li>
                            <li class="relative">
                                <a href="{$clsISO->getLink('service')}" title="{$core->get_Lang('Services')}"
                                   class="color_1c1c1c"> {$core->get_Lang('Services')}</a>
                            </li>
                        {/if}

                        <li class="relative">
                            <a href="{$clsISO->getLink('news')}" title="{$core->get_Lang('Experience')}" class="color_1c1c1c"> {$core->get_Lang('Experience')}</a>
                        </li>

                        <li class="relative">
                            <a href="{$clsISO->getLink('blog')}" title="{$core->get_Lang('Blog')}" class="color_1c1c1c"> {$core->get_Lang('Blog')}</a>
                        </li>
                        {if $package_id==3 || $package_id==4}
                            <li class="menu_promotion">
                                <a href="{$clsISO->getLink('promotion')}" title="{$core->get_Lang('Promotion')}" class="color_1c1c1c"> {$core->get_Lang('Promotion')}</a>
                            </li>
                        {/if}
                    </ul>

                    {if 1==2}
                        <ul class="main__menu--ul ">
                            {if $package_id!=1}
                                <li class="relative subMenu subMenuInbound">
                                    <a class="dropdown-toggle pdl-0" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Domestic tours')}" role=link aria-disabled=true>{$core->get_Lang('Domestic tours')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu tab-pane tab__menu">
                                        <ul class="nav nav-pills nav_menu_child">
                                            {section name=i loop=$lstRegionTour}
                                                {assign var=TitleRegion value=$lstRegionTour[i].title}
                                                {assign var=slugRegion value=$lstRegionTour[i].slug}
                                                {assign var=listCityTourByRegion value=$lstRegionTour[i].listCityTourByRegion}
                                                <li class="{if $smarty.section.i.first}active{/if} subMenu">
                                                    <a data-bs-toggle="pill" href="#region_{$slugRegion}" title="{$TitleRegion}">{$TitleRegion}</a>
                                                    <div id="#region_{$slugRegion}" class="sub_dropdown-menu tab-pane tab_menu_child {if $smarty.section.i.first}active in{/if}">
                                                        <p class="region__name">{$TitleRegion}</p>
                                                        <ul class="list_item_tab_menu box_col list_style_none">
                                                            {section name=j loop=$listCityTourByRegion}
                                                                <li><a href="{$clsCity->getLinkInbound($listCityTourByRegion[j].city_id,$listCityTourByRegion[j])}" title="{$listCityTourByRegion[j].title}">{$listCityTourByRegion[j].title}</a></li>
                                                            {/section}
                                                        </ul>
                                                    </div>
                                                </li>
                                            {/section}
                                        </ul>
                                    </div>
                                </li>
                                <li class="relative subMenu">
                                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Outbound tours')}" role=link aria-disabled=true>{$core->get_Lang('Outbound tours')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu dropdown_hotel nav_menu_child" role="menu">
                                        {section name=i loop=$lstCountryTourOutbound}
                                            {assign var=country__id value=$lstCountryTourOutbound[i].country_id}
                                            {assign var=title_country value=$lstCountryTourOutbound[i].title}
                                            <li class="menuhover"><a href="{$clsCountryEx->getLinkOutbound($country__id,$lstCountryTourOutbound[i])}" title="{$title_country}">{$title_country}</a></li>
                                        {/section}
                                    </ul>
                                </li>
                                <li class="relative subMenu subMenuCat">
                                    <a class="dropdown-toggle pdl-0" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Travel styles')}" role=link aria-disabled=true>{$core->get_Lang('Travel styles')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    {if $clsISO->getCheckActiveModulePackage($package_id,'tour','category_country','default')}
                                        <div class="dropdown-menu tab-pan tab__menu tab">
                                            <ul class="nav nav-pills nav_menu_child">
                                                {section name=i loop=$lstCountryTourOutbound}
                                                    {assign var=country__id value=$lstCountryTourOutbound[i].country_id}
                                                    {assign var=title_country value=$lstCountryTourOutbound[i].title}
                                                    {assign var=lstCountryCat value=$clsCategory_Country->getListCatCountry($country__id)}
                                                    {if $lstCountryCat}
                                                        <li class="tablinks " onMouseOver="openCountry(event, 'Country_{$country__id}')"><a href="javascript:void(0);" data-bs-toggle role=link aria-disabled=true>{$title_country}</a>
                                                            <div class="sub_dropdown-menu tab-pane tab_menu_child">
                                                                <p class="region__name">{$title_country}</p>
                                                                <ul id="Country_{$country__id}"
                                                                    class="tabcontent list_item_tab_menu box_col list_style_none">
                                                                    {section name=j loop=$lstCountryCat}
                                                                        {assign var=oneCategoryCountry value=$clsTourCategory->getOne($lstCountryCat[j].cat_id,'title,slug')}
                                                                        {assign var=title_category_country value=$oneCategoryCountry.title}
                                                                        <li>
                                                                            <a href="{$clsTourCategory->getLinkCatCountry($lstCountryCat[j].cat_id,$country__id,$oneCategoryCountry)}"
                                                                               title="{$title_category_country}">
                                                                                {$title_category_country}
                                                                            </a>
                                                                        </li>
                                                                    {/section}
                                                                </ul>
                                                            </div>
                                                        </li>
                                                    {/if}
                                                {/section}
                                            </ul>
                                        </div>
                                    {else}
                                        {if $lstCatTour}
                                            <ul class="dropdown-menu dropdown_travelstyle" role="menu">
                                                {section name=j loop=$lstCatTour}
                                                    {assign var=title_category value=$lstCatTour[j].title}
                                                    <li><a  title="{$title_category}" href="{$clsTourCategory->getLink($lstCatTour[j].tourcat_id,$lstCatTour[i])}">{$title_category} </a></li>
                                                {/section}
                                            </ul>
                                        {/if}
                                    {/if}
                                </li>
                                <li class="relative subMenu">
                                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Other Product')}" role=link aria-disabled=true>{$core->get_Lang('Other Product')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu dropdown_hotel nav_menu_child" role="menu">
                                        <li class="menuhover subMenu"><a href="javascript:void(0);" title="{$core->get_Lang('Stay')}">{$core->get_Lang('Stay')}</a>
                                            <ul class="sub_dropdown-menu" role="menu">
                                                {section name=i loop=$lstCountryHotel}
                                                    {assign var=country_hotel_title value=$lstCountryHotel[i].title}
                                                    <li><a href="{$clsCountryEx->getLink($lstCountryHotel[i].country_id,'Hotel',$lstCountryHotel[i])}" title="{$country_hotel_title}" >{$country_hotel_title}</a></li>
                                                {/section}
                                            </ul>

                                        </li>
                                        <li class="menuhover"><a href="javascript:void(0);" title="{$core->get_Lang('Cruise')}">{$core->get_Lang('Cruise')}</a>
                                            {if $lstCruiseCat}
                                                <ul class="sub_dropdown-menu" role="menu">
                                                    {section name=i loop=$lstCruiseCat}
                                                        {assign var=_cruisecat_id value=$lstCruiseCat[i].cruise_cat_id}
                                                        {assign var=title_cruisecat value=$lstCruiseCat[i].title}
                                                        {assign var=link_cruisecat value=$clsCruiseCat->getLink($_cruisecat_id,$lstCruiseCat[i])}
                                                        {if $clsISO->getCheckActiveModulePackage($package_id,'cruise','cruise_sub_category','customize')}
                                                            {assign var=childCat value=$clsCruiseCat->getMenuChild($_cruisecat_id)}

                                                            <li class="subMenu"><a href="{$link_cruisecat}" title="{$title_cruisecat}">{$title_cruisecat} {if $childCat}<i class="fr fa fa-angle-right" aria-hidden="true"></i>{/if}</a>
                                                                {$childCat}

                                                            </li>
                                                        {else}
                                                            <li class="subMenu"><a href="{$link_cruisecat}" title="{$title_cruisecat}">{$title_cruisecat}</a>
                                                            </li>
                                                        {/if}
                                                    {/section}
                                                </ul>
                                            {/if}
                                        </li>

                                        <li class="menuhover"><a href="{$clsISO->getLink('voucher')}" title="{$core->get_Lang('Voucher')}">{$core->get_Lang('Voucher')}</a></li>
                                    </ul>
                                </li>
                            {else}
                                <li class="relative">
                                    <a href="{$clsISO->getLink('search_tour')}" title="{$core->get_Lang('Our')}" class="color_1c1c1c"> {$core->get_Lang('Our')}</a>
                                </li>
                                <li class="relative subMenu">
                                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Travel Styles')}" role=link aria-disabled=true>{$core->get_Lang('Travel Styles')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu dropdown_hotel nav_menu_child" role="menu">
                                        {section name=i loop=$lstCatTour}
                                            {assign var = title_category value = $lstCatTour[i].title}
                                            <li class="menuhover"><a href="{$clsTourCategory->getLink($lstCatTour[i].tourcat_id,$lstCatTour[i])}" title="{$title_category}">{$title_category}</a></li>
                                        {/section}
                                    </ul>
                                </li>
                                <li class="relative">
                                    <a href="{$clsISO->getLink('tailor')}" title="{$core->get_Lang('Tailor made tour')}"> {$core->get_Lang('Tailor made tour')}</a>
                                </li>
                                <li class="relative">
                                    <a href="{$clsISO->getLink('service')}" title="{$core->get_Lang('Services')}" class="color_1c1c1c"> {$core->get_Lang('Services')}</a>
                                </li>
                            {/if}
                            {*{if $lstCountryHotel}
                                <li class="relative subMenu hotel_hover">
                                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Hotels')}" role=link aria-disabled=true>{$core->get_Lang('Hotels')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu dropdown_destination nav_menu_child" role="menu">
                                        {section name=i loop=$lstCountryHotel}
                                        {assign var=country_hotel_title value=$clsCountryEx->getTitle($lstCountryHotel[i].country_id)}
                                        <li><a href="{$clsCountryEx->getLink($lstCountryHotel[i].country_id,'Hotel')}" title="{$country_hotel_title}" >{$country_hotel_title}</a></li>
                                        {/section}
                                    </ul>
                                </li>
                                {/if}
                                {if $lstCruiseCat}
                                <li class="relative subMenu">
                                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" title="{$core->get_Lang('Cruises')}" role=link aria-disabled=true>{$core->get_Lang('Cruises')} <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu dropdown_cruisecat nav_menu_child" role="menu">
                                        {section name=i loop=$lstCruiseCat}
                                        {assign var=_cruisecat_id value=$lstCruiseCat[i].cruise_cat_id}
                                        {assign var=title_cruisecat value=$clsCruiseCat->getTitle($_cruisecat_id)}
                                        {if $clsISO->getCheckActiveModulePackage($package_id,'cruise','cruise_sub_category','customize')}
                                        {assign var=childCat value=$clsCruiseCat->getMenuChild($_cruisecat_id)}

                                        <li class="subMenu"><a href="{$clsCruiseCat->getLink($_cruisecat_id)}" title="{$title_cruisecat}">{$title_cruisecat} {if $childCat}<i class="fr fa fa-angle-right" aria-hidden="true"></i>{/if}</a>
                                            {$childCat}

                                        </li>
                                        {else}
                                        <li class="subMenu"><a href="{$clsCruiseCat->getLink($_cruisecat_id)}" title="{$title_cruisecat}">{$title_cruisecat}</a>
                                        </li>
                                        {/if}
                                        {/section}
                                    </ul>
                                </li>
                                {/if}

                                {if $clsISO->getCheckActiveModulePackage($package_id,'voucher','default','default')}
                                <li class="last-child">
                                    <a href="{$clsISO->getLink('voucher')}" title="{$core->get_Lang('Voucher Ticket')}" class="color_1c1c1c"> {$core->get_Lang('Voucher Ticket')}</a>
                                </li>
                                {else}
                                <li class="last-child"><a  href="{$clsISO->getLink('contact')}" title="{$core->get_Lang('Contact')}">{$core->get_Lang('Contact')}</a></li>
                                {/if}*}

                            <li class="relative">
                                <a href="{$clsISO->getLink('news')}" title="{$core->get_Lang('Experience')}" class="color_1c1c1c"> {$core->get_Lang('Experience')}</a>
                            </li>

                            <li class="relative">
                                <a href="{$clsISO->getLink('blog')}" title="{$core->get_Lang('Blog')}" class="color_1c1c1c"> {$core->get_Lang('Blog')}</a>
                            </li>
                            {if $package_id==3 || $package_id==4}
                                <li class="menu_promotion">
                                    <a href="{$clsISO->getLink('promotion')}" title="{$core->get_Lang('Promotion')}" class="color_1c1c1c"> {$core->get_Lang('Promotion')}</a>
                                </li>
                            {/if}
                        </ul>
                    {/if}

				</nav>
			</div>
		</div>
	</div>
	{else}
	<div class="header__mobile block1024" style="display: none">
		{$core->getBlock('menuMobile')}
	</div>
	{/if}
</header>
{/if}
{/if}
{literal}

<script>
	function openCountry(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the link that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
$(".subMenuCat").hover(
  function () {
	  var itemf = $('.dropdown-menu .nav .tablinks').length;
	$('.dropdown-menu .nav .tablinks').each(function(index){ // nested class from activator class
		if (index === 0) {
			// this is the first one
			$(this).addClass('active'); // add class in first item
			$('.dropdown-menu .nav .tablinks .tabcontent').css("display","none");
			$('.dropdown-menu .nav .tablinks.active .tabcontent').css("display","block");
			$('.dropdown-menu .nav .tablinks.active .tabcontent li').css("z-index","1");
		}
	});
    $(this).addClass('open');
  },
  function () {
    $(this).removeClass("open");
	  $('.dropdown-menu .nav .tablinks.active').removeClass('active');
  }
);
    document.querySelectorAll('.dropdown-menu').forEach(function(element){
        element.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    })

</script>
{/literal}
{literal}
<script>
$(function (){
	var fixed_box_scroll = $("#header");
	var fixed_box_scrollMenu = $(".tabskVoucher");
	var fixed_box_scrollMenuTabs = $(".tabskTour");
	var sm_menu_ham= $("#sm_menu_ham");
    var $ww = $(window).width();
	$(window).scroll(function(){
		if ($(window).scrollTop() >= 30) {
			fixed_box_scroll.addClass("fixed_header");
			if($ww > 992){
			fixed_box_scrollMenu.addClass("fixed_Menu");
			}
			fixed_box_scrollMenuTabs.addClass("fixed_MenuTour");
			sm_menu_ham.addClass("fixed_header");
		} else {
			fixed_box_scroll.removeClass("fixed_header");
			if($ww > 992){
			fixed_box_scrollMenu.removeClass("fixed_Menu");
			}
			fixed_box_scrollMenuTabs.removeClass("fixed_MenuTour");
			sm_menu_ham.removeClass("fixed_header");

		}
	});
});
lastScroll = 0;
var $ww = $(window).width();
$(window).on('scroll',function() {
	var scroll = $(window).scrollTop();
	if(lastScroll - scroll < 0 && $(window).scrollTop() >= 300) {
		$('body').removeClass('slideDown').addClass('slideUp');
		$(".fixed_header").slideUp(0);
	} else {
		$('body').removeClass('slideUp').addClass('slideDown');
		$(".fixed_header").slideDown(0);
	}
	if(lastScroll - scroll < 0 && $(window).scrollTop() >= 500) {
		$(".fixed_Menu").slideUp(0);
	} else {
		$(".fixed_Menu").slideDown(0);
	}
	lastScroll = scroll;
});
</script>
{/literal}
{else}
{$core->getBlock('box_header_en')}
{/if}


{$core->getBlock('script_application_ld_json')}