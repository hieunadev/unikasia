{assign var=maxStars value=5}
<section class="customersay">
    <div class="container">
        <h2 class="txtreviews_">Reviews</h2>
        <div class="customer_cards owl-carousel owl-theme" id="home_customer_reivews">
            {section name=i loop=$listReview}
                <div class="customer_card item">
                    <img class="customer_card_thumb" src="{$listReview[i].image}" alt="">
                    <div class="customer_review">
                        <div class="customer_stars">
                            {assign var=numStars value=$listReview[i].rates}
                            {assign var=remainingStars value=$maxStars - $numStars}
                            {section name=j loop=$numStars}
                                <i class="fa-solid fa-star"></i>
                            {/section}
                            {section name=k loop=$remainingStars}
                                <i class="fa-regular fa-star"></i>
                            {/section}
                        </div>
                        <h3 class="customer_review_h3">{$listReview[i].title}</h3>
                        <div class="content">{$listReview[i].intro|html_entity_decode}</div>
                        <a class="more_review" onclick="toggleIntroReview(this)">{$core->get_Lang('View more')}</a>
                        <div class="customer_avt">
                            <img src="{$URL_IMAGES}/home/avatar1.png" alt="">
                            <div class="customer_name">
                                <p>{$listReview[i].fullname}</p>
                                <span>{$listReview[i].reg_date|date_format:"%d %b, %Y"}</span>
                            </div>
                        </div>
                    </div>
                </div>
            {/section}
        </div>
    </div>
</section>
{literal}
    <script>
        function toggleIntroReview(link) {
            let content = $(link).parent().find(".content");
            let contentHeight = content.height();
            if (contentHeight < 122) {
                content.css("max-height", "none");
                $(link).hide();
            }

            let buttonText = $(link).text().trim();
            if (buttonText === "View more") {
                content.css("max-height", "none");
                $(link).text("View less");
            } else {
                $(link).text("View more");
                content.css("max-height", "122px");
            }
        }
    </script>
{/literal}