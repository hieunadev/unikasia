{assign var=title_blog value=$clsBlog->getTitle($blog_id,$blogItem)}
{assign var=publish_date value=$blogItem.publish_date|date_format:"%Y-%m-%d"}
{assign var=upd_date value=$blogItem.upd_date|date_format:"%Y-%m-%d"}
{assign var=author value=$blogItem.author}
{assign var=imgBlog value=$clsBlog->getImage($blog_id,800,535,$blogItem)}
{assign var=listTag value=$clsBlog->getArrayTag($blog_id,$blogItem)}
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

<section name="intro_txtbg">
    <div class="bground_introtxt">
        <div class="row">
            <div class="col-md-6">
				<div class="img_blogdetail">
                <img src="https://s3-alpha-sig.figma.com/img/4a2b/4a79/ce53b5d3070b7bfc45d5c45aa55b2448?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FBu7zgjlf2xxxtgbe4xJ~otKHNdpzecJhrK6nM6IynydKksTHU-4RP~BXF-4k~jnm-VE2p081PS31rMc8PAJbKgiNKP4ND77pTJ6W~Umst~FCJD~ULGNs3abx0m2~N6VKfSeno7Fm1QYFt16y2zyZBNxGdlRVmaCnltYOb--audLM7ijQdfSGQmFHgZ4i8hBOhz-F4lVVrLUtOIk7c7HG6Ffb4FWlZXKw2I~~-nInb5vP3MejVscJElD0yyVgyO4UT0GTZTqkmKK95~y4LvMlrHfjpO0~U-vnl-XbfT6cGjdf7Hf7HsUjg~OsPA0q2L0xnaYBVMSERlupgFWCF~d8g__" alt="Hình ảnh" class="img-fluid img_detailblog"> 
            </div>
				</div>
            <div class="col-md-6">
				<div class="rounded_right">
                <div class="textdesblog">
                    <p class="txt_blogdes">VIETNAM |  TRAVEL TIPS</p> 
                    <h2 class="txth2_blogdetail">Top Best Things To Do In Hanoi For 3 Days</h2>
                    <p class="txt_blogdetaildes">If you are traveling throughout the North and are looking for a destination that combines a rich exploration of Vietnamese history and culture with the opportunity to enjoy unique and delicious local cuisine, then don't hesitate to come to Hanoi and experience the top best things to do in Hanoi for 3 days.</p>
                    <div class="infor_dateauthor">
						<div class="infor_date">
                        <i class="fa-regular fa-clock-three" style="color: #ffffff;"></i> <span>19 February, 2024</span> 
							</div>
						<div class="infor_author">
                        <i class="fa-solid fa-user" style="color: #ffffff;"></i> <span>UnikAsia</span>
							</div>
                    </div>
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
                <li class="breadcrumb-item"><a href="{PCMS_URL}blog/vietnam" title="{$core->get_Lang('Vietnam')}">Vietnam</a></li>
				<li class="breadcrumb-item active" aria-current="page">Top Best Things To Do In Hanoi For 3 Days</li>
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
							<div class="introduct_txt">
						<h2 class="title-detailblog">Introduction about Hanoi</h2>
						<p class="txt_p_detailblog">Hanoi, the capital of Vietnam, is a vibrant metropolis of 8 million people, combining rich cultural heritage with the hustle and bustle of modern life. “Ha” is a river, “Noi” is inland, and Hanoi means “inland between rivers”. Bordered by the Red River in the north of the country, Hanoi is famous for its historical charm, characterized by ancient temples, colonial architecture, and the labyrinthine streets of the old quarter. Visitors to Hanoi cannot miss famous landscapes such as exploring places such as Hoan Kiem Lake, Ho Chi Minh Mausoleum, One Pillar Pagoda, Temple of Literature,... Hanoi is also self-sufficient. </p>
						<p class="txt_p_detailblog">Proud to be a culinary paradise with a strongly developed street food scene, offering many delicious dishes. With a unique blend of tradition and progress, Hanoi continues to be an attractive destination for tourists looking for the flavors of Vietnam past and present. In this guide, Autour Asia will introduce the top things to do in Hanoi for 3 days.</p>
						<div class="img-blogdetail">
						<img class="img_blogdetail" src="{URL_IMAGES}/blog/img_detailblog1.png" alt="imgdetail" title="imgdetail" width="908" height="605">
						</div>
						</div>
							
						<div class="introduct_txt">
						<h2 class="title-detailblog">The best time to visit Hanoi</h2>
						<p class="txt_p_detailblog">The best time to visit Hanoi is generally between the months of September and November, as well as between March and April. During these periods, the climate is generally more pleasant, with moderate temperatures and relatively low humidity. From September to November, you can enjoy mild temperatures, pleasant sunshine, and a generally comfortable atmosphere. This is also the time when the surrounding landscapes, such as Halong Bay, are particularly beautiful.</p>
						<p class="txt_p_detailblog">In March and April, it is spring in Hanoi. Temperatures gradually rise, making for pleasant days to explore the city. In addition, this period corresponds to the blossoming of cherry trees and the traditional festival of Tet (Vietnamese New Year), offering a festive and colorful atmosphere.</p>
						<div class="img-blogdetail">
						<img class="img_blogdetail" src="{URL_IMAGES}/blog/img_detailblog2.png" alt="imgdetail" title="imgdetail" width="908" height="605">
						</div>
							<p class="txt_p_detailblog">However, it is important to note that the climate can be unpredictable in this region and there may be variations from year to year. It is recommended to check the weather forecast before your trip and pack clothing suitable for varying temperatures. By avoiding the summer months (June to August) which can be hot and humid, as well as the winter months (December to February) which can be cool and foggy, you will be able to make the most of your visit to Hanoi.</p>	
						</div>
							
													<div class="introduct_txt">
						<h2 class="title-detailblog">Tops best things to do in Hanoi for 3 days</h2>
						<p class="txt_p_detailblog">If you have three days to explore Hanoi, here's a suggested itinerary to help you make the most of your trip:</p>
							<h3 class="time_txt_detailblog">Day 1: Food tour & The Old Quarter</h3>
						<p class="txt_p_detailblog">Morning: Explorer The Old Quarter & Hoan Kiem Lake.</p>
						<div class="img-blogdetail">
						<img class="img_blogdetail" src="{URL_IMAGES}/blog/img_detailblog3.png" alt="imgdetail" title="imgdetail" width="908" height="605">
						</div>
							<p class="txt_p_detailblog">Start your day by visiting Hoan Kiem Lake, a popular spot for locals and tourists alike. Hoan Kiem Lake, also known as Sword Lake, is a freshwater lake in the heart of Hanoi, which is one of the most popular tourist destinations in Hanoi, and it is also a sacred place for many Vietnamese people. The lake is based on the legend of Vietnam when King Le Loi was given a magical sword by the Golden Turtle God to help defeat the Chinese invaders. After the victory, he returned the sword to the lake, and it is said that the Golden Turtle God still guards the sword today. This is a wonderful and peaceful place to visit, a great place to relax and enjoy the beauty of the scenery, and is also a popular space for locals and tourists to go for a walk, run, or bike ride…... Don’t forget to visit Ngoc Son temple, located on Jade Islet in the middle of Hoan Kiem Lake, this magnificent temple is a historical and cultural treasure that attracts visitors from all over the world.</p>
							<p class="txt_p_detailblog">Start your day by visiting Hoan Kiem Lake, a popular spot for locals and tourists alike. Hoan Kiem Lake, also known as Sword Lake, is a freshwater lake in the heart of Hanoi, which is one of the most popular tourist destinations in Hanoi, and it is also a sacred place for many Vietnamese people. The lake is based on the legend of Vietnam when King Le Loi was given a magical sword by the Golden Turtle God to help defeat the Chinese invaders. After the victory, he returned the sword to the lake, and it is said that the Golden Turtle God still guards the sword today. This is a wonderful and peaceful place to visit, a great place to relax and enjoy the beauty of the scenery, and is also a popular space for locals and tourists to go for a walk, run, or bike ride…... Don’t forget to visit Ngoc Son temple, located on Jade Islet in the middle of Hoan Kiem Lake, this magnificent temple is a historical and cultural treasure that attracts visitors from all over the world.</p>
						</div>
							
						<div class="txt_ico_share_star">
						  <div class="txt_ico_share">
							<div class="share-content">
							  <p class="txtshare">Share</p>
							  <div class="social-icon-share-blog">
								<a href="#" class="social-icon-blog"><i class="fa-brands fa-youtube"></i></a>
								<a href="#" class="social-icon-blog"><i class="fa-brands fa-instagram"></i></a>
								<a href="#" class="social-icon-blog"><i class="fa-brands fa-facebook"></i></a>
								<a href="#" class="social-icon-blog"><i class="fa-brands fa-twitter"></i></a>
							  </div>
							</div>
						  </div>
						  <div class="rating-and-votes">
							<div class="star-icons">
								<i class="fa-light fa-star fa-xl" style="color: #FFD43B;"></i>						  
								<i class="fa-light fa-star fa-xl" style="color: #FFD43B;"></i>
								<i class="fa-light fa-star fa-xl" style="color: #FFD43B;"></i>
								<i class="fa-light fa-star fa-xl" style="color: #FFD43B;"></i>
								<i class="fa-light fa-star fa-xl" style="color: #FFD43B;"></i>
							</div>
							<span class="vote-count">| 2 voted</span>
						  </div>
						</div>
							
							<div class="tag_blog">
								<p class="txt_tags">Tags:</p>
								<div class="tags_">
									<p class="txt_tag_">#tour</p>
									<p class="txt_tag_">#food</p>
									<p class="txt_tag_">#vietasia</p>
								</div>
							</div>
							
							<div class="comment_box mtm mt30 w-100">
                            <div class="fb-comments" data-href="{$PCMS_URL}{$clsBlog->getLink($blog_id,$blogItem)}" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
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
									<h3 class="col-lg-8 mt-log-0 txt_featuredblogs">
									<a href="#">Vietnam Airlines Launches New Routes To Singapore, Cambodia</a></h3>
									
								</div>
								
									<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img class="img_featureblog" src="{URL_IMAGES}/blog/pic_featureblog2.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0 txt_featuredblogs">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img class="img_featureblog" src="{URL_IMAGES}/blog/pic_featureblog3.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0 txt_featuredblogs">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img src="{URL_IMAGES}/blog/pic_featureblog4.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0 txt_featuredblogs">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
									
								</div>
								
								<div class="row featured-blog">
									<div class="col-lg-4">
								<a href="#"><img src="{URL_IMAGES}/blog/pic_featureblog5.png" alt="featured-blog"/></a>
									</div>
									<h3 class="col-lg-8 mt-log-0 txt_featuredblogs">
									<a href="#">Ninh Binh Day Tour (Hoa Lu- Tam Coc- Mua cave) - Review</a></h3>
								</div>
							<hr style="margin-bottom: 32px; margin-top: 32px">
								
								<div class="related_tours">
								  <h2 class="txt_featureblog">RELATED TOURS</h2>
								  <div class="list_viewtour">
									  <div class="img_toursrelated">
										  <a href="#" alt="tour" title="tour">
										  <img src="{URL_IMAGES}/blog/img_relativeblog1.png" alt="Pic_relatedtour" class="img-fluid">
									  </div>
										  <div class="txt_des_tour">
										  <h3 class="txth_relatedtour">Splendors of Vietnam with the center’s must-sees 19 days</h3>
											  </a>
										<div class="d-flex align-items-center score_reviewtour"> 
											<span class="border_score">9.9</span>
										  <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
										</div>
										<div class="d-flex align-items-center"> 
											<i class="fa-light fa-location-dot" style="color: #43485c;"></i> <span class="txt_placetours">Place: Hanoi – Halong – Hue – Hoian</span> <span class="border_place">+2</span>
										</div>
										
										  <p>Les “MUST” + découverte des Ethnies du Nord “À NE PAS MANQUER” et la nuit étoilée sur la jonque traditionnelle en baie […]</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="from_price">
											<p class="from_txtp">From</p>
										  <span class="txt_price">US
												<h3 class="txt_numbprice"> $650</h3>
												</span>
											</div>
											
											<a href="#" alt="tour" title="tour">
										  <button class="btn btn_viewtour">View Tour <i class="fa-regular fa-arrow-right" style="color: #ffffff;"></i></button>
											</a>
									  </div>
									</div>
								  </div>
									
									<div class="list_viewtour">
									  <div class="img_toursrelated"> 
										  	<a href="#" alt="tour" title="tour">
										  <img src="{URL_IMAGES}/blog/img_relativeblog1.png" alt="Pic_relatedtour" class="img-fluid">
									  </div>
										  <div class="txt_des_tour">
										  <h3 class="txth_relatedtour">The “MUSTS” in 12 days</h3>
											</a>

										<div class="d-flex align-items-center score_reviewtour"> 
											<span class="border_score">9.9</span>
										  <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
										</div>
										<div class="d-flex align-items-center"> 
											<i class="fa-light fa-location-dot" style="color: #43485c;"></i> <span class="txt_placetours">Place: Hanoi – Halong – Hue – Hoian</span> <span class="border_place">+2</span>
										</div>
										
										  <p>Les “MUST” + découverte des Ethnies du Nord “À NE PAS MANQUER” et la nuit étoilée sur la jonque traditionnelle en baie […]</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="from_price">
											<p class="from_txtp">From</p>
										  <span class="txt_price">US
												<h3 class="txt_numbprice"> $650</h3>
												</span>
											</div>
											<a href="#" alt="tour" title="tour">
										  <button class="btn btn_viewtour">View Tour <i class="fa-regular fa-arrow-right" style="color: #ffffff;"></i></button>
											</a>
									  </div>
									</div>
								  </div>
									
									<div class="list_viewtour">
									  <div class="img_toursrelated"> 
										  	<a href="#" alt="tour" title="tour">
										  <img src="{URL_IMAGES}/blog/img_relativeblog1.png" alt="Pic_relatedtour" class="img-fluid">
									  </div>
										  <div class="txt_des_tour">
										  <h3 class="txth_relatedtour">The “MUSTS” in 12 days</h3>
											  </a>

										<div class="d-flex align-items-center score_reviewtour"> 
											<span class="border_score">9.9</span>
										  <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
										</div>
										<div class="d-flex align-items-center"> 
											<i class="fa-light fa-location-dot" style="color: #43485c;"></i> <span class="txt_placetours">Place: Hanoi – Halong – Hue – Hoian</span> <span class="border_place">+2</span>
										</div>
										
										  <p>Les “MUST” + découverte des Ethnies du Nord “À NE PAS MANQUER” et la nuit étoilée sur la jonque traditionnelle en baie […]</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="from_price">
											<p class="from_txtp">From</p>
										  <span class="txt_price">US
												<h3 class="txt_numbprice"> $650</h3>
												</span>
											</div>
											<a href="#" alt="tour" title="tour">
										  <button class="btn btn_viewtour">View Tour <i class="fa-regular fa-arrow-right" style="color: #ffffff;"></i></button>
											</a>
									  </div>
									</div>
								  </div>
									
									<div class="border_exploremore">
										<img class="img_exploremore" src="{URL_IMAGES}/blog/pic_imglastest9.png">
										<div class="txt_exploremore">
										<p class="tour_exploretxt">Explore more Vietnam tours</p></div>
										<a href="#" alt="tour" title="tour">

										<button class="btn btn_seealltour">See all tours <i class="fa-regular fa-arrow-right" style="color: #ffffff;"></i></button>
										</a>
									</div>
									
								</div>



								

							</div>

							</section>
							  
						<section class="read_blognext">
							<div class="container">
						<h2 class="txt_readblog">Read the next</h2>
								<div class="pic_textread row">
								  <div class="col-md-7">
									  <a href="#" alt="explore" title="explore">
									<img class="pic_read img-fluid" src="{$URL_IMAGES}/blog/img_readthenext1.png" alt="pic_txt1" title="explore" width="752" height="487">
										  </a>
								  </div>
								  <div class="col-md-5">
									  <div class="txt_categoryblog">
									<p class="txt_cateblog">TRAVEL TIPS</p>
										  <a href="#" alt="explore" title="explore">
									  <h3 class="txthigh_cateblog">Exploring Bat Trang Ceramic Village In Hanoi: A Signature Craft Of Vietnam.</a></h3>
											  
									  <p class="txtdes_cateblog">If you find yourself stuck in Hanoi and yearn for respite from the bustling city, seeking authenticity and serenity, consider a visit to Bat Trang Village</p>
								  </div>
									  </div>
									</div>
								
									<div class="list_readblog row">
									  <div class="col-md-4 item">
										<img src="{URL_IMAGES}/blog/img_readthenext2.png" alt="Mô tả ảnh 1" class="img-fluid">
										<div class="text-content"> 
										  <p class="txt_cateblog">TRAVEL TIPS</p>
										  <h3 class="txthigh_cateblog_">Top 05 Best Massages And Spas In Hanoi's Old Quarter, Vietnam</h3>
										</div> 
									  </div>
									  <div class="col-md-4 item">
										<img src="{URL_IMAGES}/blog/img_readthenext3.png" alt="Mô tả ảnh 2" class="img-fluid">
										<div class="text-content">
										  <p class="txt_cateblog">TRAVEL TIPS</p>
										  <h3 class="txthigh_cateblog_">Top Best Things To Do In Hanoi For 3 Days</h3>
										</div>
									  </div>
									  <div class="col-md-4 item">
										<img src="{URL_IMAGES}/blog/img_readthenext4.png" alt="Mô tả ảnh 3" class="img-fluid">
										<div class="text-content">
										  <p class="txt_cateblog">TRAVEL TIPS</p>
										  <h3 class="txthigh_cateblog_">Top Best Things To Do In Hanoi For 3 Days</h3>
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
				{if $cat_id gt 0 && $clsISO->getCheckActiveModulePackage($package_id,'blog','category','default')}
               {assign var=itemCat value=$clsBlogCategory->getOne($cat_id,'title,slug')}
                <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$clsBlogCategory->getLink($cat_id,$itemCat)}" title="{$itemCat.title}">
						<span itemprop="name" class="reb">{$itemCat.title}</span></a>
					<meta itemprop="position" content="3" />
				</li> 
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$curl}" title="{$title_blog}">
						<span itemprop="name" class="reb">{$title_blog}</span></a>
					<meta itemprop="position" content="4" />
				</li> 
				{else}
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemprop="item" href="{$curl}" title="{$title_blog}">
						<span itemprop="name" class="reb">{$title_blog}</span></a>
					<meta itemprop="position" content="3" />
				</li>
                {/if}
            </ol>
        </div>
    </nav>


    <div id="contentPage" class="blogPage pageBlogDefault bg_f1f1f1">
		<div class="container">
			<h1 class="title32 color_333 mb50">{$title_blog}</h1>
			<div class="row">
				<div class="col-lg-8 blogLeft mb768_30">
					<div class="blogContent">
						<div class="tinymce_Content">
							<div class="submitted"> 
								<i class="fa fa-clock-o" aria-hidden="true"></i> {$clsISO->converTimeToText($blogItem.publish_date)}
								{assign var=getAuthor value=$blogItem.author} 
								{if $getAuthor ne ''} 
								&nbsp;<i class="fa fa-user" aria-hidden="true"></i>&nbsp; {$getAuthor} 
								{/if}
								<div class="sharethis-inline-share-buttons" data-image="{$DOMAIN_NAME}{$clsISO->getPageImageShare($blog_id,'Blog',$blogItem)}" data-url="{$DOMAIN_NAME}{$curl}" data-title="{$title_blog}"></div>
								<script type="text/javascript" src="{$URL_JS}/jquery.sharer.js?v={$up_version}"></script>
								{assign var=link_share value=$curl}
								{assign var=title_share value=$title_blog}
								{$clsISO->getBlock('box_share',["link_share"=>$link_share,"title_share"=>$title_share])}
							</div>
							<div class="content">
								<div class="field-items maxWidthImage">
									{$clsBlog->getIntro($blog_id,$blogItem)}
									<div class="clearfix mb40"></div>
									{$clsBlog->getContent($blog_id,$blogItem)}
								</div>
							</div>
						</div>
						
						<div class="comment_box mtm mt30 w-100">
                            <div class="fb-comments" data-href="{$PCMS_URL}{$clsBlog->getLink($blog_id,$blogItem)}" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
                        </div>
					</div>
					{if $lstRelated}
					<div class="cleafix mb30"></div>
					<div class="relateBlog mb30">
						<h2 class="title24 mb20">{$core->get_Lang('Related Blogs')}</h2>
						<ul class="listBlog">
							{section name=i loop=$lstRelated}
							{assign var=title_blog_relate value=$clsBlog->getTitle($lstRelated[i].blog_id,$lstRelated[i])}
							<li><a class="clickviewtopnews" data-data="{$lstRelated[i].blog_id}" href="{$clsBlog->getLink($lstRelated[i].blog_id,$lstRelated[i])}" title="{$title_blog_relate}">{$title_blog_relate}</a></li>
							{/section}
						</ul>
					</div>
					{/if}
				</div>
				<aside class="col-lg-4 sidebar rightBlog">
					{$core->getBlock('l_rightblog')}
				</aside>
			</div>
        </div>
    </div>
</div>
-->

{literal}
<script>
$('.tinymce_Content img').each(function(i) {
    var self = $(this);
	self.attr('data-action', 'zoom');
});
</script>
{/literal}
<link rel="stylesheet" href="{$URL_JS}/zoom/zoom.css?v={$upd_version}"/>
<script src="{$URL_JS}/zoom/zoom.js?v={$upd_version}"></script>