{assign var=title_blog value=$clsBlog->getTitle($blog_id,$blogItem)}
{assign var=publish_date value=$blogItem.publish_date|date_format:"%d %b, %Y"}
{assign var=upd_date value=$blogItem.upd_date|date_format:"%d %b, %Y"}
{assign var=author value=$blogItem.author}
{assign var=imgBlog value=$clsBlog->getImage($blog_id,1034,861,$blogItem)}
{assign var=listTag value=$clsBlog->getListTag($blog_id,$blogItem)}
{assign var=cateBlog value=$clsBlogCategory->getTitle($cat_id,$blogItem)}

{assign var=cateBlogSlug value=$clsBlogCategory->getSlug($cat_id)}

{assign var=regionBlog value=$clsCountryEx->getTitle($country_id)}


{literal}
<script type="application/ld+json">
    {
        "@context": "https://schema.org/",
        "@type": "BlogPosting",
        "@id": "{/literal}{$DOMAIN_NAME}{$curl}{literal}#BlogPosting",
    "mainEntityOfPage": "{/literal}{$DOMAIN_NAME}{$curl}{literal}",
    "headline": "{/literal}{$title_blog}{literal}",
    "name": "{/literal}{$title_blog}{literal}",
    "description": "{/literal}{$description_page}{literal}",
    "datePublished": "{/literal}{$publish_date}{literal}",
    "dateModified": "{/literal}{$upd_date}{literal}",
    "author": {
		"@type": "Person",
		"name": "{/literal}{$author}{literal}"
	},
    "publisher": {
		"@type": "Organization",
		"@id": "{/literal}{$DOMAIN_NAME}{literal}",
		"name": "VietISO Company",
		"logo": {
			"@type": "ImageObject",
			"@id": "{/literal}{$DOMAIN_NAME}/uploads/logo/logo_footer_new.png{literal}",
			"url": "{/literal}{$DOMAIN_NAME}/uploads/logo/logo_footer_new.png{literal}",
			"width": "98",
			"height": "47"
		}
	},
    "image": {
        "@type": "ImageObject",
        "@id": "{/literal}{$DOMAIN_NAME}{$imgBlog}{literal}",
		"url": "{/literal}{$DOMAIN_NAME}{$imgBlog}{literal}",
        "height": "535",
        "width": "800"
    },
    "url": "{/literal}{$DOMAIN_NAME}{$curl}{literal}",
    "isPartOf": {
        "@type" : "Blog",
         "@id": "{/literal}{$DOMAIN_NAME}{$clsISO->getLink('blog')}{literal}",
         "name": "{/literal}{$core->get_Lang('Blog')}{literal}",
         "publisher": {
             "@type": "Organization",
             "@id": "{/literal}{$DOMAIN_NAME}{literal}",
             "name": "VietISO Company"
         }
     }
    {/literal}{if $listTag}{literal},"keywords": {/literal}{$listTag|@json_encode}{literal}{/literal}{/if}{literal}
    }
</script>
{/literal}



<section name ="intro_detailblog">
	    <div class="detail_top_box">

        <div class="d-flex">

            <div class="col-photo">

                <img src="{$imgBlog}" width="1034" height="861" alt="{$title_blog}" />

            </div>

            <div class="col-text">

                <div class="blog_info">

                    <p class="country_cat"><a href="/blog/{$regionBlog}" title="{$regionBlog}">{$regionBlog}</a> | <a href="/blog?blogcat_id={$lstBlogCat[i].blogcat_id}" title="{$lstBlogCat[i].title}">{$cateBlog}</a></p>

                    <h1 class="title text3line">{$title_blog}</h1>

                    <div class="intro text5line">

                    {$clsBlog->getIntro($blog_id)|@html_entity_decode}

                    </div>

                    <div lang="publish_author submitted">

                        <span class="publish_date mgr10">
							<i class="fa-regular fa-clock-three" style="color: #ffffff;"></i>{$publish_date}
						</span>
						
                        <span class="author">
							<i class="fa-solid fa-user" style="color: #ffffff;"></i>{$author}
						</span>


                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<section class="listblogdetail_breadcrumb">
    <div class="breadcrumb_list">
        <div class="container">
            <div class="breadcrumb">
                <h2 class="txt_youarehere">You are here:</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{PCMS_URL}" title="{$core->get_Lang('Home')}">Home</a></li>
                    <li class="breadcrumb-item"><a href="{PCMS_URL}blog" title="{$core->get_Lang('Blog')}">Blog</a></li>
                    <li class="breadcrumb-item"><a href="{PCMS_URL}blog/{$regionBlog}" title="{$regionBlog}">{$regionBlog}</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">{$title_blog}</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<section class="detail_blog">
    <div class="container">
        <div class="row">
            <div class="detail_blog_item col-sm-9">
                <div class="item_blogdetail">
                    <div class="content_blog">
                        {$blogItem.content}

                    </div>

                    <div class="txt_ico_share_star">
                        <div class="txt_ico_share">
                            <div class="share-content">
                                <p class="txtshare">Share</p>
                                <div class="social-icon-share-blog">
								<div class="sharethis-inline-share-buttons" data-image="{$DOMAIN_NAME}{$clsISO->getPageImageShare($blog_id,'Blog',$blogItem)}" data-url="{$DOMAIN_NAME}{$curl}" data-title="{$title_blog}"></div>
								<script type="text/javascript" src="{$URL_JS}/jquery.sharer.js?v={$up_version}"></script>
								{assign var=link_share value=$curl}
								{assign var=title_share value=$title_blog}
								{$clsISO->getBlock('box_share',["link_share"=>$link_share,"title_share"=>$title_share])}
							</div>

                            </div>
                        </div>
                        <div class="rating-and-votes">
                            <div class="star-icons">
                             <div class="rating" style="width: 20rem">
							<input id="rating-5" type="radio" name="rating" value="5"/><label for="rating-5"><i class="fa-solid fa-star fa-xl"></i></label>
							<input id="rating-4" type="radio" name="rating" value="4" checked /><label for="rating-4"><i class="fa-solid fa-star fa-xl"></i></label>
							<input id="rating-3" type="radio" name="rating" value="3"/><label for="rating-3"><i class="fa-solid fa-star fa-xl"></i></label>
							<input id="rating-2" type="radio" name="rating" value="2"/><label for="rating-2"><i class="fa-solid fa-star fa-xl"></i></label>
							<input id="rating-1" type="radio" name="rating" value="1"/><label for="rating-1"><i class="fa-solid fa-star fa-xl"></i></label>
						</div>
								
                            </div>
                            <span class="vote-count">| 2 voted</span>
                        </div>
                    </div>

                    <div class="tag_blog">
                        <p class="txt_tags">Tags:</p>
                        <div class="tags_">
							{$listTag}
                        </div>
                    </div>

                    <div class="comment_box mtm mt30 w-100">
                        <div class="fb-comments" data-href="{$PCMS_URL}{$clsBlog->getLink($blog_id,$blogItem)}"
                             data-width="100%" data-numposts="5" data-colorscheme="light"></div>
                    </div>

                </div>

            </div>

            <div class="col-sm-3">
                <div class="list_search_filter">
			<form class="form_search form_box_search" id="countryForm" method="POST" action="">
						 <input type="hidden" name="action" value="search">
                        <div class="search-item d-none d-sm-flex mb-3">
                            <button class="search-item-icon" type="submit">
                                <i class="fa-regular fa-magnifying-glass"></i>
                            </button>
                            <div class="search-item-txt">
								<input type="hidden" name="action" value="search">
                                <input type="text" name="keyword" 
                                       value="{$keyword}" autocomplete="off" class="border-0 input-search text-dark"  maxlength="255" placeholder="{$core->get_Lang('Search')}">
								<input type="hidden" name="search_blog" value="search_blog">

                            </div>
                        </div>

                        <div class="filter-articles">
                            <h3 class="list_fiter_articles">Filter Articles</h3>
                            <div class="filter-radio2">
								{section name=i loop=$listCountry}
								<div class="form-check2">
									<a href="/blog/{$listCountry[i].slug}" title="{$listCountry[i].title}">
                    <label class="form-check-label custom-control-label {if $country_id eq $listCountry[i].country_id}active{/if}"  for="country_id_{$listCountry[i].country_id}">
									   {$listCountry[i].title}
									</label>
										</a>
								</div>
								{/section}

							</div>

                            <div class="filter-checkbox2">
							{section name=i loop=$lstBlogCat}

                                <div class="form-check2">
									<a href="/blog?blogcat_id={$lstBlogCat[i].blogcat_id}" title="{$lstBlogCat[i].title}">
                  			 <label class="form-check-label custom-control-label {if $cat_id eq $lstBlogCat[i].blogcat_id }active{/if}" for="blogcat_id_{$lstBlogCat[i].blogcat_id}">{$lstBlogCat[i].title}</label>
									</a>
                                </div>
								{/section}

                                <a class="view-more2" id="viewMore">View more</a>
                                <button id="hideCities" style="display:none;">Hide Cities</button>

                            </div>

                        </div>
                    </form>
                    <div class="featured-blogs">
                        <h2 class="txt_featureblog">FEATURED BLOG</h2>
                        {section name=i loop=$lstFeatureBlog}
                        <div class="row featured-blog">
                            <div class="col-lg-4 overflow-hidden">
								<div class="bloglastest">
                                <a href="{$clsBlog->getLink($lstFeatureBlog[i].blog_id)}">
									<div class="featuredblog-img overflow-hidden">
									<img class="img_featureblog" src="{$clsBlog->getImage($lstFeatureBlog[i].blog_id, 83, 83)}"
                                                 alt="featured-blog"/></a>
									</div>
                            </div>
							</div>
                            <h3 class="col-lg-7 mt-log-0 txt_featuredblogs">
                                <a href="{$clsBlog->getLink($lstFeatureBlog[i].blog_id)}">{$lstFeatureBlog[i].title}</a></h3>

                        </div>
                        {/section}
                    </div>


                        <hr style="margin-bottom: 32px; margin-top: 32px">

                        <div class="related_tours">
                            <h2 class="txt_featureblog">RELATED TOURS</h2>
							 {section name=i loop=$lstRelatedTour}
                            <div class="list_viewtour">
                                <div class="img_toursrelated">
									<div class="bloglastest">
                                    <a href="{$clsTour->getLink($lstRelatedTour[i].tour_id)}" alt="tour" title="tour">
										<div class="img_relatedtour">
                                        <img src="{$clsTour->getImage($lstRelatedTour[i].tour_id, 296, 200)}" alt="Pic_relatedtour">
										</div>
                                </div>
									</div>
                                <div class="txt_des_tour">
                                    <h3 class="txth_relatedtour">{$clsTour->getTitle($lstRelatedTour[i].tour_id)}</h3>
                                    </a>
                                    <div class="d-flex align-items-center score_reviewtour">
                                        <span class="border_score">9.9</span>
                                        <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <i class="fa-light fa-location-dot" style="color: #43485c;"></i> <span
                                                class="txt_placetours">Place: Hanoi – Halong – Hue – Hoian</span> <span
                                                class="border_place">+2</span>
                                    </div>

                                    <p>{$clsTour->getIntro($lstRelatedTour[i].tour_id)}</p>
                                    <div class="d-flex justify-content-between align-items-center" style="margin-bottom: 24px">
                                        <div class="from_price">
                                            <p class="from_txtp">From</p>
                                            <span class="txt_price">US
												<h3 class="txt_numbprice"> $650</h3>
												</span>
                                        </div>

                                        <a href="{$clsTour->getLink($lstRelatedTour[i].tour_id)}" alt="tour" title="tour">
                                            <button class="btn btn_viewtour">View Tour <i
                                                        class="fa-regular fa-arrow-right" style="color: #ffffff;"></i>
                                            </button>
                                        </a>
                                    </div>
                                </div>
							{/section}

                            </div>


                            <div class="border_exploremore">
									  {if !$country_id}
									<img src="{$clsConfiguration->getImage('site_blog_banner', 296, 152)}" width="296" height="152" alt="{$clsCountryEx->getBlogTitle($country_id)}" style="border-radius: 8px">
								{else}
									<img src="{$clsCountryEx->getBlogImage($country_id, 296, 152)}" width="296" height="152" alt="{$clsCountryEx->getBlogTitle($country_id)}" style="border-radius: 8px">
								{/if}
                                <div class="txt_exploremore">
                                    <p class="tour_exploretxt">Explore more Vietnam tours</p></div>
								<div class="btn_exploremore">
                                <a href="/tour/{$regionBlog}" alt="tour" title="tour">

                                    <button class="btn btn_seealltour">See all tours <i
                                                class="fa-regular fa-arrow-right" style="color: #ffffff;"></i></button>
                                </a>
									</div>
                            </div>

                        </div>


                    </div>

</section>

<section class="read_blognext">
    <div class="container">
        <h2 class="txt_readblog">{$core->get_Lang('Read the next')}</h2>
        <div class="pic_textread">
			<div class="row">
			<div class="col-lg-12 col-md-12">
				
				            {assign var=title_blog_relate value=$clsBlog->getTitle($lstRelated[0].blog_id,$lstRelated[0])}

                            {assign var=link_blog_relate value=$clsBlog->getLink($lstRelated[0].blog_id,$lstRelated[0])}

                            {assign var=title_country_0 value=$clsCountryEx->getTitle($lstRelated[0].country_id)}

                            {assign var=title_cat_0 value=$clsBlogCategory->getTitle($lstRelated[0].cat_id)}
				
				<div class="related_top">
            <div class="blog_related_item">
                <a class="photo" href="{$link_blog_relate}" alt="explore" title="{$title_blog_relate}" style="overflow: hidden; border-radius: 8px">
					<div class="img_relatedtour">
                  <img class="d-xl-block d-none" src="{$clsBlog->getImage($lstRelated[0].blog_id,752,487,$lstRelated[0])}" width="752" height="487" alt="{$title_blog_relate}"/>

					</div>
                </a>
            <div class="body_txtreadblog">
                <div class="txt_categoryblog">
                    <p class="txt_cateblog"><a href="/blog/{$cateBlogSlug}" title="{$cateBlog}">{$title_cat_0}</a></p>
                    <a href="{$link_blog_relate}" alt="explore" title="{$title_blog_relate}">
                        <h3 class="txthigh_cateblog">{$title_blog_relate}</a>
						</h3>

                    <p class="txtdes_cateblog">{$clsBlog->getIntro($lstRelated[0].blog_id,$lstRelated[0])|strip_tags}</p>
                </div>
            </div>
					</div>
        </div>
			</div>
			
			{section name=i loop=$lstRelated start=1}

                        {assign var=title_blog_relate value=$clsBlog->getTitle($lstRelated[i].blog_id,$lstRelated[i])}

                        {assign var=link_blog_relate value=$clsBlog->getLink($lstRelated[i].blog_id,$lstRelated[i])}

                        {assign var=title_country_relate value=$clsCountryEx->getTitle($lstRelated[i].country_id)}

                        {assign var=title_cat_relate value=$clsBlogCategory->getTitle($lstRelated[i].cat_id)}
			
            <div class="col-lg-4 col-md-4">
				<div class="list_readthenextitem">
				<div class="img_relatedtour overflow-hidden" style="border-radius: 8px">
					<a class="photo" href="{$link_blog_relate}" title="{$title_blog_relate}">
					<div class="img_relatedtour">
                <img src="{$clsBlog->getImage($lstRelated[i].blog_id,144,145,$lstRelated[i])}" style="width: 144px; height: 145px">
					</a>
					</div>
					</div>
					
                <div class="text-content">
                    <p class="txt_cateblog"><a href="/blog/{$cateBlogSlug}" title="{$cateBlog}">{$cateBlog}</p></a>
                    <h3 class="txthigh_cateblog_"><a class="text2line" href="{$link_blog_relate}" title="{$title_blog_relate}">{$title_blog_relate}</a>
					</h3>
                </div>
            </div>
			</div>
			{/section}
			</div>
    </div>


    </div>

</section>
		
{if $lstBlogRecent}
<section class="recentlyview">
    <div class="container">
        <h2 class="title-recently-view">Recently viewed</h2>
        <div class="row blog-recently-view" style="margin-bottom:120px">
            {section name=i loop=$lstBlogRecent}
            <div class="col-sm-3">
                <div class="blog-item-recently">
                    <div class="bloglastest">
                        <a href="{$clsBlog->getLink($lstBlogRecent[i].blog_id)}" class="text-decoration-none">
                            <div class="img-blogrecently">
                                <img class="img-blog" src="{$clsBlog->getImage($lstBlogRecent[i].blog_id, 296, 193)}" alt="image-recent">
                        </a>
                    </div>
                </div>
                <h2 class="txt_recently">
                    <a href="{$clsBlog->getLink($lstBlogRecent[i].blog_id)}">{$lstBlogRecent[i].title}</a>
                </h2>
                <div class="recently-view-content">
                    <div class="txt_recentlyview">{$clsISO->limit_textIso($clsBlog->getIntro($lstBlogRecent[i].blog_id), 18)}</div>
                </div>
                <p class="date-time">
                    <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> {$lstBlogRecent[i].publish_date|date_format:"%d %b, %Y"} | {$clsBlogCategory->getTitle($lstBlogRecent[i].cat_id)}
                </p>
            </div>
        </div>
            {/section}
        </div>
    </div>
</section>
    {/if}
	
	<style>

	</style>

{literal}
    <script>
		
		document.addEventListener('DOMContentLoaded', () => {
	  const viewMoreLink = document.getElementById('viewMore');
	  const cityCheckboxes = document.querySelectorAll('.filter-checkbox2 > .form-check2');

	  const maxVisibleCheckboxes = 5;
	  let isExpanded = false;

  function updateViewMore() {
    const visibleCheckboxes = cityCheckboxes.length;

    if (visibleCheckboxes > maxVisibleCheckboxes) { // Kiểm tra xem có nhiều hơn 5 checkbox
      viewMoreLink.style.display = 'block';         // Hiển thị nút nếu có nhiều hơn 5
      viewMoreLink.textContent = isExpanded ? "View less" : "View more";
      viewMoreLink.classList.remove('disabled');
    } else {
      viewMoreLink.style.display = 'none';          // Ẩn nút nếu có 5 hoặc ít hơn
      isExpanded = false;                           // Đặt lại trạng thái isExpanded 
      cityCheckboxes.forEach(checkbox => {         // Đảm bảo tất cả checkbox được hiển thị
        checkbox.style.display = 'block';
      });
    }
  }
			cityCheckboxes.forEach((checkbox, index) => {
      if (index >= maxVisibleCheckboxes) {
        checkbox.style.display = isExpanded ? 'block' : 'none';
      } else {
        checkbox.style.display = 'block'; // Hiển thị 5 checkbox đầu tiên
      }
    });
  

	  viewMoreLink.addEventListener("click", () => {
		isExpanded = !isExpanded;
		cityCheckboxes.forEach((checkbox, index) => {
		  if (index >= maxVisibleCheckboxes) {
			checkbox.style.display = isExpanded ? 'block' : 'none';
		  }
		});
		updateViewMore();
	  });
			
			cityCheckboxes.forEach((checkbox, index) => {
    if (index >= maxVisibleCheckboxes) {
      checkbox.style.display = 'none'; // Ẩn các checkbox vượt quá giới hạn ban đầu
    }
  });

	  updateViewMore(); // Gọi hàm khi trang tải xong để cập nhật trạng thái ban đầu
	});
		
		document.addEventListener('DOMContentLoaded', (event) => {
    const beachbreakLink = document.getElementById('beachbreak-link');
    beachbreakLink.textContent = '#' + beachbreakLink.textContent;
});
		


    </script>
{/literal}
<link rel="stylesheet" href="{$URL_JS}/zoom/zoom.css?v={$upd_version}"/>
<script src="{$URL_JS}/zoom/zoom.js?v={$upd_version}"></script>