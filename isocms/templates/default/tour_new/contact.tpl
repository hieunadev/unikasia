<link rel="stylesheet" href="{$URL_CSS}/contact_service.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<div class="unika_contact_service">
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="container">
                <div class="backcrump d-flex flex-wrap">
                    <p class="backcrump_first">You are here:</p>
                    <div class="content_backcrump d-flex flex-wrap">
                        <a href="/" class="backcrump_item">Home</a>
                        <div class="div_img">
                            <img src="{$URL_IMAGES}/icon/backcrump.svg" alt="Icon">
                        </div>
                        {if $cartSessionTour}
                        {assign var=tour_id value=$cartSessionTour.tour_id|default:$cartSessionTour.tour_id_z}
                        <a href="/tour" class="backcrump_item">Tour</a>
                        <div class="div_img">
                            <img src="{$URL_IMAGES}/icon/backcrump.svg" alt="Icon">
                        </div>
                        <a href="#" class="backcrump_item">{$clsTour->getTitle($tour_id)}</a>
                        <div class="div_img">
                            <img src="{$URL_IMAGES}/icon/backcrump.svg" alt="Icon">
                        </div>
                        {/if}
                        <p>Request</p>
                    </div>
                </div>
                <div class="contact_title ">
                    {if $cartSessionTour}
                    {assign var=tour_id value=$cartSessionTour.tour_id|default:$cartSessionTour.tour_id_z}
                    {$clsTour->getTitle($tour_id)}
                    {/if}
                </div>
                <div class="contact_content d-flex justify-content-between ">
                    <form action="" id="formContact" method="POST" class="contact_left d-flex flex-column align-items-center ">
                        <div class="contact_information item_contact_content">
                            <div class="title_booking">
                                Contact information
                            </div>
                            <div class="content d-flex flex-wrap align-items-start justify-content-start flex-wrap ">
                                <div class="d-flex flex-column information-3  box_validate">
                                    <label for="title">Title*</label>
                                    <select class="select2" name="title" id="title">
                                        <option value="">-- Please Select --</option>
                                        <option value="1">Mr.</option>
                                        <option value="1">Mrs.</option>
                                        <option value="1">Ms.</option>
                                    </select>
                                </div>
                                <div class="d-flex flex-column information-7  box_validate">
                                    <label for="title">Full name*</label>
                                    <input type="text" name="fullname" class="information_input" placeholder="Enter your name">
                                </div>
                                <div class="d-flex flex-column information-3  box_validate">
                                    <label for="nationality">Nationality*</label>
                                    <select class="form-select country select2" name="nationality" id="nationality" aria-label="Default select example" onchange="loadStates()">
                                        <option value="">-- Please Select --</option>
                                    </select>
                                </div>
                                <div class="d-flex flex-column information-3  box_validate">
                                    <label for="title">Email*</label>
                                    <input type="email" name="email" class="information_input" placeholder="Enter your email">
                                </div>
                                <div class="d-flex flex-column information-3  box_validate">
                                    <label for="title">Phone number*</label>
                                    <input type="tel" name="phone" class="information_input" placeholder="Enter your phone">
                                </div>
                                <div class="d-flex flex-column information-3 ">
                                    <label for="city">City</label>
                                    <select class="form-select state select2" name="city" id="city" aria-label="Default select example" onchange="loadCities()">
                                        <option value="">-- Please Select --</option>
                                    </select>
                                </div>
                                <div class="d-flex flex-column information-7 ">
                                    <label for="title">Address</label>
                                    <input type="text" name="address" class="information_input" placeholder="Enter your address">
                                </div>
                            </div>
                        </div>
                        <div class="special_requirement item_contact_content">
                            <div class="title_booking  ">
                                Your Special Requirements
                            </div>
                            <div class="content">
                                <textarea class="content_special" name="comment" id="" placeholder="Any must-see landmarks in your bucket list, desired accommodations, special food requirements, allergies…"></textarea>
                            </div>
                        </div>
                        <div class="d-flex flex-column unika_note">
                                <span class="text-center ">
                                    *One of our Tailor-Made consultants will be in touch within 24 business hours.
                                </span>
                            <span class="text-center ">
                                    If you don't receive our confirmation email after 1 working day, please check your spam email. It may go to your spam mailbox.
                                </span>
                        </div>
                        <input type="hidden" name="plantrip" value="plantrip" />
                        <input type="hidden" name="hidden_field" value="" />
                        <button class="btn_request_quotation  " type="submit">
                            Request for Quotation
                        </button>
                    </form>
                    {if $cartSessionTour}
                        {assign var=item value=$cartSessionTour}
                        {assign var=tour_id value=$cartSessionTour.tour_id|default:$cartSessionTour.tour_id_z}
                        {assign var=departure_date value=$clsISO->getStrToTime($cartSessionTour.check_in_book_z)}
                        {assign var=end_date value=$clsTour->getEndDate($departure_date,$tour_id)}
                        {assign var=total_price value=($cartSessionTour.total_price_adults + $cartSessionTour.total_price_child + $cartSessionTour.total_price_infants + $total_price_room)}
                    <div class="contact_right d-flex flex-column ">
                        <div class="summary d-flex flex-column  justify-content-start">
                            <div class="title ">Summary</div>
                            <div class="div_img">
                                <img src="{$clsTour->getImage($tour_id,364,194)}" alt="Images">
                            </div>
                            <a href="{$clsTour->getLink($tour_id)}" class="title_content txt-hover-home">
                                {$clsTour->getTitle($tour_id)}
                            </a>
                            <div class="content d-flex flex-column ">
                                <div class="item_content d-flex flex-column ">
                                    {if $item.check_in_book_z}
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class=" span_title">Travel Date:</span>
                                        <span class="span_content">{$clsISO->converTimeToText5($departure_date)}</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class=" span_title">End Date:</span>
                                        <span class="span_content">{$clsISO->converTimeToText5($clsTour->getDueDate($tour_id, $departure_date))}</span>
                                    </div>
                                    {/if}
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class=" span_title">Duration:</span>
                                        <span class="span_content">{$clsTour->getTripDurationx($tour_id)}</span>
                                    </div>
                                </div>
                                {if $cartSessionTour.tour_id_z}
                                <div class="item_content d-flex flex-column ">
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class=" span_title">Participants:</span>
                                        <div class="span_content d-flex flex-column  align-items-end">
                                            {if $item.number_adults_z}<span>{$item.number_adults_z} x Adults</span>{/if}
                                            {if $item.number_child_z}<span>{$item.number_child_z} x Children</span>{/if}
                                            {if $item.number_infants_z}<span>{$item.number_infants_z} x Infants</span>{/if}
                                        </div>
                                    </div>
                                    {if $lstRoom}
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class=" span_title">Room:</span>
                                        <span class="span_content d-flex flex-column  align-items-end">
                                            {section name=i loop=$lstRoom}
                                                {if $lstRoom[i].number_room}
                                                <span>{$lstRoom[i].number_room} x {$clsTourProperty->getTitle($lstRoom[i].room_id)}</span>
                                                {/if}
                                            {/section}
                                        </span>
                                    </div>
                                    {/if}
                                </div>
                                {/if}
                            </div>
                            <div class="d-flex flex-column total_price">
                                <div class="d-flex justify-content-between align-items-start ">
                                    <span class="span_title span_total_price">From:</span>
                                    {if $cartSessionTour.tour_id_z}
                                    <span class="span_content span_bold">US ${$total_price}</span>
                                    {elseif $cartSessionTour.tour_id}
                                    <span class="span_content span_bold">US ${$clsTour->getPriceAfterDiscount($tour_id)}</span>
                                    {else}
                                    <span class="span_content span_bold">Contact</span>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $cartSessionHotel}
                    {foreach from=$cartSessionHotel item=item_hotel key=key_service}
                    {assign var=cartSessionItemHotel value=$item_hotel}
                    {if $cartSessionItemHotel}
                        {foreach from=$cartSessionItemHotel item=item key=key}
                        {assign var=hotel_id value=$item.hotel_id}
                        {assign var=title_hotel value=$clsHotel->getTitle($hotel_id)}
                        <div class="contact_right d-flex flex-column ">
                            <div class="summary d-flex flex-column  justify-content-start">
                                <div class="title ">Summary</div>
                                <div class="div_img">
                                    <img src="{$clsHotel->getImage($hotel_id,364,194)}" alt="Images">
                                </div>
                                <a href="{$clsHotel->getLink($hotel_id)}" class="title_content txt-hover-home">
                                    {$title_hotel}
                                </a>
                                <div class="d-flex flex-column total_price">
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class="span_title span_total_price">From:</span>
                                        <span class="span_content span_bold">US ${$clsHotel->getPriceAvg($hotel_id)}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                        {/if}
                        {/foreach}
                    {/if}
                    {if $cartSessionCruise}
                    {foreach from=$cartSessionCruise item=item_cruise key=key_service}
                    {assign var=cartSessionItemCruise value=$item_cruise}
                    {if $cartSessionItemCruise}
                        {foreach from=$cartSessionItemCruise item=item key=key}
                        {assign var=cruise_id value=$item.cruise_id}
                        {assign var=title_cruise value=$clsCruise->getTitle($cruise_id)}
                        <div class="contact_right d-flex flex-column ">
                            <div class="summary d-flex flex-column justify-content-start">
                                <div class="title ">Summary</div>
                                <div class="div_img">
                                    <img src="{$clsCruise->getImage($cruise_id,364,194)}" alt="Images">
                                </div>
                                <a href="{$clsCruise->getLink($cruise_id)}" class="title_content txt-hover-home">
                                    {$title_cruise}
                                </a>
                                <div class="d-flex flex-column total_price">
                                    <div class="d-flex justify-content-between align-items-start ">
                                        <span class="span_title span_total_price">From:</span>
                                        <span class="span_content span_bold">Contact</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                        {/if}
                        {/foreach}
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
<select class="form-select city d-none" aria-label="Default select example" >
    <option selected>Select City</option>
</select>

<script>
    var msg_fullname_required = "{$core->get_Lang('Your first name should not be empty')}!";
    var msg_phone_required = "{$core->get_Lang('Your telephone should not be empty')}!";
    var msg_email_required = "{$core->get_Lang('Your email should not be empty')}!";
    var msg_email_not_valid = "{$core->get_Lang('Please enter a valid email address')}!";
    var msg_country_id_not_valid = "{$core->get_Lang('Please select country')}!";
    var msg_confirmemail_not_valid = "{$core->get_Lang('Email addresses do not match')}!";
    var showInfo = "{$core->get_Lang('Show more information')}";
    var hideInfo = "{$core->get_Lang('information hidden')}";
    var Day = '{$core->get_lang("Day")}';
    var Month = '{$core->get_lang("Month")}';
    var Year = '{$core->get_lang("Year")}';
    var January = '{$core->get_lang("January")}'
    var February = '{$core->get_lang("February")}';
    var March = '{$core->get_lang("March")}';
    var April = '{$core->get_lang("April")}';
    var May = '{$core->get_lang("May")}';
    var June = '{$core->get_lang("June")}';
    var July = '{$core->get_lang("July")}';
    var August = '{$core->get_lang("August")}';
    var September = '{$core->get_lang("September")}';
    var October = '{$core->get_lang("October")}';
    var November = '{$core->get_lang("November")}';
    var December = '{$core->get_lang("December")}';
    var Jan = '{$core->get_lang("Jan")}'
    var Feb = '{$core->get_lang("Feb")}';
    var Mar = '{$core->get_lang("Mar")}';
    var Apr = '{$core->get_lang("Apr")}';
    var May = '{$core->get_lang("May")}';
    var Jun = '{$core->get_lang("Jun")}';
    var Jul = '{$core->get_lang("Jul")}';
    var Aug = '{$core->get_lang("Aug")}';
    var Sep = '{$core->get_lang("Sep")}';
    var Oct = '{$core->get_lang("Oct")}';
    var Nov = '{$core->get_lang("Nov")}';
    var Dec = '{$core->get_lang("Dec")}';
    var For = '{$core->get_lang("For")}';
    var st = '{$core->get_lang("st")}';
    var nd = '{$core->get_lang("nd")}';
    var rd = '{$core->get_lang("rd")}';
    var th = '{$core->get_lang("th")}';
    var Cancel = '{$core->get_lang("Cancel")}';
    var Confirm = '{$core->get_lang("Confirm")}';
    var delete_text = '{$core->get_lang("Are you sure you want to delete?")}';
    var remove_text = '{$core->get_lang("Are you sure you want to remove?")}';
    var loading = '{$core->get_lang("loading")}';
    var DateofBirth = '{$core->get_lang("Birthday")}';
    var msg_recapcha = "{$core->get_Lang('You must check Recaptcha')}";
</script>
<script src="{$URL_JS}/datepicker/jquery.date-dropdowns.js?v={$upd_version}"></script>
<script src="{$URL_JS}/jquery.validate.js?ver={$upd_version}"></script>
<script src="{$URL_JS}/jquery-confirm.min.js?ver={$upd_version}"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="{$URL_JS}/jquery.validate.min.js"></script>
{literal}
    <script>
        $(function () {
            //Select2
            $('.select2').select2();

            $(document)
                .on('change', '.select2-hidden-accessible', function(){
                    $(this).valid();
                });

            // Custom method cho số điện thoại Việt Nam
            $.validator.addMethod("phoneVN", function(value, element) {
                return this.optional(element) || /^(0|\+84)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-9])[0-9]{7}$/.test(value);
            }, "Please enter a valid phone number");

            $.validator.addMethod("select2-required", function (value, element, params) {
                return value !== null && value !== ""; // or other logic as needed
            }, "This field is required.");

            $('#formContact').validate({
                errorPlacement: function (error, element) {
                    error.appendTo(element.parents(".box_validate"));
                    error.wrap("<span class='errors'>");
                    element.parents('.box_validate').addClass('validate_input');

                    if (element.hasClass("select2-hidden-accessible")) {
                        error.insertAfter(element.next('span.select2'));
                    } else {
                        error.insertAfter(element);
                    }

                    $('.btn_payment').addClass('false');
                },
                highlight: function (element) {
                    $(element).parents('.box_validate').addClass('validate_input')
                    $(element).addClass('form-control-danger')
                },
                success: function (label, element) {
                    $(element).parents('.box_validate').removeClass('validate_input')
                    $(element).removeClass('form-control-danger')
                    label.parents('.errors').remove();
                    $('.btn_payment').removeClass('false');
                },
                ignore: [],
                debug: false,
                rules:{
                    title: {
                        "select2-required": true
                    },
                    fullname: "required",
                    nationality: {
                        "select2-required": true
                    },
                    email: "required",
                    phone: {
                        required: true,
                        phoneVN: true
                    }
                },
                messages:{
                    title: {
                        "select2-required": "Please select a start title!"
                    },
                    fullname: "Please enter your full name!",
                    nationality: "Please select nationality!",
                    email: "Please enter your email!",
                    phone: {
                        required: "Please enter your phone number!",
                        phoneVN: "Please enter a valid phone number!"
                    }
                },
                submitHandler: function () {
                    return true
                }
            });
            $(window).scroll(function() {
                requestAnimationFrame(function () {
                    $('.unika_header').removeClass('unika_header_2');
                });
            })

            const config = {
                cUrl: 'https://api.countrystatecity.in/v1/countries',
                ckey: 'NHhvOEcyWk50N2Vna3VFTE00bFp3MjFKR0ZEOUhkZlg4RTk1MlJlaA=='
            }

            const countrySelect = document.querySelector('.country'),
                stateSelect = document.querySelector('.state'),
                citySelect = document.querySelector('.city')

            function loadCountries() {
                let apiEndPoint = config.cUrl
                fetch(apiEndPoint, {headers: {"X-CSCAPI-KEY": config.ckey}})
                    .then(Response => Response.json())
                    .then(data => {
                        // console.log(data);

                        data.forEach(country => {
                            const option = document.createElement('option')
                            option.value = country.iso2
                            option.textContent = country.name
                            countrySelect.appendChild(option)
                        })
                    })
                    .catch(error => console.error('Error loading countries:', error))
                stateSelect.disabled = true
                citySelect.disabled = true
                stateSelect.style.pointerEvents = 'none'
                citySelect.style.pointerEvents = 'none'
            }
            function loadStates() {
                stateSelect.disabled = false
                citySelect.disabled = true
                stateSelect.style.pointerEvents = 'auto'
                citySelect.style.pointerEvents = 'none'

                const selectedCountryCode = countrySelect.value
                stateSelect.innerHTML = '<option value="">Select State</option>' // for clearing the existing states
                citySelect.innerHTML = '<option value="">Select City</option>' // Clear existing city options

                fetch(`${config.cUrl}/${selectedCountryCode}/states`, {headers: {"X-CSCAPI-KEY": config.ckey}})
                    .then(response => response.json())
                    .then(data => {
                        // console.log(data);

                        data.forEach(state => {
                            const option = document.createElement('option')
                            option.value = state.iso2
                            option.textContent = state.name
                            stateSelect.appendChild(option)
                        })
                    })
                    .catch(error => console.error('Error loading countries:', error))
            }


            function loadCities() {
                citySelect.disabled = false
                citySelect.style.pointerEvents = 'auto'

                const selectedCountryCode = countrySelect.value
                const selectedStateCode = stateSelect.value

                citySelect.innerHTML = '<option value="">Select City</option>' // Clear existing city options
                fetch(`${config.cUrl}/${selectedCountryCode}/states/${selectedStateCode}/cities`, {headers: {"X-CSCAPI-KEY": config.ckey}})
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(city => {
                            const option = document.createElement('option')
                            option.value = city.iso2
                            option.textContent = city.name
                            citySelect.appendChild(option)
                        })
                    })
            }
            window.onload = loadCountries
        })
    </script>
{/literal}