<section class="listblog_breadcrumb">
<div class="breadcrumb_list">
    <div class="container">
        <div class="breadcrumb">
            <h2 class="txt_youarehere">You are here:</h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{PCMS_URL}" title="{$core->get_Lang('Home')}">Home</a></li>
                <li class="breadcrumb-item"><a href="{PCMS_URL}blog" title="{$core->get_Lang('Blog')}">Blog</a></li>
                <li class="breadcrumb-item active" aria-current="page">Vietnam</li>
            </ol>
        </div>
    </div>
</div>
	</section>

        <section class="blog-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-3 blog-left">
						
						{section name =i loop=2}
					 	{assign var=title_blog value=$clsBlog->getTitle($lstBlogs[i].blog_id,$lstBlogs[i])}
                        {assign var=link_blog value=$clsBlog->getLink($lstBlogs[i].blog_id,$lstBlogs[i])}
						{assign var=intro_blog value=$clsBlog->getIntro($lstBlog[i].blog_id, $lstBlogs[i])}
						
						
						
					
						{assign var=img_blog value=$clsBlog->getImage($lstBlogs[i].blog_id,296,193,$lstBlog[i])}
						{assign var=img_blog2 value=$clsBlog->getImage($lstBlogs[i].blog_id,624,408,$lstBlog[i])}
						
						{assign var=slug_blog value=$clsBlog->getSlug($lstBlog[i].blog_id,$lstBlogs[i])}


						
                        <div class="blog-item">
                            <a class="text-decoration-none" href="{$link_blog}" title="{$title_blog}">
                                <img class="img-blog" src="{$img_blog}" alt="{$lstBlogs[i].slug}" title="{$title_blog}">
                                <h2 class="txt_blogitem">{$title_blog}</a>
                                </h2>
                                {$title_blog}
                                
                                <p class="date-time">
                                    <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb, 2024 |
                                    <span>Travel blog</span>
                                </p>
                                <hr style="margin-bottom: 24px">
                        </div>
						{/section}
					</div>
					        							
        
					{section name=i loop=1}
                    <div class="col-lg-6 col-sm-6 blog-mid">
                        <div class="blog-item">
                            <a href="{$link_blog}" class="text-decoration-none" title="{$title_blog}">
                                <img class="img-blog-mid" src="{$img_blog2}" alt="image-blog">
                                <h2 class="blog-item-center">{$title_blog}
                            </a>
                            </h2>
                             {$intro_blog}

                            <p class="date-time">
                                <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> {$lstBlogs[i].formatted_reg_date} |
                                <span>Useful infos</span>
                            </p>
                            <hr style="margin-bottom: 24px">
        				{/section}
                        </div>
        
                        <div class="row blog-item blog-item-center-second card-bodyblog">
                            <div class="col-sm d-flex flex-column" style="gap: 16px">
                                <h2 class="m-0 txt_blogitemmid">
                                    <a href="{$link_blog}" title="{$title_blog}">
									{$title_blog}                                    
									</a>
        
                                </h2>
                                <div class="blog-item-content">
                                    <p class="txtblog_p">Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you...</p></div>
                                <p class="date-time">
                                    <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb, 2024 |
                                    <span>Places to visit & things to do</span>
                                </p>
        
                            </div>
                            <div class="col-sm">
                                <img class="img-blog mb-3 mb-sm-0" src="{$URL_IMAGES}/blog/pic_blogmid2.jpg" alt="img">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 blog-end">
                        <div class="blog-item">
                            <a href="#" class="text-decoration-none">
                                <img class="img-blog" src="{$URL_IMAGES}/blog/pic_blogend1.jpg" alt="image-blog">
                                <h2 class="txt_blogitem">What To Do In Mai Chau Vietnam In 2 Days? Itinerary Mai Chau 2 Days</a>
                            </h2>
        
                            <div class="blog-item-content">
                                Have confidence when discovering the street food of Hanoi's Old
                                Quarter by traveling with a guide who shows you...
                            </div>
                            <p class="date-time">
                                <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb, 2024 |
                                <span>Travel blog</span>
                            </p>
                            <hr style="margin-bottom: 24px">
        
                        </div>
        
                        <div class="blog-item">
                            <a href="#" class="text-decoration-none">
                                <img class="img-blog" src="{$URL_IMAGES}/blog/pic_blogend2.jpg" alt="image-blog">
                                <h2 class="txt_blogitem">Old Quarter Street Food Tour Review</a>
                            </h2>
                            <div class="blog-item-content">
                                Have confidence when discovering the street food of Hanoi's Old
                                Quarter by traveling with a guide who shows you...
                            </div>
                            <p class="date-time">
                                <i class="fa-regular fa-clock" style="color: #74C0FC;"></i> 10 Feb, 2024 |
                                <span>Travel blog</span>
                            </p>
                        </div>
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
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$img_blog}">
                                </a>
                            </div>
                            <div class="col-sm-7 col">
                                <h3>
                                    <a href="blog-detail/{$lstBlogs[i].slug}">Old Quarter Street Food Tour Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Places to
                                         visit & things to do</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
                            <hr style="margin: 32px 0 0 0">
                        </div>
							</div>
						{/section}
        
<!--
						<div class="lastblog">
                        <div class="row">
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$URL_IMAGES}/blog/pic_imglastest2.png" alt="img_lastestblog">
        
                                </a>
        
                            </div>
        
                            <div class="col-sm-7 col">
                                <h3>
                                    <a href="blog-detail/{$listBlog[i].slug}">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Explore Vietnam</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
                            <hr style="margin: 32px 0 0 0">
        				</div>
                        </div>
						
						<div class="lastblog">
                        <div class="row">
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$URL_IMAGES}/blog/pic_imglastest3.png" alt="img_lastestblog">
        
                                </a>
        
                            </div>
        
                            <div class="col-sm-7 col">
                                <h3>
                                    <a href="blog-detail/{$listBlog[i].slug}">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Explore Vietnam</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
                            <hr style="margin: 32px 0 0 0">
        				</div>
                        </div>
						
						<div class="lastblog">
                        <div class="row">
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$URL_IMAGES}/blog/pic_imglastest4.png" alt="img_lastestblog">
        
                                </a>
        
                            </div>
        
                            <div class="col-sm-7 col">
                                <h3>
                                    <a href="blog-detail/{$listBlog[i].slug}">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Explore Vietnam</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
                            <hr style="margin: 32px 0 0 0">
        				</div>
                        </div>
						
						<div class="lastblog">
                        <div class="row">
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$URL_IMAGES}/blog/pic_imglastest5.png" alt="img_lastestblog">
        
                                </a>
        
                            </div>
        
                            <div class="col-sm-7 col">
                                <h3>
                                    <a href="blog-detail/{$listBlog[i].slug}">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Explore Vietnam</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
                            <hr style="margin: 32px 0 0 0">
        				</div>
                        </div>
						
        
						<div class="lastblog">
                        <div class="row">
                            <div class="col-sm-5 col position-relative">
                                <a href="#">
                                    <img class="img-last-blog" src="{$URL_IMAGES}/blog/pic_imglastest6.png">
        
                                </a>
                            </div>
                            <div class="col-sm-7 col ">
                                <h3>
                                    <a href="blog-detail/{$listBlog[i].slug}">Old Quarter Street Food Tour Review</a>
                                </h3>
                                <p class="date-time">
                                    <span><i class="fa-regular fa-clock" style="color: #74C0FC;"></i>
                                    10 Feb, 2024</span>
                                    <span class="ms-3"><i class="fa-light fa-folder-open" style="color: #004ea8;"></i> Explore Vietnam</span>
                                </p>
                                <div class="last-blog-content fw-normal">
                                    Have confidence when discovering the street food of Hanoi’s Old Quarter by traveling with a guide who shows you the best places to eat. Stop at popular food stalls and local restaurants to sample up to...
                                </div>
                            </div>
							

							</div>
                        </div>
-->

                        <div class="last-blog-paginate d-flex justify-content-center mt-5">
                            <nav aria-label="Page navigation">
                                <ul class='pagination'>
                                    <li class="page-item">
                                        <a class='page-link previous' href='news.php?page='>
										<i class="fa-solid fa-chevron-left" style="color: #111d37;"></i>                                        
										</a>
                                        </li>
                                    <li class="page-item paginate-active">
                                        <a class="current page-link"href="#">1</a>
                                    </li>
                    
                                    <li class="page-item">
                                        <a class="current page-link"href="#">2</a>
                                    </li>
                    
                                    <li class="page-item">
                                        <a class="current page-link"href="#">3</a>
                                    </li>
                    
                                    <li class="page-item">
                                        <a class="current page-link"href="#">...</a>
                                    </li>
                    
                                    <li class="page-item">
                                        <a class="current page-link"href="#">9</a>
                                    </li>
                                    
                                    <li class="page-item">
                                        <a class='page-link next' href='news.php?page='>
									<i class="fa-solid fa-chevron-right" style="color: #111d37;"></i> </a>
                                        </li>
                                  </ul> 
                            </nav>
            
                         </div>
    
                    </div>
        
                     <div class="col-sm-3">
                        <div class="list_filter">
                            <h3 class="txt_filter">Filter</h3>

                        </div>
                        <div class="list_search_filter">
                        <form action="/blog" method="GET">
                            <div class="search-item d-none d-sm-flex mb-3">
                                <button class="search-item-icon" type="submit">
                                    <i class="fa-regular fa-magnifying-glass"></i>
                                </button>
                                <div class="search-item-txt">
                                    <input class="border-0 input-search text-dark" type="text" value="{$data.search|escape:'html'}"
                                           name="search" placeholder="Search" />
                                </div>
                            </div>

                            <div class="filter-articles">
                                <h3 class="list_fiter_articles">Filter Articles</h3>
                                <div class="filter-radio">
<!--
                                    <div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="flexRadioDefault1" value="all" checked />
                                       <label class="form-check-label custom-control-label" for="flexRadioDefault1">
                                          All
                                       </label>
                                    </div>
-->
									
									 <div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="country_id1" value="1" checked />
                                       <label class="form-check-label custom-control-label" for="country_id1">
                                          Vietnam
                                       </label>
                                    </div>
									
									<div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="country_id2" value="2"/>
                                       <label class="form-check-label custom-control-label" for="country_id2">
                                          Laos
                                       </label>
                                    </div>
									
									<div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="country_id3" value="3" />
                                       <label class="form-check-label custom-control-label" for="country_id3">
                                          Cambodia
                                       </label>
                                    </div>
									
									<div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="country_id4" value="4" />
                                       <label class="form-check-label custom-control-label" for="country_id4">
                                          Thailand
                                       </label>
                                    </div>
									
									<div class="form-check">
                                       <input class="form-check-input custom-control-input" type="radio" name="country"
                                          id="country_id5" value="5" />
                                       <label class="form-check-label custom-control-label" for="country_id5">
                                          Myanmar
                                       </label>
                                    </div>
                            </div>
								
							 <div class="filter-checkbox">
								 <div class="form-check">
									 <input class="form-check-input city 1" type="checkbox" id="city1">
								<label class="form-check-label" for="city1"> Places to visit &amp; things to do </label>
								 </div>
								 
								 	<div class="form-check">
									 <input class="form-check-input city 2" type="checkbox" id="city2">
								<label class="form-check-label" for="city2"> Explore Vietnam </label>
								 </div>
								 
								 	<div class="form-check">
									 <input class="form-check-input city 1" type="checkbox" id="city1">
								<label class="form-check-label" for="city1"> Useful infos </label>
								 </div>
								 
								 	 <div class="form-check">
									 <input class="form-check-input city 1" type="checkbox" id="city1">
								<label class="form-check-label" for="city1">Food &amp; Drink </label>
								 </div>
								 
								 	<div class="form-check">
									 <input class="form-check-input city 1" type="checkbox" id="city1">
								<label class="form-check-label" for="city1">Experience of customers </label>
								 </div>
								 
								  <a class="view-more" id="viewMore">View more</a>
                        <button id="hideCities" style="display:none;">Hide Cities</button>
								 
								</div>

                        </div>
							</form>
							<div class="featured-blogs">
								<h2 class="txt_featureblog">FEATURED BLOG</h2>
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img class="img_featureblog" src="{URL_IMAGES}/blog/pic_featureblog1.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0">
									<a href="#">Vietnam Airlines Launches New Routes To Singapore, Cambodia</a></h3>
									
								</div>
								
									<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img class="img_featureblog" src="{URL_IMAGES}/blog/pic_featureblog2.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img class="img_featureblog" src="{URL_IMAGES}/blog/pic_featureblog3.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img src="{URL_IMAGES}/blog/pic_featureblog4.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img src="{URL_IMAGES}/blog/pic_featureblog5.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
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
{$core->getBlock('top_attraction')}
{$core->getBlock('reviews')}
{$core->getBlock('also_like')}
