<section class="exploretrip">
    <div class="container">
        <h2 class="txtourtrip txt_underline">{$clsConfiguration->getValue('TitleExploreTrips_'|cat:$_LANG_ID)|html_entity_decode}</h2>
        <div class="txtexper">{$clsConfiguration->getValue('IntroExploreTrips_'|cat:$_LANG_ID)|html_entity_decode}</div>
        <div class="row justify-content-center">
            {section name=i loop=$listTourExplore}
                <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
                    <div class="card img_sizecard">
                        <div class="card-img-wrapper">
                            <img src="{$clsClassTable->getImage($listTourExplore[i].tour_id, '1000','1000')}"
                                 class="card-img-top" alt="{$listTourExplore[i].title}">
                            <div class="corner-badge">-30%</div>
                            <div class="card-img-top card-img-top-view-detail">
                                <a href="#" title="splendors of vietnam">
                                    <div class="card-img-top-view-detail-block">View details</div>
                                </a>
                            </div>
                        </div>
                        <div class="card-body card_alltxt">
                            <div class="card_text">
                                <h3><a class="title_card_explore_trip txt-hover-home" href="#"
                                                              title="{$clsClassTable->getTitle($listTourExplore[i].tour_id)}">{$clsClassTable->getTitle($listTourExplore[i].tour_id)}</a>
                                </h3>
                                <div class="rating">
                                    <i class="fa-sharp fa-solid fa-star"></i>
                                    <i class="fa-sharp fa-solid fa-star"></i>
                                    <i class="fa-sharp fa-solid fa-star"></i>
                                    <i class="fa-sharp fa-solid fa-star"></i>
                                    <i class="fa-sharp fa-solid fa-star"></i>
                                    <span class="ml-2">4.5</span>
                                </div>
                                <div class="category-imgtxt">
                                    <i class="fa-light fa-location-dot me-1"></i>
                                    <span>Honduras, Guatemala, El Salvador</span>
                                </div>
                                <div class="description">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas lorem et
                                        sollicitudin et. Facilisi scelerisque faucibus eu dolor enim risus sed. Sed
                                        enim auctor nibh sapien. </p>
                                </div>
                                <div class="details">
                                    <div>
                                        <i class="fa-regular fa-clock" style="color: #0091ff;"></i>
                                        <span>19 days</span>
                                    </div>
                                    <div class="txtfromprice">
                                        <span class="txtfrom">From</span>
                                        <span class="txt_unit">US</span>
                                        <span class="numbprice">$650</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/section}

            <div class="btnviewmore text-center">
                <a href="/list-tour" class="btn btn-exploremore btn-hover-home">Explore More <i
                            class="fa-solid fa-right-long"
                            style="color: #ffffff; margin-left: 8px;"></i>
                </a>
            </div>
        </div>
    </div>
</section>