{literal}
<style>
    .destination_ul li {
        margin: 0 0 5px;
    }
    .destination_ul li .d-flex .title_place {
        font-size: 14px;
        font-weight: 600;
        display: flex;
        flex-direction: column;
    }
    .destination_ul li .d-flex span.label_place {
        display: flex;
        flex-direction: column;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 5px;
        width: auto;
        min-width: 65px;
        text-align: center;
        margin-left: auto;
        font-size: 14px;
    }
    .destination_ul li .d-flex span.label_place .text {
        color: #EBA743;
    }
</style>
{/literal}

<main id="nah_list_tour">
    <section class="banner_tour">
        <img src="https://isocms.com/files/thumb/1920/400/uploads/Destinations/Hanoi/Hanoi2-1652338755-3632-1652338809.jpg" alt="">
        <h2 class="title_tour_h2">VIETNAM TOURS PACKAGES</h2>
    </section>
    <section class="breadcrumb container">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);"
             aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Destinations</li>
                <li class="breadcrumb-item active" aria-current="page">Vietname</li>
                <li class="breadcrumb-item active" aria-current="page">Tours</li>
            </ol>
        </nav>
    </section>
    <section class="tour-packages">
        <div class="container">
            <div class="row">
                <div class="col-3 ps-lg-0">
                    <p class="sort-filter">Sort & filter</p>
                    <form action="" method="post">
                        <div class="destination">
                            <p class="txt_destination">Destinations</p>
                            <div class="filter-radio">
                                {section name=i loop=$lstCountry}
                                    <div class="form-check">
                                        <input class="form-check-input custom-control-input typeSearch" type="radio"
                                               name="country_id" id="radio-{$lstCountry[i].title}" value="{$lstCountry[i].country_id}"
                                        {if $lstCountry[i].country_id == $country_id} checked{/if}>
                                        <label class="form-check-label custom-control-label" for="radio-{$lstCountry[i].title}">
                                            {$lstCountry[i].title} </label>
                                    </div>
                                {/section}
                            </div>
                        </div>
                        {if $lstRegion}
                        <div class="regions">
                            <p class="txt_regions">Regions</p>
                            <div class="filter-check">
                                {section name=i loop=$lstRegion}
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="region_{$lstRegion[i].title}">
                                    <label class="form-check-label" for="region_{$lstRegion[i].title}">{$lstRegion[i].title}</label>
                                </div>
                                {/section}
                            </div>
                        </div>
                        {/if}
                        <div class="duration">
                            <p class="txt_duration">Duration</p>
                            <div class="filter-check">
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="one-week">
                                    <label class="form-check-label" for="one-week">One-week</label>
                                </div>
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="two-weeks">
                                    <label class="form-check-label" for="two-weeks">Two-weeks</label>
                                </div>
                            </div>
                        </div>
                        <div class="travel-styles filter_view_more">
                            <p class="txt_travel_styles">Travel styles</p>
                            <div class="filter-check">
                                {section name=i loop=$lstTourCat}
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="travel_style_{$lstTourCat[i].tourcat_id}">
                                    <label class="form-check-label" for="travel_style_{$lstTourCat[i].tourcat_id}">{$lstTourCat[i].title}</label>
                                </div>
                                {/section}
                            </div>
                            <p class="view_more">View more</p>
                        </div>
                        <div class="departure-time filter_view_more">
                            <p class="txt_departure_time">Departure time</p>
                            <div class="filter-check">
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="january">
                                    <label class="form-check-label" for="january">January</label>
                                </div>
                                <div class="form-check show">
                                    <input class="form-check-input" type="checkbox" id="feb">
                                    <label class="form-check-label" for="feb">February</label>
                                </div>
                            </div>
                            <p class="view_more">View more</p>
                        </div>
                        <input type="hidden" name="filter" value="filter">
                    </form>
                </div>
                <div class="col-9 pe-lg-0 list-tour-right">
                    <div class="content-top">
                        <div class="txt_content">{$clsConfiguration->getValue(site_tour_intro_|cat:$_LANG_ID)|html_entity_decode}</div>
                    </div>
                    <h2 class="count-tour">{$totalRecord} Vietnam tour packages</h2>
                    <div class="recommend">
                        <span>70+ Tour packages with 20K+ bookings</span>
                    </div>
                    <div class="list-tour">
                        {section name=i loop=$lstTour}
                            <div class="list-tour-item">
                                <div class="img_tour">
                                    <a class="photo img-tour-parent" href="{$clsTour->getLink($lstTour[i].tour_id)}">
                                        <img class="img-tour"
                                             src="{$lstTour[i].image}"
                                             alt="{$lstTour[i].title}"
                                             onerror="this.src='{$URL_IMAGES}/none_image.png'">
                                    </a>
                                </div>
                                <div class="item-center">
                                    <h3><a class="txt_title_tour txt-hover-home" href="{$clsTour->getLink($lstTour[i].tour_id)}">{$lstTour[i].title}</a></h3>
                                    <div class="reviews">
                                        <span class="rate_number">9.9</span>
                                        <span class="text_score">Excellent</span>
                                        <span class="txt_review"> - 10 reviews</span>
                                    </div>
                                    <div class="txt_quot d-flex align-items-start">
                                        <img class="me-2" src="{$URL_IMAGES}/tour/quot.svg" alt=""><div>{$clsISO->limit_textIso($lstTour[i].overview|html_entity_decode, 20)}</div>
                                    </div>
                                    <div class="txt_place">
                                        <img class="me-2" src="{$URL_IMAGES}/tour/location.svg" alt="">Place: {$clsTourDestination->getByCountry($lstTour[i].tour_id)}
                                    </div>
                                    <div class="txt_place">
                                        <img class="me-2" src="{$URL_IMAGES}/tour/fluent.svg" alt="">Start/finish: {$clsTourDestination->getByCountry($lstTour[i].tour_id, "startFinish")}
                                    </div>
                                    <div class="txt_place">
                                        <img class="me-2" src="{$URL_IMAGES}/tour/park.svg" alt="">Travel style: {$clsTour->getListCatName($lstTour[i].tour_id)}
                                    </div>
                                </div>
                                <div class="box-view-tour">
                                    <div class="prices text-right">
                                        <p class="day">{$lstTour[i].number_day} {if $lstTour[i].number_day lt 2}DAY {else} DAYS {/if}</p>
                                        <p class="from">From <span class="text-decoration-line-through">$2,049</span></p>
                                        <p class="us">US ${$lstTour[i].min_price}</p>
                                    </div>
                                    <div class="btn-view-tour mt-auto">
                                        <a class="btn-hover-home" href="{$clsTour->getLink($lstTour[i].tour_id)}"><span>View tour</span><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        {/section}
                    </div>
                    <div class="tour-pagination d-flex justify-content-center mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                {$page_view}
                            </ul>
                        </nav>
                    </div>
                    <div class="recently-view">
                        <h2 class="recently-view-title">{$core->get_Lang('Recently viewed')}</h2>
                        <div class="related_tours">
                            <div class="list_viewtour">
                                <div class="img_toursrelated">
                                    <div class="bloglastest"><a href="#" alt="tour" title="tour"> <img
                                                    src="https://unikasia.vietiso.com/isocms/templates/default/skin/images/blog/img_relativeblog1.png"
                                                    alt="Pic_relatedtour" class="img-fluid"> </a></div>
                                    <a href="#" alt="tour" title="tour"> </a></div>
                                <a href="#" alt="tour" title="tour"> </a>
                                <div class="txt_des_tour"><a href="#" alt="tour" title="tour"><h3
                                                class="txth_relatedtour">Splendors of Vietnam with the center’s
                                            must-sees 19
                                            days</h3></a>
                                    <div class="d-flex align-items-center score_reviewtour"><span class="border_score">9.9</span>
                                        <span class="txt_score">Excellent </span> <span class="txt_reviewstour">- 10 views</span>
                                    </div>
                                    <div class="d-flex align-items-center"><i class="fa-light fa-location-dot"
                                                                              style="color: #43485c;"
                                                                              aria-hidden="true"></i> <span
                                                class="txt_placetours">Place: Hanoi – Halong – Hue – Hoian</span> <span
                                                class="border_place">+2</span></div>
                                    <p>Les “MUST” + découverte des Ethnies du Nord “À NE PAS MANQUER” et la nuit étoilée
                                        sur la jonque traditionnelle en baie […]</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="from_price"><p class="from_txtp">From</p> <span class="txt_price">US
												<h3 class="txt_numbprice"> $650</h3> </span></div>
                                        <a href="#" alt="tour" title="tour">
                                            <button class="btn btn_viewtour">View Tour <i
                                                        class="fa-regular fa-arrow-right" style="color: #ffffff;"
                                                        aria-hidden="true"></i></button>
                                        </a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="tailor-made">
        <div class="container tailorMadeCenter">
            <div class="row">
                <div class="col-8 txt_tailor_left">
                    <h2 class="tailor-made_title">Our travel experts will be happy to help you realize your project and
                        find
                        the trip that suits you.</h2>
                    <p class="content">Our Vietnam Tours offer to a real change of scenery. We offer you many
                        possibilities
                        to experience an exceptional tour in Vietnam and come back with unforgettable memories. Check
                        out
                        our tours in Vietnam and discover the mythical and fascinating site of Ha Long Bay, the Mekong
                        Delta
                        with its sublime terraced rice fields, Hanoi, which has remained perfectly authentic, the
                        archaeological site of My Son and its amazing ruins, or Hue and its sumptuous royal tombs.
                        Discover
                        the authenticity and beauty of Vietnam with us. </p>
                </div>
                <div class="col-4 center-div"><a class="btn-tailor" href="#"><span>TAILOR MADE TOUR</span></a></div>
            </div>
        </div>
    </section>
    {$core->getBlock("customer_review")}
    {$core->getBlock("top_attraction")}
    {$core->getBlock('also_like')}
</main>
{literal}
<script>
    $(document).ready(function(){
        $('.typeSearch').change(function() {
            $(this).closest('form').submit();
        });

        $(".travel-styles").find(".form-check:gt(4)").hide();
        $(".departure-time").find(".form-check:gt(4)").hide();
        if ($(".travel-styles .form-check ").length <= 5) $(".travel-styles .view_more").hide();
        if ($(".departure-time .form-check ").length <= 5) $(".departure-time .view_more").hide();

        $(document).on("click", ".view_more", function() {
            const $_this = $(this);
            if (!$_this.hasClass("less")) {
                $_this.addClass("less");
                $_this.closest(".filter_view_more").find(".filter-check").removeClass("short");
                $_this.closest(".filter_view_more").find(".form-check").show();
                $_this.html('View less');
            } else {
                $_this.removeClass("less");
                $_this.closest(".filter_view_more").find(".filter-check").addClass("short");
                $_this.closest(".filter_view_more").find(".form-check:gt(4)").hide();
                $_this.html('View more');
            }
        });
    });
</script>
{/literal}