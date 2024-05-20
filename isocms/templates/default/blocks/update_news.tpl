<section class="newsupdate">
    <div class="container">
        <h2 class="txtupnews txt_underline">{$clsConfiguration->getValue('TitleUpdateNew_'|cat:$_LANG_ID)|html_entity_decode}</h2>
        <div id="carousel_home_news" class="owl-carousel owl-theme">
            {section name=i loop=$lstBlog}
            <div class="item">
                <div class="card card_img_txt">
                    <div class="update_news_img overflow-hidden"><img class="card-img-top" src="{$lstBlog[i].image}"
                         alt="{$lstBlog[i].slug}"></div>
                    <div class="card-body card_txt_btn">
                        <h3 class="card-title txt_title txt-hover-home">{$lstBlog[i].title}</h3>
                        <p class="card-text txt_desc">{$clsISO->limit_textIso($lstBlog[i].intro|html_entity_decode, 25)}</p>
                        <div class="timestamp">
                            <i class="fa-regular fa-clock" style="color: #0091ff;"></i> <span
                                    class="txt_timedate">10 Feb, 2024 | Travel Blog </span>
                        </div>
                        <div class="btn_viewm">
                            <a href="#" class="btn btn-viewmore btn-hover-home">{$core->get_Lang('View More')}<i
                                        class="fa-solid fa-right-long"
                                        style="color: #ffffff; margin-left: 8px;"></i></a>
                        </div>
                    </div>

                </div>
            </div>
            {/section}
        </div>
    </div>
</section>