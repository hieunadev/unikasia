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
                        <h3 class="card-title txt_title txt-hover-home" title="{$lstBlog[i].title}">{$clsISO->limit_textIso($lstBlog[i].title, 20)}</h3>
                        <div class="card-text txt_desc">{$lstBlog[i].intro|html_entity_decode}</div>
                        <div class="timestamp">
                            <i class="fa-regular fa-clock" style="color: #0091ff;"></i> <span
                                    class="txt_timedate">{$lstBlog[i].upd_date|date_format:"%d %b, %Y"} | {$clsBlogCat->getTitle($lstBlog[i].cat_id)} </span>
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