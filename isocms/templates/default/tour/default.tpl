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
    <section class="title_tour_h2"><h2>VIETNAM TOURS PACKAGES</h2></section>
    <section class="breadcrumb container">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);"
             aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Destination</li>
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
                    <div class="destination">
                        <p class="txt_destination">Destination</p>
                        <div class="filter-radio">
                            <div class="form-check"><input class="form-check-input custom-control-input" type="radio"
                                                           name="country" id="flexRadioDefault1" value="all" checked="">
                                <label class="form-check-label custom-control-label" for="flexRadioDefault1">
                                    All </label></div>
                            <div class="form-check"><input class="form-check-input custom-control-input" type="radio"
                                                           name="country" id="country_id_1" value="1"> <label
                                        class="form-check-label custom-control-label" for="country_id_1">
                                    Vietnam </label></div>
                            <div class="form-check"><input class="form-check-input custom-control-input" type="radio"
                                                           name="country" id="country_id_3" value="3"> <label
                                        class="form-check-label custom-control-label" for="country_id_3">
                                    Thailand </label></div>
                            <div class="form-check"><input class="form-check-input custom-control-input" type="radio"
                                                           name="country" id="country_id_7" value="7"> <label
                                        class="form-check-label custom-control-label" for="country_id_7">
                                    Cambodia </label></div>
                            <div class="form-check"><input class="form-check-input custom-control-input" type="radio"
                                                           name="country" id="country_id_2" value="2"> <label
                                        class="form-check-label custom-control-label" for="country_id_2"> Laos </label>
                            </div>
                        </div>
                    </div>
                    <div class="regions">
                        <p class="txt_regions">Regions</p>
                        <div class="filter-check">
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="nord">
                                <label class="form-check-label" for="nord">Nord</label>
                            </div>
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="south">
                                <label class="form-check-label" for="south">South</label>
                            </div>
                        </div>
                    </div>
                    <div class="duration">
                        <p class="txt_duration">Duration</p>
                        <div class="filter-check">
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="one-week">
                                <label class="form-check-label" for="one-week">One-week</label>
                            </div>
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="two-weeks">
                                <label class="form-check-label" for="two-weeks">Two-weeks</label>
                            </div>
                        </div>
                    </div>
                    <div class="travel-styles">
                        <p class="txt_travel_styles">Travel styles</p>
                        <div class="filter-check">
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="explorer">
                                <label class="form-check-label" for="explorer">Explorer</label>
                            </div>
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="In-depth">
                                <label class="form-check-label" for="In-depth">In-depth</label>
                            </div>
                        </div>
                        <p class="view_more">View more</p>
                    </div>
                    <div class="depature-time">
                        <p class="txt_depature_time">Depature time</p>
                        <div class="filter-check">
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="january">
                                <label class="form-check-label" for="january">January</label>
                            </div>
                            <div class="form-check show">
                                <input class="form-check-input city 1" type="checkbox" id="feb">
                                <label class="form-check-label" for="feb">February</label>
                            </div>
                        </div>
                        <p class="view_more">View more</p>
                    </div>
                </div>
                <div class="col-9 pe-lg-0 list-tour-right">
                    <div class="content-top">
                        <div class="txt_content">{$clsConfiguration->getValue(site_tour_intro_|cat:$_LANG_ID)|html_entity_decode}</div>
                    </div>
                    <h2 class="count-tour">50 Vietnam tour packages</h2>
                    <div class="recommend">
                        <span>70+ Tour packages with 20K+ bookings</span>
                    </div>
                    <div class="list-tour">
						
						 

						{section name=i loop=1}

                        <div class="list-tour-item">
                            <div class="img_tour"><a class="photo" href="{$clsTour->getLink(160)}">
                                    <img class="img-tour"
                                         src="https://isocms.com/files/thumb/277/181/uploads/content/2023-07-18-09-20-51-64b5f703a4a3f081363791.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="item-center">
                                <h3 class="txt_title_tour">Splendors of Vietnam with the center’s must-sees 19 days</h3>
                                <div class="reviews">
                                    <span class="rate_number">9.9</span>
                                    <span class="text_score">Excellent</span>
                                    <span class="txt_review"> - 10 reviews</span>
                                </div>
                                <div class="txt_quot">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/quot.svg" alt="">The room was on the cozy
                                    side. The bed and linen were good, which was a relief. However, the bathrobes were a
                                    bit down...
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/location.svg" alt="">Place: Hanoi – Halong
                                    – Hue – Hoian
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/fluent.svg" alt="">Start/finish: Hanoi/Ho
                                    Chi Minh city
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/park.svg" alt="">Travel style: Family –
                                    classic – Adventure
                                </div>
                            </div>
                            <div class="box-view-tour">
                                <div class="prices text-right">
                                    <p class="day">19 DAYS</p>
                                    <p class="from">From <span class="text-decoration-line-through">$2,049</span></p>
                                    <p class="us">US $1250</p>
                                </div>
                                <div class="btn-view-tour mt-auto">
                                    <span>View tour</span><i class="fa fa-arrow-right" aria-hidden="true"></i>
                                </div>
                            </div>
							{/section}
                        </div>
                        <div class="list-tour-item">
                            <div class="img_tour"><a class="photo" href="#">
                                    <img class="img-tour"
                                         src="https://isocms.com/files/thumb/277/181/uploads/content/2023-07-18-09-20-51-64b5f703a4a3f081363791.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="item-center">
                                <h3 class="txt_title_tour">Splendors of Vietnam with the center’s must-sees 19 days</h3>
                                <div class="reviews">
                                    <span class="rate_number">9.9</span>
                                    <span class="text_score">Excellent</span>
                                    <span class="txt_review"> - 10 reviews</span>
                                </div>
                                <div class="txt_quot">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/quot.svg" alt="">The room was on the cozy
                                    side. The bed and linen were good, which was a relief. However, the bathrobes were a
                                    bit down...
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/location.svg" alt="">Place: Hanoi – Halong
                                    – Hue – Hoian
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/fluent.svg" alt="">Start/finish: Hanoi/Ho
                                    Chi Minh city
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/park.svg" alt="">Travel style: Family –
                                    classic – Adventure
                                </div>
                            </div>
                            <div class="box-view-tour">
                                <div class="prices text-right">
                                    <p class="day">19 DAYS</p>
                                    <p class="from">From <span class="text-decoration-line-through">$2,049</span></p>
                                    <p class="us">US $1250</p>
                                </div>
                                <div class="btn-view-tour mt-auto">
                                    <span>View tour</span><i class="fa fa-arrow-right" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                        <div class="list-tour-item">
                            <div class="img_tour"><a class="photo" href="#">
                                    <img class="img-tour"
                                         src="https://isocms.com/files/thumb/277/181/uploads/content/2023-07-18-09-20-51-64b5f703a4a3f081363791.jpg"
                                         alt="">
                                </a>
                            </div>
                            <div class="item-center">
                                <h3 class="txt_title_tour">Splendors of Vietnam with the center’s must-sees 19 days</h3>
                                <div class="reviews">
                                    <span class="rate_number">9.9</span>
                                    <span class="text_score">Excellent</span>
                                    <span class="txt_review"> - 10 reviews</span>
                                </div>
                                <div class="txt_quot">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/quot.svg" alt="">The room was on the cozy
                                    side. The bed and linen were good, which was a relief. However, the bathrobes were a
                                    bit down...
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/location.svg" alt="">Place: Hanoi – Halong
                                    – Hue – Hoian
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/fluent.svg" alt="">Start/finish: Hanoi/Ho
                                    Chi Minh city
                                </div>
                                <div class="txt_place">
                                    <img class="me-2" src="{$URL_IMAGES}/tour/park.svg" alt="">Travel style: Family –
                                    classic – Adventure
                                </div>
                            </div>
                            <div class="box-view-tour">
                                <div class="prices text-right">
                                    <p class="day">19 DAYS</p>
                                    <p class="from">From <span class="text-decoration-line-through">$2,049</span></p>
                                    <p class="us">US $1250</p>
                                </div>
                                <div class="btn-view-tour mt-auto">
                                    <span>View tour</span><i class="fa fa-arrow-right" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tour-pagination d-flex justify-content-center mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#"
                                                         aria-label="Next"> <i class="fa fa-chevron-left"></i>
                                    </a></li>
                                <li class="page-item"><a class="page-link paginate-active" href="#">1</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#"
                                                         aria-label="Next"> <i class="fa fa-chevron-right"></i>
                                    </a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="recently-view">
                        <h2 class="recentlyViewed">{$core->get_Lang('Recently viewed')}</h2>
                        <div class="clicked-details"></div>
                        <button class="btnShowViewed">{$core->get_Lang('More')}</button>
                        <button class="btnNoneViewed">{$core->get_Lang('Collapse all')}</button>
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
    $(function() {
        $('#destination_key').selectstyle({
            width: 500,
            height: 532,
            theme: 'light',
            onchange: function (val) {
            }
        });
    })
</script>
{/literal}