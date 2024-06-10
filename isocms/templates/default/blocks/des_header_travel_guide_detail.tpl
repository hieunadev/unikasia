{if ($mod eq 'destination' && $act eq 'travel_guide_detail') || ($mod eq 'guide' && $act eq 'detail')}
<div class="trvgd_header">
    <div class="row">
        <div class="col-md-7 col-lg-7">
            <div class="trvgd_header_image">
                <img src="https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Header Image" width="1034" height="861">
            </div>
        </div>
        <div class="col-md-5 col-lg-5">
            <div class="trvgd_header_intro">
                <span class="trvgd_header_place">
                    {$clsCountry->getTitle($guide_info['country_id'])} |
                    <a href="{$guidecat_link}" title="{$clsGuideCat->getTitle($guide_info['cat_id'])}">{$clsGuideCat->getTitle($guide_info['cat_id'])}</a>
                </span>
                <h1 class="trvgd_header_title">{$guide_info['title']}</h1>
                <div class="trvgd_header_description">
                    {$clsGuide->getIntro($guide_id)}
                </div>
                <div class="trvgd_header_source">
                    <div class="box_left">
                        <i class="fa-light fa-clock"></i> {$clsGuide->getUpdDate($guide_id)}
                    </div>
                    <div class="box_right">
                        <i class="fa-light fa-user"></i>
                        {assign var="oneUserUpdate" value=$clsUser->getOne($guide_info['user_id_update'],'first_name,last_name')}
                        {$oneUserUpdate.first_name} {$oneUserUpdate.last_name}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{elseif $mod eq 'destination' && $act eq 'attraction'}
<div class="trvgd_header">
    <div class="row">
        <div class="col-md-7 col-lg-7">
            <div class="trvgd_header_image">
                <img src="https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Header Image" width="1034" height="861">
            </div>
        </div>
        <div class="col-md-5 col-lg-5">
            <div class="trvgd_header_intro">
                <span class="trvgd_header_place">VIETNAM</span>
                <h1 class="trvgd_header_title">Hanoi Holidays</h1>
                <div class="trvgd_header_description">
                    If you are traveling throughout the North and are looking for a destination that combines a rich exploration of Vietnamese history and culture with the opportunity to enjoy unique and delicious local cuisine, then don't hesitate to come to Hanoi and experience the top best things to do in Hanoi for 3 days.
                </div>
            </div>
        </div>
    </div>
</div>
{/if}


{literal}
<style>
    .trvgd_header_image img {
        width: 100%;
        object-fit: cover;
    }

    .trvgd_header_intro {
        background: #111D37;
        padding: 220px 320px 220px 47px;
        color: #fff;
        height: 100%;
    }

    .trvgd_header_place,
    .trvgd_header_place a {
        color: #fff;
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 600;
        line-height: 24px;
        margin-bottom: 12px;
        transition: all .3s ease-in-out;
    }

    .trvgd_header_place a:hover {
        color: #ffa718;
    }

    .trvgd_header_title {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 32px;
        font-style: normal;
        font-weight: 600;
        line-height: 52px;
        margin-bottom: 26px;
    }

    .trvgd_header_description {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 18px;
        font-style: normal;
        font-weight: 500;
        line-height: 28px;
        margin-bottom: 35px;
    }

    .trvgd_header_source {
        color: #FFF;
        font-family: "SF Pro Display";
        font-size: 16px;
        font-style: normal;
        font-weight: 400;
        line-height: 24px;
        display: flex;
        flex-direction: row;
        gap: 25px;
    }

    .trvgd_header_source .box_left,
    .trvgd_header_source .box_right {
        display: flex;
        flex-direction: row;
        gap: 7px;
        align-items: center;
    }

    .trvgd_header .col-md-7,
    .trvgd_header .col-lg-7,
    .trvgd_header .col-md-7,
    .trvgd_header .col-lg-5 {
        padding: 0;
    }

    .guide_detail_body .page_container {
        padding-top: 20px;
    }
</style>
{/literal}

{literal}
<script>
    $(document).ready(function() {
        $("#header_fixed").addClass("nah_header_sticky").css({
            "box-shadow": "0px 12px 32px 0px #7d879e17",
            "position": ""
        });
        $(".bground_header .txt_header1").addClass('nah_header_top_scroll');
        $(".nah_bg_header_bot").addClass('bg-white');
        $(".txt_dropdown").css("color", "#111D37");
        $(".drop_down").css("background-color", "#F0F0F0");
        $(".img_logo_voyages_1").addClass("d-none");
        $(".img_logo_voyages_2").removeClass("d-none");
        $("#header_fixed #navbarDropdown .fa-angle-down").addClass("text-secondary").removeClass("text-white");
    });
</script>
{/literal}