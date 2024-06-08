{assign var=maxStars value=5}
<main>
    <section class="listtourdetail_breadcrumb">
        <div class="breadcrumb_list">
            <div class="container">
                <div class="breadcrumb">
                    <h2 class="txt_youarehere">You are here:</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{PCMS_URL}" title="{$core->get_Lang('Home')}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{$clsCountry->getLink($country_id, 'tour')}"
                                                       title="{$core->get_Lang('Vietnam')}">{$clsCountry->getTitle($country_id)}</a>
                        </li>
                        <li class="breadcrumb-item"><a href="{$clsTourCat->getLink($travel_style_id,'','home')}"
                                                       title="{$core->get_Lang('Honeymoon')}">{$clsTourCat->getTitle($travel_style_id)}</a></li>

                        <li class="breadcrumb-item active" aria-current="page">{$clsTour->getTitle($tour_id)}</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="txtimg_intro_detailtour">
        <div class="container">
            <div class="txt-share-detailtour">
                <h2 class="txt_detailhotel">{$clsTour->getTitle($tour_id)}</h2>
                <div class="txt_numbpricetour">
                    <p class="txt_numbtour">From US <span class="under_numbprice">${$oneItem.min_price}</span> <span
                                class="number_pricetour">${$clsTour->getDiscount($tour_id, $oneItem.min_price)}</span> /pax </p>
                </div>
            </div>

            <div class="d-flex align-items-center score_reviewtour">
                <span class="border_score">{$clsReviews->getReviews($tour_id, 'avg_point')}</span>
                <span class="txt_score">{$clsReviews->getReviews($tour_id, 'txt_review')} </span> <span class="txt_reviewstour"> - {$clsReviews->getReviews($tour_id)} reviews</span>
            </div>

            <div class="img_detailtour">
                <div class="row">
                    <div class="col-md-8">
                        <div class="image_tourdetail">
                            <div id="gallery_detail_tour" class="owl-carousel">
                                {section name=i loop=$lstTourImage}
                                <img class="img_tourdetail" data-fancybox="gallery_detail_tour" src="{$clsTourImage->getImage($lstTourImage[i].tour_image_id, 841, 552)}">
                                {/section}
                            </div>
                            {if $lstTourImage}<div class="image-counter" data-fancybox="gallery_detail_tour" href="{$lstTourImage[0].image}">+{$lstTourImage|count} <i class="fas fa-image"></i></div>{/if}
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border-locationinfo">
                            <div class="location-info">
                                <p class="txt_location">
                                    <i class="fa-light fa-location-dot" style="color: #111d37;"></i>
                                    Form {$clsTourDestination->getByCountry($tour_id, "startFinish_detail")}
                                </p>
                                <p class="txt_location">
                                    <i class="fa-regular fa-clock-three" style="color: #111d37;"></i>
                                    <span class="bold_txtlocation">Duration:</span>
                                    {if $oneItem.duration_custom}
                                        {$oneItem.duration_custom}
                                    {else}
                                        {$oneItem.number_day} {if $oneItem.number_day lt 2}day {else} days {/if}
                                    {/if}
                                </p>
                                <p class="txt_location">
                                    <i class="fa-light fa-location-dot" style="color: #111d37;"></i>
                                    <span class="bold_txtlocation">Place:</span> {$clsTourDestination->getByCountry($tour_id, 'all_city')}
                                </p>
                                <p class="txt_location">
                                    <i class="fa-solid fa-bell-concierge" style="color: #000111;"></i>
                                    <span class="bold_txtlocation">Meals:</span> {$clsTourItinerary->getGoodMeal($tour_id)}
                                </p>
                                <p class="txt_location">
                                    <i class="fa-light fa-users" style="color: #111d37;"></i>
                                    <span class="bold_txtlocation">Group size:</span> Min 1, max 15
                                </p>
                                <p class="txt_location">
                                    <i class="fa-regular fa-circle-dot" style="color: #111d37;"></i>
                                    <span class="bold_txtlocation">Operated in:</span> English
                                </p>
                            </div>
                            <div class="txt_button_excluing">
                                <p class="excluding_explore">Excluding international flights</p>
                                <div class="d-flex flex-column align-items-center">
                                    <div class="d-flex flex-column flex-sm-row justify-content-center" style="gap: 16px; width: 100%">
                                        <button class="btn btn-request-book btn-hover-home">Request a quote</button>
                                        <button class="btn btn-request-book btn-hover-home">Book it now</button>
                                    </div>
                                    <button class="btn btn-download">Download itinerary</button>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="list_class_tour">
        <div class="">
            <div class="class-tour">
                <div class="top-section container">
                    <ul class="nav list_nav">
                        <li class="nav-item"><a class="nav-link active" data-target=".section_overview">Overview</a></li>
                        <li class="nav-item"><a class="nav-link" data-target=".section_itinerary">Itinerary</a></li>
                        <li class="nav-item"><a class="nav-link" data-target=".section_inclusion">Inclusion</a></li>
                        <li class="nav-item"><a class="nav-link" data-target=".section_price">Price</a></li>
                        <li class="nav-item"><a class="nav-link" data-target=".section_review_tour">Reviews</a></li>
                        <li class="nav-item"><a class="nav-link" data-target=".des_list_faq">Q&As</a></li>
                    </ul>

                    <div class="price_button">
                        <div class="txt_numbpricetour">
                            <p class="txt_numbtour">From US <span class="under_numbprice">${$oneItem.min_price}</span> <span
                                        class="number_pricetour">${$clsTour->getDiscount($tour_id, $oneItem.min_price)}</span> /pax </p>
                            <button class="btn btn-inquirenow btn-hover-home">Book Now</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="list_tourdetails">
        <div class="love-trip">
            <div class="container">
                <div class="tab-content">
                    <div class="tab-pane active section_overview" id="overview">
                        <div class="txt_lovetrip d-flex">
                            <div class="txt_triplove_parent">
                                <h2 class="txt_triplove">You will love this trip</h2>
                            </div>
                            <div class="list_willlove">
                                {$oneItem.love_trip|html_entity_decode}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="tab-pane section_itinerary" id="itinerary">
            <div class="container">
                <h2 class="txt_mapiti">Trip map &amp itinerary</h2>
                <div class="detail_tours">
                    <div class="detail_mapitine">
                        <div class="img_maps_parent"><img class="img_maps"
                             src="{$URL_IMAGES}/tour/img_maps.png"></div>
                        <div class="daytour">
                            <div class="txtdaybyday">
                                <h2 class="txt_daytours">Day by day itinerary</h2>
                                <button class="btn btn-expand">Expand all</button>
                            </div>
                            <div class="accordion" id="accordionExample">
                                <ul class="timeline">
                                    {section name=i loop=$lstTourItinerary}
                                        <li>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button" type="button"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#collapse{$lstTourItinerary[i].tour_itinerary_id}"
                                                            aria-expanded="true"
                                                            aria-controls="collapse{$lstTourItinerary[i].tour_itinerary_id}">
                                                        Day {$lstTourItinerary[i].day}: {$lstTourItinerary[i].title}
                                                    </button>
                                                </h2>
                                                <div id="collapse{$lstTourItinerary[i].tour_itinerary_id}"
                                                     class="accordion-collapse collapse"
                                                     data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        {$lstTourItinerary[i].content|html_entity_decode}
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    {/section}
                                </ul>
                            </div>
                        </div>
                        <div class="contact_travelling">
                            <div class="contact-info">
                                <div class="avatar">
                                    <img src="{URL_IMAGES}/tour/avatar_travel_rounded.png" alt="Avatar">
                                </div>
                                <div class="details">
                                    <h3 class="txt_trevllingous">"{$core->get_Lang('TRAVELING IS OUR PASSION')}"</h3>
                                    <p class="txt_destravel">{$core->get_Lang('Let us help you plan an unforgettable trip!')}</p>
                                    <p class="txt_destravel"><i class="fa-solid fa-phone"></i> Whatapps: 0983033966</p>
                                </div>
                                <a href="{$clsTour->getLink2(0,1)}" class="btn btn-tailor btn-hover-home">Tailor Made Tour</a>
                            </div>
                        </div>

                        <div class="price_tour section_price">
                            <h2 class="txt_price">Price</h2>

                            <p class="txt_pricedes">Select departure date and number of guests</p>
                            <div class="select_pricetour">
                                <input type="date" id="date-picker" class="date_selecttour">
                                <select id="tour-select" class="date_selecttour">
                                    <option value="">2 Adults, 1 Children</option>
                                    <option value="tour1">Tour 1</option>
                                    <option value="tour2">Tour 2</option>
                                </select>
                                <button id="btn check-btnn" class="check-btnn btn-hover-home">Check Availability
                                </button>
                            </div>
                        </div>

                        <div class="infor_pricetour">
                            <div class="container">
                                <div class="txt_inf_locationtime">
                                    <h3 class="txt_infprice">{$clsTour->getTitle($tour_id)}</h3>
                                    <div class="location_daytime">
                                        <p class="txt_location"><i class="fa-regular fa-location-dot"
                                                                   style="color: #004ea8;"></i>Ha Noi
                                            <span style="color:#D3DCE1"> |</span> <span class="txt_timedays"><i
                                                        class="fa-solid fa-clock-three" style="color: #434b5c;"></i>10 Days 9 Nights</span>
                                        </p>
                                    </div>
                                    <hr style="opacity: 0.1; background: #111D37">
                                    <div class="type_price">
                                        <div class="txt_price_type">
                                            <p class="txt_typeprice">Customer Type</p>
                                            <p class="txt_typeprice">Price</p>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col-md-4">2 Adults</div>
                                            <div class="col-md-4 text-center">x US $1250</div>
                                            <div class="col-md-4 text-end">US <span class="bold_txtprice">$1250</span>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col-md-4">1 Children (0-16age)</div>
                                            <div class="col-md-4 text-center">x US $900</div>
                                            <div class="col-md-4 text-end">US <span class="bold_txtprice">$900</span>
                                            </div>
                                        </div>

                                        <hr style="opacity: 0.1; background: #111D37;">
                                        <div class="price_total">
                                            <p class="txt_typeprice">Total price:</p>
                                            <p class="txt_monpr">US <span class="numb_pr">$3400</span></p>
                                        </div>
                                        <div class="txt_policy">
                                            <p class="txt_regard">
                                                Regarding cancellation conditions, please read our policy.  <a href="#"
                                                                                                               style="color: #3F6DF6">Booking
                                                    Policy</a></p>
                                            <p class="txt_regard">You can reserve now & pay later with this tour
                                                option.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg_btnbook">
                                <div class="numbtxtbook">
                                    <div class="price-wrapper"><h3 class="txt_numbus">US</h3>
                                        <h2 class="txt_numbus2">$3400</h2>
                                    </div>
                                    <p class="txt_desus">All taxes and fees included</p>
                                </div>
                                <button class="btn txt_booking">Booking now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <section class="bg_inclusion section_inclusion" id="inclusion">
        <div class="container">
            <h2 class="txt_inclusions">Inclusions</h2>
            <div class="bg_inexclues">
                <div class="included">
                    <h3 class="txt_inborder">Included</h3>
                    {$oneItem.inclusion|html_entity_decode}
                </div>
                <div class="excluded">
                    <h3 class="txt_exborder">Excluded</h3>
                    {$oneItem.exclusion|html_entity_decode}
                </div>
            </div>
            <div class="booking_policy">
                <div class="row">
                    <div class="col-3"><h3 class="title_booking_policy">BOOKING POLICY</h3></div>
                    <div class="col-9">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
                        took a galley of type and scrambled it to make a type specimen book. It has survived not only
                        five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="review_tour" class="section_review_tour">
        <h2 class="title_review_tour">Review</h2>
        <div class="reviews_box_top">
            <div class="row review-evaluation">
                <div class="col-lg-4 measure-evaluation">
                    <div class="box_score">
                        <div class="semi-donut margin" style="--percentage : {($averageRate / $sumRate) * 100}; --fill: #FFBA55 ;"></div>
                        <div class="score_text">
                            <h3 class="point_rate">{$averageRate}</h3>
                            <div class="txt_score">{$txt_rv}</div>
                            <div class="number_review">
                                ({$countReview} {$core->get_Lang('Reviews')})
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="progress_parent">
                        {section name=i loop=$reviewProgress}
                        <div class="progress_child">
                            <div class="txt_content">{$reviewProgress[i].reviews}</div>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"
                                     aria-valuemin="0" aria-valuemax="100" style="width:{$reviewProgress[i].count_percent}%">
                                </div>
                            </div>
                            <div class="count_review">{$reviewProgress[i].count}</div>
                        </div>
                        {/section}
                        <a class="btn_write_review fr" href="javascript:void(0);" title="{$core->get_Lang('Write a review')}">{$core->get_Lang('Write a review')}</a>
                    </div>
                </div>
            </div>
            {$core->getBlock('review_tour')}
        </div>
        <div class="list_reviews">
            {if $lstReviews}
            {section name=i loop=$lstReviews}
                <div class="review">
                    <div class="person_review">
                        {assign var=numStars value=$lstReviews[i].rates}
                        <div class="avatar_custom" style="background-color:
                        {php}
                                $bg_colors = ['#FFA718', '#FFF9F1', '#004EA8', '#111D37', '#959AA4', '#13B97D'];
                                echo $bg_colors[array_rand($bg_colors)];
                        {/php}">{strtoupper(substr($lstReviews[i].fullname, 0, 2))}</div>
                        <div class="name_reviewer">
                            <p class="name">{$lstReviews[i].fullname}</p>
                            <p class="time_review">{$lstReviews[i].review_date|date_format:"%d %b, %Y"}</p>
                        </div>
                    </div>
                    <div class="stars_review">
                        {assign var=numStars value=$lstReviews[i].rates}
                        {assign var=remainingStars value=$maxStars - $numStars}
                        {section name=j loop=$numStars}
                            <i class="fa-solid fa-star"></i>
                        {/section}
                        {section name=k loop=$remainingStars}
                            <i class="fa-regular fa-star"></i>
                        {/section}
                    </div>
                    <p class="title_review">{$lstReviews[i].title}</p>
                    <p class="content_review">{$lstReviews[i].content}</p>
                    <button class="view_more_review d-none">View more</button>
                </div>
            {/section}
            {else}
                <div>Not yet reviews</div>
            {/if}
        </div>
    </section>
    {$core->getBlock('des_list_faq')}

    {if $lstRelateTour}
    <section id="maybe_interested">
        <div class="maybe_you_interest container">
            <h2 class="txtInterested">May be you are interested</h2>
            <div class="recently-view">
                <div class="related_tours owl-carousel" id="maybe_interest">
                    {section name=i loop=$lstRelateTour}
                        <div class="list_viewtour">
                            <div class="img_toursrelated">
                                <a href="{$clsTour->getLink($lstRelateTour[i].tour_id)}"><img
                                            src="{$lstRelateTour[i].image}"
                                            alt="{$lstRelateTour[i].title}" class="img-fluid"> </a>
                            </div>
                            <div class="txt_des_tour">
                                <h3>
                                    <a class="txth_relatedtour txt-hover-home"
                                       href="{$clsTour->getLink($lstRelateTour[i].tour_id)}" alt="tour"
                                       title="tour">{$lstRelateTour[i].title}</a>
                                </h3>
                                <div class="d-flex align-items-center score_reviewtour"><span class="border_score">9.9</span>
                                    <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
                                </div>
                                <div class="d-flex align-items-center">
                                    <i class="fa-light fa-location-dot" style="color: #43485c;"
                                       aria-hidden="true"></i>
                                    <span class="txt_placetours">Place: {$clsTourDestination->getByCountry($lstRelateTour[i].tour_id, 'city')}</span>
                                    {if $clsTourDestination->getByCountry($lstRelateTour[i].tour_id)}
                                        <button type="button" class="tooltips_tour" data-bs-toggle="tooltip"
                                                title="{$clsTourDestination->getByCountry($lstRelateTour[i].tour_id, 'other_city')}">
                                            +{$clsTourDestination->getByCountry($lstRelateTour[i].tour_id)}
                                        </button>
                                    {/if}
                                </div>
                                <div class="intro_recent_view_tour">{$lstRelateTour[i].overview|html_entity_decode}</div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="from_price"><p class="from_txtp">From</p> <span
                                                class="txt_price">US
                                            <h3 class="txt_numbprice"> ${$lstRelateTour[i].min_price}</h3> </span>
                                    </div>
                                    <a href="{$clsTour->getLink($lstRelateTour[i].tour_id)}" alt="tour"
                                       title="tour">
                                        <button class="btn btn_viewtour btn-hover-home">View Tour <i
                                                    class="fa-regular fa-arrow-right" style="color: #ffffff;"
                                                    aria-hidden="true"></i></button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/section}
                </div>
            </div>
        </div>
    </section>
    {/if}

    <section id="recently-view" class="container">
        {if $lstTourRecent}
            <div class="recently-view">
                <h2 class="recently-view-title">{$core->get_Lang('Recently viewed')}</h2>
                <div class="related_tours row">
                    {section name=i loop=$lstTourRecent}
                        <div class="list_viewtour">
                            <div class="img_toursrelated">
                                <a href="{$clsTour->getLink($lstTourRecent[i].tour_id)}"><img
                                            src="{$lstTourRecent[i].image}"
                                            alt="{$lstTourRecent[i].title}" class="img-fluid"> </a>
                            </div>
                            <div class="txt_des_tour">
                                <h3>
                                    <a class="txth_relatedtour txt-hover-home" href="{$clsTour->getLink($lstTourRecent[i].tour_id)}" alt="tour" title="tour">{$lstTourRecent[i].title}</a>
                                </h3>
                                <div class="d-flex align-items-center score_reviewtour"><span class="border_score">9.9</span>
                                    <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
                                </div>
                                <div class="d-flex align-items-center">
                                    <i class="fa-light fa-location-dot" style="color: #43485c;" aria-hidden="true"></i>
                                    <span class="txt_placetours">Place: {$clsTourDestination->getByCountry($lstTourRecent[i].tour_id, 'city')}</span>
                                    {if $clsTourDestination->getByCountry($lstTourRecent[i].tour_id)}
                                        <button type="button" class="tooltips_tour" data-bs-toggle="tooltip" title="{$clsTourDestination->getByCountry($lstTourRecent[i].tour_id, 'other_city')}">
                                            +{$clsTourDestination->getByCountry($lstTourRecent[i].tour_id)}
                                        </button>
                                    {/if}
                                </div>
                                <div class="intro_recent_view_tour">{$lstTourRecent[i].overview|html_entity_decode}</div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="from_price"><p class="from_txtp">From</p> <span
                                                class="txt_price">US
												<h3 class="txt_numbprice"> ${$lstTourRecent[i].min_price}</h3> </span></div>
                                    <a href="{$clsTour->getLink($lstTourRecent[i].tour_id)}" alt="tour" title="tour">
                                        <button class="btn btn_viewtour btn-hover-home">View Tour <i
                                                    class="fa-regular fa-arrow-right" style="color: #ffffff;"
                                                    aria-hidden="true"></i></button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/section}
                </div>
            </div>
        {/if}
    </section>

    {$core->getBlock("why_choose_us")}
    <section class="framevideotxt">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 position-relative">
                    <a class="position-relative" href="{$clsConfiguration->getValue('LinkVideoPerfect_'|cat:$_LANG_ID)}"
                       data-fancybox="gallery">
                        <img class="videoplaypic" src="{$clsConfiguration->getValue('ThumbnailYoutube_'|cat:$_LANG_ID)}"
                             alt="videopic" width="588"
                             height="330">
                        <div class="icon-play">
                            <i class="fa-solid fa-play" id="icon"></i>
                            <span class="wave_1"></span>
                            <span class="wave_2"></span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6 d-flex flex-column justify-content-center txt_readylets">
                    <h2 class="txtready">{$clsConfiguration->getValue('TitleVideoPerfect_'|cat:$_LANG_ID)|html_entity_decode}</h2>
                    <div class="txtcomt">{$clsConfiguration->getValue('IntroVideoPerfect_'|cat:$_LANG_ID)|html_entity_decode}</div>
                    <a href="/customised" class="btn readyToStart-btn">{$core->get_Lang('LET’S PLAN YOUR TRIP')}
                        <img class="ms-2"
                             src="https://unikasia.vietiso.com/isocms/templates/default/skin/images/hotel/ArrowRight.svg"
                             alt="error">
                    </a>
                </div>
            </div>
        </div>
    </section>
</main>
{literal}
    <script>
        Fancybox.bind('#gallery_detail_tour .img_tourdetail', {
            groupAll: true,
        });
        Fancybox.bind("[data-fancybox]", {

        });
        $(document).ready(function() {
            $('#gallery_detail_tour').owlCarousel({
                loop: false,
                margin: 10,
                nav: true,
                navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],
                dots: false,
                autoplay: true,
                items: 1
            })
            $('.btn_write_review').click(function () {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active');
                    $('#writeTourReview').hide(500);
                } else {
                    $(this).addClass('active');
                    $('#writeTourReview').show(500);
                }
            });

            $('#maybe_interest').owlCarousel({
                loop: true,
                margin: 32,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 4
                    }
                }
            })
        })
        document.addEventListener('DOMContentLoaded', () => {
            const links = document.querySelectorAll('.nav-link');

            links.forEach(link => {
                link.addEventListener('click', (event) => {
                    $('.nav-link').removeClass('active');
                    $(event.currentTarget).addClass('active');
                    const targetClass = event.currentTarget.getAttribute('data-target');
                    const targetElement = document.querySelector(targetClass);
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 210,
                            behavior: 'smooth'
                        });
                    }
                });
            })
            window.onscroll = function() {
                if (window.scrollY >= 630) {
                    $('.class-tour').addClass('list_nav_fixed');
                } else {
                    $('.class-tour').removeClass('list_nav_fixed');
                }
            }
            $('.btn-expand').click(function() {
                const $accordionCollapse = $(".accordion-collapse.collapse");
                $accordionCollapse.addClass('show');
                if ($(this).hasClass('expand')) {
                    $(this).removeClass('expand').text('Expand all');
                    $accordionCollapse.removeClass('show');
                } else {
                    $(this).addClass('expand').text('Collapse all');
                    $accordionCollapse.addClass('show');
                }
            });
        });
    </script>
{/literal}