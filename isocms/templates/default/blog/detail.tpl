{assign var=title_blog value=$clsBlog->getTitle($blog_id,$blogItem)}
{assign var=publish_date value=$blogItem.publish_date|date_format:"%d %b, %Y"}
{assign var=upd_date value=$blogItem.upd_date|date_format:"%d %b, %Y"}
{assign var=author value=$blogItem.author}
{assign var=imgBlog value=$clsBlog->getImage($blog_id,800,535,$blogItem)}
{assign var=listTag value=$clsBlog->getArrayTag($blog_id,$blogItem)}
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
				<img src="{$imgBlog}" width="1034" height="861" alt="{$title_blog}">
			</div>
			<div class="col-text">
				<div class="blog_info">
					<p class="country_cat">
						<a href="/blog/{$regionBlog}" title="{$regionBlog}">{$regionBlog}</a>
						| <a href="/blog/{$cateBlogSlug}" title="{$cateBlog}">{$cateBlog}</a>
					</p>
					<h2 class="title text3line">{$title_blog}</h2>
					<div class="intro text5line">{$clsBlog->getIntro($blog_id)|@html_entity_decode}
					</div>
					<div lang="publish_author submitted">
						<span class="publish_date mgr10">
							<i class="fa-regular fa-clock-three" style="color: #ffffff;"></i>{$upd_date}
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
							 <p class="txt_tag_">{$listTag}</p>
<!--
                            <p class="txt_tag_">#tour</p>
                            <p class="txt_tag_">#food</p>
                            <p class="txt_tag_">#vietasia</p>
-->
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
                    <form action="/blog" method="GET">
                        <div class="search-item d-none d-sm-flex mb-3">
                            <button class="search-item-icon" type="submit">
                                <i class="fa-regular fa-magnifying-glass"></i>
                            </button>
                            <div class="search-item-txt">
                                <input class="border-0 input-search text-dark" type="text"
                                       value="{$data.search|escape:'html'}"
                                       name="search" placeholder="Search"/>
                            </div>
                        </div>

                        <div class="filter-articles">
                            <h3 class="list_fiter_articles">Filter Articles</h3>
                            <div class="filter-radio2">
								{section name=i loop=$listCountry}
    <div class="form-check2">
        <label class="form-check-label custom-control-label">
           {$listCountry[i].title}
        </label>
    </div>
	{/section}

</div>

                            <div class="filter-checkbox2">
							{section name=i loop=$lstBlogCat}

                                <div class="form-check2">
                                    <label class="form-check-label" for="blogcat_id_{$lstBlogCat[i].blogcat_id}">{$lstBlogCat[i].title}</label>
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
                                <img class="img_exploremore" src="{URL_IMAGES}/blog/pic_imglastest9.png">
                                <div class="txt_exploremore">
                                    <p class="tour_exploretxt">Explore more Vietnam tours</p></div>
								<div class="btn_exploremore">
                                <a href="#" alt="tour" title="tour">

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
        <h2 class="txt_readblog">Read the next</h2>
        <div class="pic_textread row">
			<div class="col-xl-12 col-lg-6">
				<div class="related_top">
            <div class="blog_related_item">
                <a href="#" alt="explore" title="explore" style="overflow: hidden; border-radius: 8px">
					<div class="img_relatedtour">
                    <img class="pic_read" src="{$URL_IMAGES}/blog/img_readthenext1.png" alt="pic_txt1"
                         title="explore" width="752" height="487">
					</div>
                </a>
            <div class="body_txtreadblog">
                <div class="txt_categoryblog">
                    <p class="txt_cateblog">TRAVEL TIPS</p>
                    <a href="#" alt="explore" title="explore">
                        <h3 class="txthigh_cateblog">Exploring Bat Trang Ceramic Village In Hanoi: A Signature Craft Of
                            Vietnam.</a></h3>

                    <p class="txtdes_cateblog">If you find yourself stuck in Hanoi and yearn for respite from the
                        bustling city, seeking authenticity and serenity, consider a visit to Bat Trang Village</p>
                </div>
            </div>
					</div>
        </div>
			

        <div class="list_readblog row">
            <div class="col-md-4 item">
				<div class="img_relatedtour">
                <img src="{URL_IMAGES}/blog/img_readthenext2.png" alt="Mô tả ảnh 1" class="img-fluid">
				</div>
                <div class="text-content">
					<a href="#">
                    <p class="txt_cateblog">TRAVEL TIPS</p>
						</a>
					<a href="#" title="tips">
                    <h3 class="txthigh_cateblog_">Top 05 Best Massages And Spas In Hanoi's Old Quarter, Vietnam
					</a>
						</h3>
                </div>
            </div>
            <div class="col-md-4 item">
                <img src="{URL_IMAGES}/blog/img_readthenext3.png" alt="Mô tả ảnh 2" class="img-fluid">
                <div class="text-content">
					<a href="#">
                    <p class="txt_cateblog">TRAVEL TIPS</p>
					</a>
					<a href="#" title="tips">
                    <h3 class="txthigh_cateblog_">Top Best Things To Do In Hanoi For 3 Days
						</a>
						</h3>
                </div>
            </div>
            <div class="col-md-4 item">
                <img src="{URL_IMAGES}/blog/img_readthenext4.png" alt="Mô tả ảnh 3" class="img-fluid">
                <div class="text-content">
					<div class="txt_linkcate">
					<a href="#">
                    <p class="txt_cateblog">TRAVEL TIPS</p>
					</a>
						</div>
					<a href="#" title="tips">
                    <h3 class="txthigh_cateblog_">Top Best Things To Do In Hanoi For 3 Days
						</a>
						</h3>
                </div>
            </div>
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
document.addEventListener('DOMContentLoaded', function () {
  const headerFixed = document.getElementById('header_fixed');
  const headerBot = document.querySelector('.nah_bg_header_bot');

  window.onscroll = function () {
    let currentScrollPos = window.pageYOffset;

    // Chỉ xử lý khi cuộn lên đầu trang
    if (currentScrollPos === 0) {
      // Đặt trực tiếp màu nền cho headerBot
      headerBot.style.backgroundColor = ''; // Xóa màu nền đã đặt trước đó (nếu có)
      headerBot.classList.add('bg-white'); 
    } 
  };
});

    </script>
{/literal}
<link rel="stylesheet" href="{$URL_JS}/zoom/zoom.css?v={$upd_version}"/>
<script src="{$URL_JS}/zoom/zoom.js?v={$upd_version}"></script>