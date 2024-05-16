<div class="page_container">
    <div class="banner">
    	{if $show eq 'City'}
			<img src="{$clsCity->getImageBannerHotel($city_id,1600,500,$oneItem)}" class="img100" alt="{$core->get_Lang('Hotels in')} {$TD}" />
		{else}
			<img src="{$clsCountryEx->getImageBannerHotel($country_id,1600,500,$oneItem)}" class="img100" alt="{$core->get_Lang('Hotels in')} {$TD}" />
		{/if}
		{$core->getBlock('box_form_search_hotel')}
    </div>
    <nav class="">
        <div class="container">
            <ul class="breadcrumb-nav" itemscope itemtype="https://schema.org/BreadcrumbList">
                <li class="breadcrumb-nav-first">{$core->get_Lang('You are here')}</li>
                <li class="breadcrumb-nav-list">
                    <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <a itemprop="item" href="{$PCMS_URL}" title="{$core->get_Lang('Home')}">
                        <span itemprop="name" class="breadcrumb-activeItem">{$core->get_Lang('Home')}</span></a>
                        <meta itemprop="position" content="1" />
                        <img style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/arow.svg" alt="error">
                    </div>
                    <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                        <a itemprop="item" href="{$clsISO->getLink('hotel')}" title="{$core->get_Lang('Hotels')}">
                            <span itemprop="name" class="breadcrumb-activeItem">{$core->get_Lang('Hotels')}</span></a>
                            <meta itemprop="position" content="2" />
                            <img style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/arow.svg" alt="error">
                    </div>
                    <div itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="active">
                        <a itemprop="item" href="{$curl}" title="{$TD}">
                            <span itemprop="name" class="breadcrumb-item">{$TD}</span></a>
                        <meta itemprop="position" content="3" />
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div id="contentPage" class="hotelPlacePage pdt40">
        <div class="container">
			{* <h1>{$core->get_Lang('Hotels in')} {$TD}</h1>
			<div class="intro_top short_content" data-height="150">
				{$HOTEL_INTRO}
			</div> *}
        	<div class="list-hotel-item">
				{* <h2 class="result_search">{$core->get_Lang('Find')} {$totalRecord} {$core->get_Lang('accommodations')}</h2> *}
                <div class="filter-hotel-item">
                    <h2 class="result_search">{$core->get_Lang('Sort & filter')}</h2>
                    {* <div class="block991" style="display:none">
                        <div class="tag-search">
                            <div class="btn_open_modal btn_quick_search bg_main" data-bs-toggle="modal"
                                 data-bs-target="#filter_search">
                                <span>{$core->get_Lang('Filter Trip')}</span> <i class="fa fa-sliders" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div> *}

                    <div class="modal fade" id="filter_search" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="filter_left">
                                    <div class="modal-header">
                                        <h2>
                                            <button type="button" class="close" data-bs-dismiss="modal">
                                                <span aria-hidden="true">X</span>
                                                <span class="sr-only">{$core->get_Lang('Close')}</span>
                                            </button> {$core->get_Lang('Search')}
                                        </h2>
                                    </div>
                                    <div class="modal-body">
                                        {$core->getBlock('filter_left_search_hotel')}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

				</div>
				<div class="item-hotel-list">
                    <h2 class="head-title-hotel">{$TD}: <span>{$core->get_Lang('Find')} {$totalRecord} {$core->get_Lang('accommodations')}</span></h2>
					{* <div class="intro_top short_content" data-height="100">
                        {$HOTEL_INTRO}
                    </div> *}
                    <div class="intro_top short_content content-hotelss-txt" data-height="150">
                        {$clsConfiguration->getValue($site_hotel_intro)|html_entity_decode}
                    </div>
                    {assign var=totalHotel value=$listHotelPlace|@count}
                    <div class="box-hotel-style">
					{section name=i loop=$listHotelPlace}
					{assign var = hotel_id value = $listHotelPlace[i].hotel_id}
					{assign var = arrHotel value = $listHotelPlace[i]}
						{$clsISO->getBlock('box_hotel_item',["hotel_id"=>$hotel_id,"arrHotel"=>$arrHotel])}
					{/section}
                    </div>
					{if $totalPage gt '1'}
						<div class="pagination pager">
							{$page_view}
						</div>
					{/if}

                    <h2 class="recentlyViewed">{$core->get_Lang('Recently viewed')}</h2>
                    <div class="clicked-details"></div>
                    <button class="btnShowViewed">{$core->get_Lang('More')}</button>
                    <button class="btnNoneViewed">{$core->get_Lang('Collapse all')}</button>
				</div>


            </div>
        </div>


        <h2 class="reviewViewed">{$core->get_Lang('Reviews')}</h2>
        {assign var=totalHotel value=$listHotel|@count}
        <div class="reviewViewed-list">
            <div class="images-slide owl-carousel_overview owl-carousel ">
                {section name=i loop=$allTestimonial}
                    {$allTestimonial[i]}
                    <div class="reviewViewed-items">
                        {assign var = getImageStar value = $clsHotel->getHotelStar($allTestimonial[i].hotel_id)}
                        <a class="photo" href="{$allTestimonial[i].link}" title="{$allTestimonial[i].title}">
                            <img class="img-responsive img100" id="images"
                                src="{$clsHotel->getImage($allTestimonial[i].hotel_id, 405, 326)}"
                                alt="{$allTestimonial[i].title}" />
                        </a>
                        <div class="reviewViewed-content">
                            {if $getImageStar != null}
                                <img class="star" height="19" src="{$getImageStar}" alt="star" style="width: auto" />
                            {/if}
                            <h3 class="reviewViewed-content_title">
                                <a title="{$allTestimonial[i].title}" href="{$allTestimonial[i].link}">{$allTestimonial[i].title}</a>
                            </h3>
                            <p class="reviewViewed-content_txt">{$allTestimonial[i].address}</p>
                            <div class="reviewViewed-user">
                                <img class="img-responsive img100" id="user-icon"
                                    src="{$clsHotel->getImage($allTestimonial[i].hotel_id, 48, 48)}"
                                    alt="{$allTestimonial[i].title}" />
                                <div class="reviewViewed-info_user">
                                    <h4>{$allTestimonial[i].title}</h4>
                                    <p>{$allTestimonial[i].title}</p>
                                </div>
                            </div>
                        </div>
                    </div>
    
                {/section}
            </div>
        </div>

    <div class="attractions">
        {$core->getBlock('top_attraction')}
    </div>

    </div>
    <div class="alsoLike">
        {$core->getBlock('alsoLike_hotel')}
    </div>
</div>

</div>
<script type="text/javascript">
	// var $_View_more = '{$core->get_Lang("View more")}';
	// var $_Less_more = '{$core->get_Lang("Less more")}';
	var $Loading = '{$core->get_Lang("Loading")}';
	var selectmonth='{$core->get_Lang("select month")}';
	var $_Expand_all = '{$core->get_Lang("Expand all")}';
	var $_Collapse_all = '{$core->get_Lang("Collapse all")}';
	var $_LANG_ID = '{$_LANG_ID}';
</script>

{literal}
	<script>
		// function toggleShorted(_this, e){
		// 	e.preventDefault();
		// 	if(!$(_this).hasClass('clicked')){
		// 		$(_this).parent('.short_content')
		// 				.css('height','auto')
		// 				.removeClass('shorted')
		// 				.addClass('lessmore');
		// 		$(_this).addClass('clicked').text($_Less_more);
		// 	} else {
		// 		var max_height = $(_this).attr('max_height');
		// 		$(_this).parent('.short_content')
		// 				.css('height',max_height)
		// 				.addClass('shorted')
		// 				.removeClass('lessmore');
		// 		$(_this).removeClass('clicked').text($_View_more);
		// 	}
		// 	return false;
		// }
		// $(function(){
		// 	if($('.short_content').length){
		// 		$('.short_content').each((_i, _elem) => {
		// 			var _max_height = $(_elem).data('height'),
		// 					_origin_height = $(_elem).outerHeight(false);
		// 			if(parseInt(_max_height) < _origin_height){
		// 				$(_elem)
		// 						.height(_max_height)
		// 						.addClass('shorted')
		// 						.append('<a class="more" max_height="'+_max_height+'" onClick="toggleShorted(this,event)">'+$_View_more+'</a>');
		// 			}
		// 		});
		// 	}
		// });
	</script>
{/literal}
<script src="{$URL_JS}/jquery.countdown.min.js?v={$upd_version}"></script>
<script src="{$URL_JS}/jquery-confirm.min.js?v={$upd_version}"></script>
