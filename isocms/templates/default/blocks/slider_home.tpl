<div id="wrapper">
    <div id="slider-area" class="owl-carousel">
        {section name=i loop=$listSlide}
        <div class="slider-area-child">
            <img src="{$clsSlide->getImage($listSlide[i].slide_id, 1920, 791)}" alt="{$listSlide[i].slug}">
            <div class="overlay"></div>
            <div class="txt_header_center">
                <h2 class="txt_h2">{$listSlide[i].title}</h2>
                <div class="text_pp">{$listSlide[i].text|html_entity_decode}</div>
                <div class="btn_follows text-center">
                    <a href="#" class="btn btn-follows btn-hover-home">{$listSlide[i].btn_slide}<i class="fa fa-long-arrow-right"
                                                                                                   style="color: #ffffff; margin-left: 8px;"></i></a>
                </div>
            </div>
        </div>
        {/section}
    </div>
</div>