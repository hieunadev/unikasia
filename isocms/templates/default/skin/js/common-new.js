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
        margin: 10,
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


