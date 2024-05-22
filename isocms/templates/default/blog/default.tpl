<!--
<div class="page_container">
	<nav class="breadcrumb-main breadcrumb-{$mod} bg_fff">
        <div class="container">
            <ol class="breadcrumb hidden-xs mt0 bg_fff" itemscope itemtype="https://schema.org/BreadcrumbList">
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$PCMS_URL}" title="{$core->get_Lang('Home')}">
						<span itemprop="name" class="reb">{$core->get_Lang('Home')}</span>
					</a>
					<meta itemprop="position" content="1" />
				</li>
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$clsISO->getLink('blog')}" title="{$core->get_Lang('Blog')}">
						<span itemprop="name" class="reb">{$core->get_Lang('Blog')}</span>
					</a>
					<meta itemprop="position" content="2" />
				</li>
				
                <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$clsBlogCategory->getLink($cat_id,$itemCat)}" title="{$itemCat.title}">
						<span itemprop="name" class="reb">{$itemCat.title}</span></a>
					<meta itemprop="position" content="3" />
				</li> 
				
            </ol>
        </div>
    </nav>
-->


{*{assign var=title_blog value=$clsBlog->getTitle($lstBlogs[i].blog_id,$lstBlogs[i])}*}
{*{assign var=link_blog value=$clsBlog->getLink($lstBlogs[i].blog_id,$lstBlogs[i])}*}
{*{assign var=intro_blog value=$clsBlog->getIntro($lstBlogs[i].blog_id, $lstBlogs[i])}*}

{*{assign var=content_blog value=$clsBlog->getContent($lstBlogs[i].blog_id, $lstBlogs[i])}*}

{*{assign var=img_blog value=$clsBlog->getImage($lstBlogs[i].blog_id,296,193,$lstBlog[i])}*}
{*{assign var=img_blog2 value=$clsBlog->getImage($lstBlogs[i].blog_id,624,408,$lstBlog[i])}*}

{*{assign var=slug_blog value=$clsBlog->getSlug($lstBlogs[i].blog_id,$lstBlogs[i])}*}
{*{assign var=date_blog value=$clsBlog->getRegDate($lstBlogs[i].blog_id, $lstBlogs[i])}*}

{*{assign var=cat_blog value=$clsBlogCategory->getTitle($lstBlogCat[i].cat_id, $lstBlogCat[i])}*}

<div class="txt_blogvn">
    <div class="container">
        <h1 class="txt_h1 text-uppercase">BLOG {$clsCountryEx->getTitle($country_id)}</h1>
        <div class="text_pp">{$clsCountryEx->getIntro($country_id)}</div>
    </div>
</div>

<section class="listblog_breadcrumb">
    <div class="breadcrumb_list">
        <div class="container">
            <div class="breadcrumb">
                <h2 class="txt_youarehere">You are here:</h2>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{PCMS_URL}" title="{$core->get_Lang('Home')}">Home</a></li>
                    <li class="breadcrumb-item"><a href="{PCMS_URL}blog" title="{$core->get_Lang('Blog')}">Blog</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{$clsCountryEx->getTitle($country_id)}</li>
                </ol>
            </div>
        </div>
    </div>
</section>

<section class="blog-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-3 blog-left">
                {section name =i loop=$lstBlogLeft}
                    <div class="blog-item">
                        <a class="text-decoration-none"
                           href="{$clsBlog->getLink($lstBlogLeft[i].blog_id,$lstBlogLeft[i])}" title="{$title_blog}">
                            <img class="img-blog" src="{$clsBlog->getImage($lstBlogLeft[i].blog_id, 296, 193)}" alt="{$lstBlogLeft[i].slug}">
                            <h2 class="txt_blogitem">{$lstBlogLeft[i].title}</a>
                        </h2>
                        <div class="blog-item-content">{$clsISO->limit_textIso($clsBlog->getIntro($lstBlogLeft[i].blog_id), 20)}</div>
                        <p class="date-time">
                            <i class="fa-regular fa-clock"
                               style="color: #74C0FC;"></i>{$lstBlogLeft[i].reg_date|date_format:"%d %b, %Y"} |
                            <span>{$clsBlogCategory->getTitle($lstBlogLeft[i].cat_id)}</span>
                        </p>
<!--                        <hr style="margin-bottom: 24px">-->
                    </div>
                {/section}
            </div>

            <div class="col-lg-6 col-sm-6 blog-mid">
                {section name=i loop=$lstBlogCenterTop}
                    <div class="blog-item">
                        <a href="{$clsBlog->getLink($lstBlogCenterTop[i].blog_id)}" class="text-decoration-none"
                           title="{$lstBlogCenterTop[i].title}">
                            <img class="img-blog-mid" src="{$clsBlog->getImage($lstBlogCenterTop[i].blog_id, 624, 408)}" alt="image-blog">
                            <h2 class="blog-item-center">{$lstBlogCenterTop[i].title}
                        </a>
                        </h2>
                        <div class="blog-item-content">{$clsISO->limit_textIso($clsBlog->getIntro($lstBlogCenterTop[i].blog_id), 40)}</div>
                        <p class="date-time">
                            <i class="fa-regular fa-clock"
                               style="color: #74C0FC;"></i> {$lstBlogCenterTop[i].upd_date|date_format:"%d %b, %Y"} |
                            <span>{$clsBlogCategory->getTitle($lstBlogCenterTop[i].cat_id)}</span>
                        </p>
<!--                        <hr style="margin-bottom: 24px">-->
                    </div>
                {/section}
                {section name=i loop=$lstBlogCenterBot}
                    <div class="row blog-item blog-item-center-second card-bodyblog">
                        <div class="col-sm d-flex flex-column" style="gap: 16px">
                            <h2 class="m-0 txt_blogitemmid">
                                <a href="{$clsBlog->getLink($lstBlogCenterBot[i].blog_id)}"
                                   title="{$lstBlogCenterBot[i].slug}">
                                    {$lstBlogCenterBot[i].title}
                                </a>

                            </h2>
                            <div class="blog-item-content">
                                <div class="txtblog_p">{$clsISO->limit_textIso($clsBlog->getIntro($lstBlogCenterBot[i].blog_id), 40)}</div>
                            </div>
                            <p class="date-time">
                                <i class="fa-regular fa-clock"
                                   style="color: #74C0FC;"></i> {$lstBlogCenterBot[i].reg_date|date_format:"%d %b, %Y"}
                                |
                                <span>{$clsBlogCategory->getTitle($lstBlogCenterBot[i].cat_id)}</span>
                            </p>

                        </div>
                        <div class="col-sm">
                            <img class="img-blog mb-3 mb-sm-0" src="{$clsBlog->getImage($lstBlogCenterBot[i].blog_id, 296, 193)}" alt="img">
                        </div>
                    </div>
                {/section}
            </div>
            <div class="col-sm-3 blog-end">
                {section name=i loop=$lstBlogRight}
                    <div class="blog-item">
                        <a href="{$clsBlog->getLink($lstBlogRight[i].blog_id,$lstBlogRight[i])}" class="text-decoration-none">
                            <img class="img-blog" src="{$clsBlog->getImage($lstBlogRight[i].blog_id, 296, 193)}" alt="{$lstBlogLeft[i].slug}">
                            <h2 class="txt_blogitem">{$lstBlogRight[i].title}
                        </a>
                        </h2>
                        <div class="blog-item-content">
                            {$clsISO->limit_textIso($clsBlog->getIntro($lstBlogRight[i].blog_id), 20)}
                        </div>
                        <p class="date-time">
                            <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> {$lstBlogRight[i].reg_date|date_format:"%d %b, %Y"} |
                            <span>{$clsBlogCategory->getTitle($lstBlogRight[i].cat_id)}</span>
                        </p>
<!--                        <hr style="margin-bottom: 24px">-->
                    </div>
                {/section}
            </div>
        </div>
    </div>
</section>

<section class="lastest-blog">
    <div class="container">
        <div class="row">
            <div class="last-blog-item col-sm-9">
                <h2 class="title-lastest-blog">LASTEST BLOG</h2>
                {section name=i loop=$lstBlogs}
                    <div class="lastblog">
                        <div class="row">
                            <div class="col-md-6">
                                <a href="{$clsBlog->getLink($lstBlogs[i].blog_id)}">
                                    <img class="img-last-blog"
                                         src="{$clsBlog->getImage($lstBlogs[i].blog_id, 405, 237)}">
                                </a>
                            </div>
                            <div class="col-md-6">
                                <h3>
                                    <a href="{$clsBlog->getLink($lstBlogs[i].blog_id)}">{$lstBlogs[i].title}</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    {$lstBlogs[i].reg_date|date_format:"%d %b, %Y"}</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> {$clsBlogCategory->getTitle($lstBlogs[i].cat_id)}</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    {$lstBlogs[i].intro|html_entity_decode}
                                </div>
                            </div>
<!--                            <hr style="margin: 32px 0 0 0">-->
                        </div>
                    </div>
                {/section}
                <div class="last-blog-paginate d-flex justify-content-center mt-5">
                    <nav aria-label="Page navigation">
                        <ul class='pagination'>
                            <li class="page-item">
                                {$page_view}
                            </li>
                        </ul>
                    </nav>

                </div>

            </div>

            <div class="col-sm-3">
                <div class="list_filter">
                    <h3 class="txt_filter">Filter</h3>
                    <div id="selectedFilters" class="selected-filters"></div>
                    <button id="removeAllFilters" class="btn btn_removefilter">
                        <i class="fa-light fa-trash" style="color: #434b5c;"></i>Remove all filters
                    </button>

                </div>

                <div class="list_search_filter">
                    <form action="" method="POST" id="countryForm">
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
                            <div class="filter-radio">
                                {section name=i loop=$listCountry}
                                    <div class="form-check">
                                        <input class="form-check-input custom-control-input typeSearch" type="radio"
                                               name="slug_country"
                                               id="country_id_{$listCountry[i].country_id}"
                                               value="{$listCountry[i].slug}" {if $slug_country == $listCountry[i].slug}checked{/if}/>
                                        <label class="form-check-label custom-control-label"
                                               for="country_id_{$listCountry[i].country_id}">
                                            {$listCountry[i].title}
                                        </label>
                                    </div>
                                {/section}
                            </div>

                            <div class="filter-checkbox">
                                {section name=i loop=$lstBlogCat}
                                    <div class="form-check">
                                        <input class="form-check-input city typeSearch" type="checkbox"
                                               id="blogcat_id_{$lstBlogCat[i].blogcat_id}" name="blogcat_id[]" value="{$lstBlogCat[i].blogcat_id}"
                                               {if $clsISO->checkInArray($blogcat_id,$lstBlogCat[i].blogcat_id)}checked{/if}>
                                        <label class="form-check-label"
                                               for="blogcat_id_{$lstBlogCat[i].blogcat_id}">{$lstBlogCat[i].title}</label>
                                    </div>
                                {/section}
                                <a class="view-more" id="viewMore">View more</a>
                            </div>
                        </div>
                        <input type="hidden" name="filter" value="filter">
                    </form>
                    <div class="featured-blogs">
                        <h2 class="txt_featureblog">FEATURED BLOG</h2>
                        {section name=i loop=$lstFeatureBlog}
                        <div class="row featured-blog">
                            <div class="col-lg-5">
                                <a href="{$clsBlog->getLink($lstFeatureBlog[i].blog_id)}"><img class="img_featureblog" src="{$clsBlog->getImage($lstFeatureBlog[i].blog_id, 83, 83)}"
                                                 alt="featured-blog"/></a>
                            </div>
                            <h3 class="col-lg-7 mt-log-0 txt_featuredblogs">
                                <a href="{$clsBlog->getLink($lstFeatureBlog[i].blog_id)}">{$lstFeatureBlog[i].title}</a></h3>

                        </div>
                        {/section}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="recentlyview">
    <div class="container">
        <h2 class="title-recently-view">Recently viewed</h2>
        <div class="row blog-recently-view">
            <div class="col-sm-3">
                <div class="blog-item-recently">
                    <a href="#" class="text-decoration-none">
                        <img class="img-blog" src="{URL_IMAGES}/blog/img_recently_blog1.jpg" alt="image-recent"></a>
                    <h2 class="txt_recently">
                        <a href="#">Discover The Black Thai Communities In Pu Luong Nature Reserve, Vietnam</a>
                    </h2>
                    <div class="recently-view-content">
                        <p class="txt_recentlyview">Have confidence when discovering the street food of Hanoi’s
                            Old Quarter by traveling...</p>
                    </div>
                    <p class="date-time">
                        <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb,
                        2024 | Places to visit & things to do
                    </p>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="blog-item-recently">
                    <a href="#" class="text-decoration-none">
                        <img class="img-blog" src="{URL_IMAGES}/blog/img_recently_blog2.jpg" alt="image-recent"></a>
                    <h2 class="txt_recently">
                        <a href="#">What To Do In Mai Chau Vietnam In 2 Days? Itinerary Mai Chau 2 Days</a>
                    </h2>
                    <div class="recently-view-content">
                        <p class="txt_recentlyview">Have confidence when discovering the street food of Hanoi’s
                            Old Quarter by traveling...</p>
                    </div>
                    <p class="date-time">
                        <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb,
                        2024 | Travel blogs
                    </p>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="blog-item-recently">
                    <a href="#" class="text-decoration-none">
                        <img class="img-blog" src="{URL_IMAGES}/blog/img_recently_blog3.jpg" alt="image-recent"></a>
                    <h2 class="txt_recently">
                        <a href="#">Old Quarter Street Food Tour Review</a>
                    </h2>
                    <div class="recently-view-content">
                        <p class="txt_recentlyview">Have confidence when discovering the street food of Hanoi’s
                            Old Quarter by traveling...</p>
                    </div>
                    <p class="date-time">
                        <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb,
                        2024 | Travel blogs
                    </p>
                </div>
            </div>

        </div>

    </div>
</section>
{$core->getBlock('customer_review')}

{$core->getBlock('top_attraction')}

{$core->getBlock('also_like')}


<script>
    document.addEventListener('DOMContentLoaded', () => {
        const selectedFiltersDiv = document.getElementById("selectedFilters");
        const countryRadios = document.querySelectorAll('input[name="slug_country"]');
        const cityCheckboxes = document.querySelectorAll('.city');
        const viewMoreLink = document.getElementById('viewMore');
        const removeAllFiltersButton = document.getElementById("removeAllFilters");

        const cityCheckboxContainer = document.querySelector('.filter-checkbox'); 
        const maxVisibleCheckboxes = 5; 

        let isExpanded = false;

        cityCheckboxes.forEach((checkbox, index) => {
            if (index >= maxVisibleCheckboxes) {
                checkbox.parentElement.style.display = 'none';
            }
        });


        function updateSelectedFilters() {
            selectedFiltersDiv.innerHTML = "";

            countryRadios.forEach(radio => {
                if (radio.checked) {
                    addSelectedFilter(radio.parentElement.textContent.trim(), 'country');
                }
            });

            cityCheckboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    addSelectedFilter(checkbox.parentElement.textContent.trim(), 'city');
                }
            });
        }

        function addSelectedFilter(text, type) {
            const filterItem = document.createElement("div");
            filterItem.classList.add("selected-filter-item");
            filterItem.textContent = text;
            filterItem.dataset.type = type; 

            const removeButton = document.createElement("span");
            removeButton.classList.add("remove-filter-button");
            removeButton.innerHTML = "&times;";
            removeButton.addEventListener("click", () => {
                removeFilter(filterItem);
            });

            filterItem.appendChild(removeButton);
            selectedFiltersDiv.appendChild(filterItem);
        }

        function removeFilter(filterItem) {
            const type = filterItem.dataset.type;
            const text = filterItem.textContent.slice(0, -1).trim(); // Loại bỏ dấu X

            if (type === 'country') {
                countryRadios.forEach(radio => {
                    if (radio.parentElement.textContent.trim() === text) {
                        radio.checked = false;
                        radio.dispatchEvent(new Event('change')); // Kích hoạt sự kiện change
                    }
                });
            } else if (type === 'city') {
                cityCheckboxes.forEach(checkbox => {
                    if (checkbox.parentElement.textContent.trim() === text) {
                        checkbox.checked = false;
                        checkbox.dispatchEvent(new Event('change')); // Kích hoạt sự kiện change
                    }
                });
            }

            filterItem.remove();
            updateSelectedFilters();
        }


        removeAllFiltersButton.addEventListener('click', () => {
            countryRadios.forEach(radio => {
                radio.checked = false;
                radio.dispatchEvent(new Event('change'));
            });

            cityCheckboxes.forEach(checkbox => {
                checkbox.checked = false;
                checkbox.dispatchEvent(new Event('change'));
            });

            updateSelectedFilters();
        });

        viewMoreLink.addEventListener("click", () => {
            isExpanded = !isExpanded;
            viewMoreLink.textContent = isExpanded ? "View less" : "View more"; // Thay đổi text của nút

            cityCheckboxes.forEach((checkbox, index) => {
                if (index >= maxVisibleCheckboxes) {
                    checkbox.parentElement.style.display = isExpanded ? 'block' : 'none';
                }
            });
        });

        
        updateSelectedFilters();

        
        countryRadios.forEach(radio => {
            radio.addEventListener('change', updateSelectedFilters);
        });

        cityCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', updateSelectedFilters);
        });
    });

    $('#countryForm .typeSearch').change(function(){
        $(this).closest('form').submit();
    });
	
	document.addEventListener('DOMContentLoaded', function() {
  const lastBlogs = document.querySelectorAll('.lastblog');
  if (lastBlogs.length > 0) {
    lastBlogs[lastBlogs.length - 1].style.borderBottom = 'none';
  }
});
	
	

</script>
<style>

    .bground_header {
        background-image: url("https://unikasia.vietiso.com/isocms/templates/default/skin/images/blog/bground_blog.png");
        background-size: cover;
        background-position: center;
        height: 600px;
        /* padding: 0px 0 30px 0; */
        position: relative;
        z-index: 1;
    }

    .bground_header:after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(180deg, rgba(24, 28, 26, 0.48) 0%, rgba(24, 28, 26, 0.00) 100%);
        z-index: -1;
    }

    .txt_blogvn {
        position: absolute;
        left: 0;
        right: 0;
        top: 305px;
        z-index: 1;
        transform: translate(0%, -56%);
    }

    .txt_h1 {
        color: #FFF;
        text-align: center;
        font-size: 48px;
        font-style: normal;
        font-weight: 600;
        line-height: 64px; /* 133.333% */
        /*    margin-top: 127px;*/
    }
</style>
