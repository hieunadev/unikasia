$(document).ready(function () {


    $(".result_search").click(function() {
        $("#filter_search").show();
    });

    
    var minPrice = Math.min.apply(null, price_range);
    var maxPrice = Math.max.apply(null, price_range);

    var price_range_title_min = '{$lstPriceRange[0].title}';
    var price_range_title_max = '{$lstPriceRange[count($lstPriceRange)-1].title}';

    $("#slider-price2").slider({
        range: true,
        min: parseInt(min_price_value),
        max: parseInt(max_price_value),
        values: [parseInt(min_price_value), parseInt(max_price_value)],
        slide: function(event, ui) {
            $("#price_0").html((ui.values[0]));
            $("#price_1").html("$" + (ui.values[1]));
            // $("#price_0").html(PriceRange_title[ui.values[0]]);
            // $("#price_1").html(PriceRange_title[ui.values[1]]);

        },
        stop: function(event, ui) {
            minPrice = ui.values[0];
            maxPrice = ui.values[1];
            if (minPrice >= maxPrice) {
                minPrice = maxPrice - 1;
                $("#slider-price2").slider("values", [minPrice, maxPrice]);
            }
    
            if (maxPrice <= minPrice) {
                maxPrice = minPrice + 1;
                $("#slider-price2").slider("values", [minPrice, maxPrice]);
            }
            $("input[name='price_range[]']").each(function() {
                var price = parseInt($(this).val());
                if (price >= minPrice && price <= maxPrice) {
                    $(this).prop("checked", true);
                } else {
                    $(this).prop("checked", false);
                }
            });
            $('#search_hotel_left').submit();
            $('#filters_form2').submit();
        }
    });

    updatePriceElements();

    function updatePriceElements() {
        var scaledPriceRange = price_range.map(function(price) {
            return price * 100;
        });
        minPrice = Math.min.apply(null, scaledPriceRange) / 100;
        maxPrice = Math.max.apply(null, scaledPriceRange) / 100;
        $("#price_0").html(PriceRange_title[minPrice]);
        $("#price_1").html(PriceRange_title[maxPrice]);
        $("#slider-price2").slider("values", [minPrice, maxPrice]);
    }

    // $('.Inclusion-txt p').each(function() {
    //     if ($(this).children('img').length === 0) {
    //         $(this).prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    //     }
    // });
    // $('.Inclusion-txt span').each(function() {
    //     if ($(this).children('img').length === 0) {
    //         $(this).prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    //     }
    // });
    // $('.Inclusion-txt div').each(function() {
    //     if ($(this).children('img').length === 0) {
    //         $(this).prepend('<img class="Inclusion-icon" src="/isocms/templates/default/skin/images/hotel/checkInclus.svg" alt="error">');
    //     }
    // });


    $('.hotel_detail_main .scroll-title li:first-child a').addClass("active");

    $('.hotel_detail_main .scroll-title li a').click(function(){
        $('.hotel_detail_main .scroll-title li a').removeClass("active");
        $(this).addClass("active");
    });


    var fifthListItem = $(".attractions-list:eq(4)");

    fifthListItem.addClass("half-height");

    $(".attractions-list:gt(4)").hide();

    // var clickedDetails = JSON.parse(sessionStorage.getItem('clickedDetails')) || [];
    // var maxItemsToShow = 3;
    
    // function updateClickedDetails() {
    //     var clickedDetailsContainer = $(".clicked-details");
    //     clickedDetailsContainer.empty();
    //     var reversedClickedDetails = clickedDetails.slice().reverse();
    //     if (clickedDetails.length > 0) {
    //         $(".recentlyViewed").show();
    //     } else {
    //         $(".recentlyViewed").hide();
    //     }
    
    //     $.each(reversedClickedDetails.slice(0, maxItemsToShow), function(index, detail) {
    //         var detailElement = $(detail);
    //         var wrapperDiv = $("<div>").addClass("revVier");
    //         detailElement.wrapAll(wrapperDiv);
    //         clickedDetailsContainer.append(detailElement.parent()); 
    //     });
    // }
    
    // $(".box_hotel_item").click(function() {
    //     var clickedDetail = $(this).html();
    //     if(clickedDetails.indexOf(clickedDetail) === -1) {
    //         clickedDetails.push(clickedDetail);
    //         updateClickedDetails();
    //         sessionStorage.setItem('clickedDetails', JSON.stringify(clickedDetails));
            
    //         // Kiểm tra và hiển thị nút "Xem thêm" khi có hơn 3 phần tử
    //         if(clickedDetails.length > 3) {
    //             $(".btnShowViewed").show();
    //         }
    //     }
    // });
    
    // $(".btnShowViewed").click(function() {
    //     maxItemsToShow = clickedDetails.length;
    //     updateClickedDetails();
    //     updateShowMoreButton();
    // });
    
    // $(".btnNoneViewed").click(function() {
    //     maxItemsToShow = 3;
    //     updateClickedDetails();
    //     updateShowMoreButton();
    // });
    
    // function updateShowMoreButton() {
    //     var btnShowViewed = $(".btnShowViewed");
    //     var btnNoneViewed = $(".btnNoneViewed");
    
    //     if (clickedDetails.length <= 3) {
    //         btnShowViewed.hide();
    //         btnNoneViewed.hide();
    //     } else {
    //         if (maxItemsToShow === 3) {
    //             btnShowViewed.show();
    //             btnNoneViewed.hide();
    //         } else {
    //             btnShowViewed.hide();
    //             btnNoneViewed.show();
    //         }
    //     }
    // }
    
    // if (clickedDetails.length <= 3) {
    //     $(".btnShowViewed").hide();
    // }
    
    // updateClickedDetails();
    // updateShowMoreButton();
    












    $('.checkCityDesTop').change(function () {

        var selectedCountryId = $(this).val();
        $('.visit-list_item').hide();
        $('.visit-list_item').filter(function () {
            return $(this).find('.checkBoxCity').data('id') == selectedCountryId;
        }).show();
    });




    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((tooltip) => {
        new bootstrap.Tooltip(tooltip);
    });

    document.querySelectorAll('[data-bs-toggle="popover"]').forEach((popover) => {
        new bootstrap.Popover(popover);
    });

    // -------------------------------
    // Toasts
    // -------------------------------
    // Used by 'Placement' example in docs or StackBlitz
    const toastPlacement = document.getElementById('toastPlacement');
    if (toastPlacement) {
        document
            .getElementById('selectToastPlacement')
            .addEventListener('change', function () {
                if (!toastPlacement.dataset.originalClass) {
                    toastPlacement.dataset.originalClass = toastPlacement.className;
                }

                toastPlacement.className = `${toastPlacement.dataset.originalClass} ${this.value}`;
            });
    }

    document.querySelectorAll('.bd-example .toast').forEach((toastNode) => {
        const toast = new bootstrap.Toast(toastNode, {
            autohide: false,
        });

        toast.show();
    });

    const toastTrigger = document.getElementById('liveToastBtn');
    const toastLiveExample = document.getElementById('liveToast');

    if (toastTrigger) {
        const toastBootstrap =
            bootstrap.Toast.getOrCreateInstance(toastLiveExample);
        toastTrigger.addEventListener('click', () => {
            toastBootstrap.show();
        });
    }

    const alertPlaceholder = document.getElementById('liveAlertPlaceholder');
    const appendAlert = (message, type) => {
        const wrapper = document.createElement('div');
        wrapper.innerHTML = [
            `<div class="alert alert-${type} alert-dismissible" role="alert">`,
            `   <div>${message}</div>`,
            '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
            '</div>',
        ].join('');

        alertPlaceholder.append(wrapper);
    };

    const alertTrigger = document.getElementById('liveAlertBtn');
    if (alertTrigger) {
        alertTrigger.addEventListener('click', () => {
            appendAlert('Nice, you triggered this alert message!', 'success');
        });
    }

    document
        .querySelectorAll('.carousel:not([data-bs-ride="carousel"])')
        .forEach((carousel) => {
            bootstrap.Carousel.getOrCreateInstance(carousel);
        });

    document
        .querySelectorAll('.bd-example-indeterminate [type="checkbox"]')
        .forEach((checkbox) => {
            if (checkbox.id.includes('Indeterminate')) {
                checkbox.indeterminate = true;
            }
        });

    document.querySelectorAll('.bd-content [href="#"]').forEach((link) => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
        });
    });

    const exampleModal = document.getElementById('exampleModal');
    if (exampleModal) {
        exampleModal.addEventListener('show.bs.modal', (event) => {

            const button = event.relatedTarget;

            const recipient = button.getAttribute('data-bs-whatever');

            const modalTitle = exampleModal.querySelector('.modal-title');
            const modalBodyInput = exampleModal.querySelector('.modal-body input');

            modalTitle.textContent = `New message to ${recipient}`;
            modalBodyInput.value = recipient;
        });
    }

    const myOffcanvas = document.querySelectorAll(
        '.bd-example-offcanvas .offcanvas'
    );
    if (myOffcanvas) {
        myOffcanvas.forEach((offcanvas) => {
            offcanvas.addEventListener(
                'show.bs.offcanvas',
                (event) => {
                    event.preventDefault();
                },
                false
            );
        });
    }
});