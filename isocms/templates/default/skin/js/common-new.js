$(document).ready(function () {

    $('#carousel_home_news').owlCarousel({

        loop: true,

        margin: 33,

        dots: false,

        nav: true,

        navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],

        responsiveClass: true,

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 3

            }

        }

    });

    $('#explore_travel_styles_carousel').owlCarousel({

        loop: true,

        margin: 15,

        dots: false,

        nav: true,

        navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"],

        responsiveClass: true,

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 2

            },

            1000: {

                items: 3

            }

        }

    });

    $('#home_customer_reivews').owlCarousel({

        loop: true,

        margin: 36,

        dots: false,

        nav: true,

        navText: ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"], // Sử dụng các biểu tượng mũi tên của Font Awesome

        responsiveClass: true,

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 3

            }

        }

    });

    $('#tour_alsoLike_owl').owlCarousel({

        loop:true,

        margin: 0,

        nav:false,

        dots: false,

        items:4

    })

    $(window).scroll(function () {
        if (mod === 'guide' && act === 'detail') {
            // 
        } else if ((mod === 'destination' && act === 'place') || (mod === 'tour' && act === 'cat') || (mod === 'guide' && act === 'cat')) {
            let isScrolled = $(this).scrollTop() >= 600;
            $('.des_tailor_top').toggleClass('des_tailor_top_sticky', isScrolled);
            $('.des_tailor_top').css('top', isScrolled ? '0px' : '');

            var elemTop = $('.bg-footer').offset().top;
            var elemBottom = elemTop + $('.bg-footer').height();
            var viewportTop = $(window).scrollTop();
            var viewportBottom = viewportTop + $(window).height();
            if (elemBottom <= viewportBottom && elemTop >= viewportTop) {
                $('#header_fixed').css('display', 'block');
                $('.des_tailor_top').css('top', isScrolled ? '140px' : '');

                $("#header_fixed").toggleClass("nah_header_sticky", isScrolled).css({
                    "box-shadow": isScrolled ? "0px 12px 32px 0px #7d879e17" : "",
                    "position": isScrolled ? "" : "relative"
                });
                $(".bground_header .txt_header1").toggleClass('nah_header_top_scroll', isScrolled);
                $(".nah_bg_header_bot").toggleClass('bg-white', isScrolled);
                $("#header_top").toggleClass('border-bottom', !isScrolled);
                $(".txt_dropdown").css("color", isScrolled ? "#111D37" : "");
                $(".drop_down").css("background-color", isScrolled ? "#F0F0F0" : "");
                $(".img_logo_voyages_2").toggleClass("d-none", !isScrolled);
                $(".img_logo_voyages_1").toggle(!isScrolled);
                $("#header_fixed #navbarDropdown .fa-angle-down").toggleClass("text-secondary", isScrolled).toggleClass("text-white", !isScrolled);
            } else {
                $("#header_fixed").removeClass("nah_header_sticky", isScrolled).css({
                    "box-shadow": isScrolled ? "0px 12px 32px 0px #7d879e17" : "",
                    "position": isScrolled ? "" : "relative"
                });
                $(".bground_header .txt_header1").removeClass('nah_header_top_scroll', isScrolled);
                $(".nah_bg_header_bot").removeClass('bg-white', isScrolled);
                $("#header_top").removeClass('border-bottom', !isScrolled);
                $(".txt_dropdown").css("color", isScrolled ? "#111D37" : "");
                $(".drop_down").css("background-color", isScrolled ? "#F0F0F0" : "");
                $(".img_logo_voyages_2").toggleClass("d-none", !isScrolled);
                $(".img_logo_voyages_1").toggle(!isScrolled);
                $("#header_fixed #navbarDropdown .fa-angle-down").removeClass("text-secondary", isScrolled).removeClass("text-white", !isScrolled);
            }
        } else {
            let isScrolled = $(this).scrollTop() > 0;
            $("#header_fixed").toggleClass("nah_header_sticky", isScrolled).css({
                "box-shadow": isScrolled ? "0px 12px 32px 0px #7d879e17" : "",
                "position": isScrolled ? "" : "relative"
            });
            $(".bground_header .txt_header1").toggleClass('nah_header_top_scroll', isScrolled);
            $(".nah_bg_header_bot").toggleClass('bg-white', isScrolled);
            $("#header_top").toggleClass('border-bottom', !isScrolled);
            $(".txt_dropdown").css("color", isScrolled ? "#111D37" : "");
            $(".drop_down").css("background-color", isScrolled ? "#F0F0F0" : "");
            $(".img_logo_voyages_2").toggleClass("d-none", !isScrolled);
            $(".img_logo_voyages_1").toggle(!isScrolled);
            $("#header_fixed #navbarDropdown .fa-angle-down").toggleClass("text-secondary", isScrolled).toggleClass("text-white", !isScrolled);
        }
    });

    var clickedDetails = JSON.parse(sessionStorage.getItem('clickedDetails')) || [];
    var maxItemsToShow = 3;
    function updateClickedDetails() {

        var clickedDetailsContainer = $(".clicked-details");

        clickedDetailsContainer.empty();

        var reversedClickedDetails = clickedDetails.slice().reverse();

        if (clickedDetails.length > 0) {

            $(".recentlyViewed").show();

        } else {

            $(".recentlyViewed").hide();

        }

    

        $.each(reversedClickedDetails.slice(0, maxItemsToShow), function(index, detail) {

            var detailElement = $(detail);

            var wrapperDiv = $("<div>").addClass("revVier");

            detailElement.wrapAll(wrapperDiv);

            clickedDetailsContainer.append(detailElement.parent()); 

        });

    }

    $(".box_hotel_item").click(function() {

        var clickedDetail = $(this).html();

        if(clickedDetails.indexOf(clickedDetail) === -1) {

            clickedDetails.push(clickedDetail);

            updateClickedDetails();

            sessionStorage.setItem('clickedDetails', JSON.stringify(clickedDetails));

            // Kiểm tra và hiển thị nút "Xem thêm" khi có hơn 3 phần tử

            if(clickedDetails.length > 3) {

                $(".btnShowViewed").show();

                $('.clicked-details').toggleClass("mbReviews",false);

            }else {

                $('.clicked-details').toggleClass("mbReviews",true);



            }

        }

    });

    $(".btnShowViewed").click(function() {

        maxItemsToShow = clickedDetails.length;

        updateClickedDetails();

        updateShowMoreButton();

    });

    $(".btnNoneViewed").click(function() {

        maxItemsToShow = 3;

        updateClickedDetails();

        updateShowMoreButton();

    });

    function updateShowMoreButton() {

        var btnShowViewed = $(".btnShowViewed");

        var btnNoneViewed = $(".btnNoneViewed");

        if (clickedDetails.length <= 3) {

            btnShowViewed.hide();

            btnNoneViewed.hide();

        } else {

            if (maxItemsToShow === 3) {

                btnShowViewed.show();

                btnNoneViewed.hide();

            } else {

                btnShowViewed.hide();

                btnNoneViewed.show();

            }

        }

    }

    if (clickedDetails.length <= 3) {

        $(".btnShowViewed").hide();

    }

    updateClickedDetails();
    updateShowMoreButton();
});





