<div class="filter_left_search">
    {* <div class="filter_left_title">
        {$core->get_Lang('Filter')}
    </div> *}
    <form action="" method="post" id="search_hotel_left">
        <input type="hidden" name="search_hotel_left" value="search_hotel_left" />

        {if $act eq 'default'}

            {if $lstCountryHotel}
                <div class="find_Box">
                    <div class="box_body_filter_title">
                        {$core->get_Lang('Country')}
                    </div>
                    <div class="box_filter_body">
                        <div class="filter_list_item">
                            {section name=i loop=$lstCountryHotel}
                                {assign var=check value=$clsISO->checkInArray($country_id,$lstCountryHotel[i].country_id)}
                                <div class="check_ipt checkSizeFilter">
                                    <input class="form-check-input checkCityDesTop" type="radio" name="country[]"
                                        id="country{$smarty.section.i.iteration}" value="{$lstCountryHotel[i].country_id}"
                                        {if $check} checked {/if}>
                                    <label class="form-check-label labelCheck" for="country{$smarty.section.i.iteration}"><a
                                            class="filter_link"
                                            href="{$clsCountryEx->getLink($lstCountryHotel[i].country_id,'Hotel',$lstCountryHotel[i])}"
                                            title="{$lstCountryHotel[i].title}"><label>{$lstCountryHotel[i].title}</label></a>
                                    </label>
                                </div>
                            {/section}
                        </div>
                        <span class="readmore">{$core->get_Lang('More')}</span>
                    </div>
                </div>
            {/if}
        {else}
            {if $lstCountryHotel}
                <div class="find_Box">
                    <div class="box_body_filter_title">
                        {$core->get_Lang('Country')}
                    </div>
                    <div class="box_filter_body">
                        <div class="filter_list_item">
                            {section name=i loop=$lstCountryHotel}
                                {assign var=check value=$clsISO->checkInArray($country_id,$lstCountryHotel[i].country_id)}
                                <div class="check_ipt checkSizeFilter">
                                    <input class="form-check-input checkCityDesTop" type="radio" name="country[]"
                                        id="country{$smarty.section.i.iteration}" value="{$lstCountryHotel[i].country_id}"
                                        {if $check} checked {/if}>
                                    <label class="form-check-label labelCheck" for="country{$smarty.section.i.iteration}"><a
                                            class="filter_link"
                                            href="{$clsCountryEx->getLink($lstCountryHotel[i].country_id,'Hotel',$lstCountryHotel[i])}"
                                            title="{$lstCountryHotel[i].title}"><label>{$lstCountryHotel[i].title}</label></a>
                                    </label>
                                </div>
                            {/section}
                        </div>
                        <span class="readmore">{$core->get_Lang('More')}</span>
                    </div>
                </div>
            {/if}

            {if $lstCity}
                <div class="find_Box">
                    <div class="box_body_filter_title">
                        {$core->get_Lang('City')}
                    </div>
                    <div class="box_filter_body">
                        <div class="filter_list_item">
                            {section name=i loop=$lstCity}
                                {assign var=check value=$clsISO->checkInArray($city,$lstCity[i].city_id)}
                                <div class="check_ipt checkSizeFilter">
                                    <input type="checkbox" name="city[]" class="form-check-input typeSearch"
                                        value="{$lstCity[i].city_id}" {if $check} checked {/if}
                                        id="city{$smarty.section.i.iteration}">
                                    <label class="form-check-label labelCheck" for="city{$smarty.section.i.iteration}">
                                        {$lstCity[i].title} </label>
                                </div>
                            {/section}
                        </div>
                        <span class="readmore">{$core->get_Lang('More')}</span>
                    </div>
                </div>
            {/if}
        {/if}
        <div class="find_Box">
            <div class="box_body_filter_title">
                {$core->get_Lang('Price range')}
            </div>
            <div class="box_filter_body">
                <div class="filter_list_item nsdt_filter-price-hotel">
                    <div class="nsdt_checkPriceHotel">
                        {section name=i loop=$lstPriceRange}
                            {assign var=check value=$clsISO->checkInArray($price_range,$lstPriceRange[i].hotel_price_range_id)}
                            <div class="check_ipt">
                                <input type="checkbox" name="price_range[]" class="input_item typeSearch"
                                    value="{$lstPriceRange[i].hotel_price_range_id}" {if $check} checked {/if}
                                    id="priceRange{$smarty.section.i.iteration}">
                                <label for="priceRange{$smarty.section.i.iteration}"
                                    class="labelCheck">{$lstPriceRange[i].max_rate}</label>
                            </div>
                        {/section}
                    </div>

                    {assign var=price_range_min value=$lstPriceRange[0].hotel_price_range_id}
                    {assign var=price_range_max value=$lstPriceRange[count($lstPriceRange)-1].hotel_price_range_id}
                    {* {$lstPriceRange|var_dump} *}
                    {section name=i loop=$lstPriceRange}
                        <div class="nsdt_getPriceHotel">
                            {$lstPriceRange[i].hotel_price_range_id}
                        </div>
                    {/section}
                    {section name=i loop=$PriceRange_title}
                        <div class="nsdt_getPriceHotelTitle" data-id="{$lstPriceRange[i].hotel_price_range_id}">
                            {$PriceRange_title[i]}
                        </div>
                    {/section}

                    <div class="price-hotel-items">
                        <div id="price_0" class="price-hotel-itemMin"></div>
                        <div id="price_1" class="price-hotel-itemMax"></div>

                    </div>

                    <div id="slider-price2" class="mb10"></div>

                </div>
            </div>
        </div>
</div>
<div class="find_Box">
    <div class="box_body_filter_title">
        {$core->get_Lang('Rank')}
    </div>
    <div class="box_filter_body">
        <div class="filter_list_item">
            {assign var=stars value=$clsISO->listStar(6)}
            {section name=i loop=$stars}
                {assign var=check value=$clsISO->checkInArray($star_id,$stars[i].star_id)}
                <div class="check_ipt">
                    <input type="checkbox" name="star_id[]" class="form-check-input input_item typeSearch checkRankHotel"
                        value="{$stars[i].star_id}" {if $check} checked {/if} id="star{$smarty.section.i.iteration}">
                    {if $stars[i].star_id == 1}
                        <label class="labelCheck" for="star{$smarty.section.i.iteration}">{$stars[i].title}</label>
                    {else}
                        <label class="labelCheck" for="star{$smarty.section.i.iteration}">{$stars[i].star_id} <img
                                style="margin-left: 8px;" src="{$URL_IMAGES}/hotel/star.svg" alt="error"></label>
                    {/if}
                </div>
            {/section}

        </div>
        <span class="readmore">{$core->get_Lang('More')}</span>
    </div>
</div>
<div class="find_Box">
    <div class="box_body_filter_title">
        {$core->get_Lang('Type of accommodations')}
    </div>
    <div class="box_filter_body">
        <div class="filter_list_item">
            {section name=i loop=$listTypeHotel}
                {assign var=hotel_property_id value=$listTypeHotel[i].property_id}
                {assign var=hotel_property_title value=$listTypeHotel[i].title}
                {assign var=check value=$clsISO->checkInArray($type_hotel,$hotel_property_id)}
                <div class="check_ipt checkSizeFilter">
                    <input type="checkbox" class="form-check-input input_item typeSearch checkTypeAccountHotel"
                        name="type_hotel[]" value="{$hotel_property_id}" {if $check} checked {/if}
                        id="typeHotel{$smarty.section.i.iteration}">
                    <label class="labelCheck" for="typeHotel{$smarty.section.i.iteration}">{$hotel_property_title}</label>
                </div>
            {/section}

        </div>
        <span class="readmore">{$core->get_Lang('More')}</span>
    </div>
</div>

</form>
<button id="nsdt_btnSubmitFilterMobile">{$core->get_Lang('See results')}</button>
</div>
<script>
    var max_price_value = '{$price_range_max}';
    var min_price_value = '{$price_range_min}';
    var min_price_search = '{$min_price_search}';
    var max_price_search = '{$max_price_search}';
    var price_range_title_min = '{$lstPriceRange[0].title}';
    var price_range_title_max = '{$lstPriceRange[count($lstPriceRange)-1].title}';
    var price_range = [];
    var PriceRange_title = {};
    $('.nsdt_getPriceHotel').each(function(index, element) {
        price_range.push(parseFloat($(element).text().trim()));
    });

    $('.nsdt_getPriceHotelTitle').each(function(index, element) {
        var id = $(element).data('id');
        var title = $(element).text().trim();
        PriceRange_title[id] = title;
    });

    $(".typeSearch").click(function() {
        $(this).blur();
    });
</script>

{literal}
    <script>
        // $(function() {
        //     var minPrice = Math.min.apply(null, price_range);
        //     var maxPrice = Math.max.apply(null, price_range);

        //     function updateSliderTitles(ui) {
        //         var id0 = ui.values[0];
        //         var id1 = ui.values[1];
        //         $("#price_0").html("$" + PriceRange_title[id0]);
        //         $("#price_1").html("$" + PriceRange_title[id1]);
        //     }

        //     $("#slider-price2").slider({
        //         range: true,
        //         min: parseInt(min_price_value),
        //         max: parseInt(max_price_value),
        //         values: [parseInt(min_price_value), parseInt(max_price_value)],
        //         slide: function(event, ui) {
        //             updateSliderTitles(ui);
        //         },
        //         stop: function(event, ui) {
        //             minPrice = ui.values[0];
        //             maxPrice = ui.values[1];
        //             if (minPrice >= maxPrice) {
        //                 minPrice = maxPrice - 1;
        //                 $("#slider-price2").slider("values", [minPrice, maxPrice]);
        //             }

        //             if (maxPrice <= minPrice) {
        //                 maxPrice = minPrice + 1;
        //                 $("#slider-price2").slider("values", [minPrice, maxPrice]);
        //             }
        //             $("input[name='price_range[]']").each(function() {
        //                 var price = parseInt($(this).val());
        //                 if (price >= minPrice && price <= maxPrice) {
        //                     $(this).prop("checked", true);
        //                 } else {
        //                     $(this).prop("checked", false);
        //                 }
        //             });
        //             $('#search_hotel_left').submit();
        //         }
        //     });



        //     function updatePriceElements() {
        //         var minPrice = Math.min.apply(null, price_range);
        //         var maxPrice = Math.max.apply(null, price_range);
        //         $("#slider-price2").slider("values", [minPrice, maxPrice]);

        //         $("#price_0").html("$" + PriceRange_title[minPrice]);
        //         $("#price_1").html("$" + PriceRange_title[maxPrice]);
        //     }

        //     updateSliderTitles({ values: [0, 1] });
        //     updatePriceElements();

        //     if (minPrice < 2) {
        //         document.getElementById("price_0").innerHTML = 0;
        //     } else if (minPrice >= 2 && minPrice <= 6) {
        //         $("#price_0").html(PriceRange_title[minPrice]);
        //         $("#price_0").text($("#slider-price2").slider("values", 0));
        //     } else {
        //         document.getElementById("price_0").innerHTML = minPrice;
        //     }
        //     $("#price_0").text($("#slider-price2").slider("values", 0));
        //     $("#price_1").text($("#price-range2").slider("values", 1));

        // });



        $(function() {
            var valueMin = $('#value_min').text();
            var valueMax = $('#value_max').text();
            $('.price-hotel-itemMin').text(valueMin);
            $('.price-hotel-itemMax').text(valueMax);


            $('.filter_list_item').each(function(index, elm) {
                var $_this = $(elm);
                var number_list = $(elm).find(".checkSizeFilter").length;
                if (number_list > 5) {
                    $(elm).addClass("short");
                    $_this.closest(".find_Box").find(".readmore").show();
                    $_this.find(".checkSizeFilter:gt(4)").hide();
                } else {
                    $(elm).removeClass("short");
                    $_this.closest(".find_Box").find(".readmore").hide();
                }
            });

            $(document).on("click", ".readmore", function() {
                var $_this = $(this);
                if (!$_this.hasClass("less")) {
                    $_this.addClass("less");
                    $_this.closest(".find_Box").find(".filter_list_item").removeClass("short");
                    $_this.closest(".find_Box").find(".checkSizeFilter").show();
                    $_this.html('{/literal}{$core->get_Lang("Less")}{literal}');
                } else {
                    $_this.removeClass("less");
                    $_this.closest(".find_Box").find(".filter_list_item").addClass("short");
                    $_this.closest(".find_Box").find(".checkSizeFilter:gt(4)").hide();
                    $_this.html('{/literal}{$core->get_Lang("More")}{literal}');
                }
            });
        });


        $(function() {
            function debounce(func, delay) {
                let debounceTimer;
                return function() {
                    const context = this;
                    const args = arguments;
                    clearTimeout(debounceTimer);
                    debounceTimer = setTimeout(() => func.apply(context, args), delay);
                };
            }
            $('.checkRankHotel').change(function() {
                var checkboxValue = $(this).val();
                $('#search_hotel_left').submit();
            });
            $('.checkTypeAccountHotel').change(function() {
                var checkboxValueType = $(this).val();
                debounce(function() {
                    $('#cityFilterForm').submit();
                }, 2000)();
            });

            $('#search_hotel_left .typeSearch').change(function() {
                $(this).closest('form').submit();
            });
        });
    </script>
{/literal}