<section class="newsupdate">
    <div class="container">
        <h2 class="txtupnews">{$core->get_Lang('The Update News')}</h2>
        <div id="carousel_home_news" class="owl-carousel owl-theme">
            {section name=i loop=$lstBlog}
            <div class="item">
                <div class="card card_img_txt">
                    <img class="card-img-top card_img_" src="{$lstBlog[i].image}"
                         alt="{$lstBlog[i].slug}">
                    <div class="card-body card_txt_btn">
                        <h3 class="card-title txt_title">{$lstBlog[i].title}</h3>
                        <p class="card-text txt_desc">{$clsISO->limit_textIso($lstBlog[i].intro|html_entity_decode, 25)}</p>
                        <div class="timestamp">
                            <i class="fa-regular fa-clock" style="color: #0091ff;"></i> <span
                                    class="txt_timedate">10 Feb, 2024 | Travel Blog </span>
                        </div>
                        <div class="btn_viewm">
                            <a href="#" class="btn btn-viewmore">{$core->get_Lang('View More')}<i
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