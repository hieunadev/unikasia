<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<div class="unika_booking">
	<div class="head_booking">
		<div class="head d-flex justify-content-between align-items-center flex-wrap">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center flex-wrap">
					<a href="/" class="unika_logo_booking div_img">
						<img src="{$URL_IMAGES}/booking/logo.png" alt="Logo">
					</a>
					<div class="unika_contact d-flex  flex-wrap">
						<div class="email d-flex align-items-center ">
							<div class="div_img">
								<img src="{$URL_IMAGES}/booking/mail.svg" alt="Icon">
							</div>
							<span class=" SF-Pro-Medium">info@hanoivoyage.com</span>
						</div>
						<div class="phone d-flex align-items-center ">
							<div class="div_img">
								<img src="{$URL_IMAGES}/booking/phone.svg" alt="Icon">
							</div>
							<span class=" SF-Pro-Medium">Whapsapp: 0983033966</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="booking">
			<div class="container">
				<div class="d-flex justify-content-center align-items-center">
					<div class="item_booking d-flex flex-column justify-content-start align-items-center ">
						<div class="div_img">
							<img src="{$URL_IMAGES}/booking/choose_booking.svg" alt="Icon">
						</div>
						<span class="text_booking">
							<a href="#" onclick="window.history.back(); return false;">Choose booking</a>
						</span>
					</div>
					<div class="line1_booking"></div>
					<div class="item_booking d-flex flex-column justify-content-start align-items-center ">
						<div class="enter_info"></div>
						<span class=" text_booking ">
                                Enter info
                            </span>
					</div>
					<div class="line2_booking"></div>
					<div class="item_booking d-flex flex-column justify-content-start align-items-center ">
						<div class="payment"></div>
						<span class=" text_booking text_booking_payment">
                                Payment
                            </span>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $cartSessionService}
	{foreach from=$cartSessionService item=item name=item}
		{assign var=tour_id value=$item.tour_id_z}
		{if $tour_id}
		{assign var=departure_date value=$clsISO->getStrToTime($item.check_in_book_z)}
		{assign var=end_date value=$clsTour->getEndDate($departure_date,$tour_id)}
		{assign var=title_package value=$clsTour->getTitle($item.tour_id_z)}
		{assign var=link_package value=$clsTour->getLink($item.tour_id_z)}
		{assign var=number_adults_z value=$item.number_adults_z|default:0}
		{assign var=number_child_z value=$item.number_child_z|default:0}
		{assign var=number_infants_z value=$item.number_infants_z|default:0}
		{assign var=number_infants_z value=$item.number_infants_z|default:0}
		{assign var=average_price_per_infant value=$item.total_price_infants / $number_infants_z}
		{assign var=average_price_per_child value=$item.total_price_child / $number_child_z}
		{assign var=average_price_per_adult value=$item.total_price_adults / $number_adults_z}

			<div class="container">
		<div class="d-flex justify-content-center main-container">
			<form action="/{$_LANG_ID}/shopping-cart/booking.html" class="booking_content d-flex  justify-content-between" method="POST" id="formBooking">
				<div class="booking_left d-flex flex-column align-items-center ">
					<div class="information_services item_booking_content">
						<div class="title_booking ">
							Information Services
						</div>
						<div class="content d-flex flex-column ">
							<div class="unika_travel d-flex justify-content-between align-items-start  flex-wrap">
								<div class="item_input d-flex flex-column  box_validate">
									<label for="travel_date">Travel date*</label>
									<input type="text" id="travel_date" name="travel_date" class="travel_input input_start"
										   data-class="value_travel_date" value="{$clsISO->converTimeToText5($departure_date)}">
									{assign var="numberOfDays" value=$clsTour->getNumberDay($item.tour_id_z)}
									<input type="hidden" class="days_booking" value="{$numberOfDays - 1}">
								</div>
								<div class="item_input d-flex flex-column ">
									<label for="end_date">End Date</label>
									<input type="text" id="end_date" class="input_end" data-class="value_end_date" disabled>
								</div>
							</div>
							<div class="number_travelers d-flex flex-column  box_validate" data-class="participants">
                                    <span class="title_content">
                                        Add the number of travelers to get the price of your trip
                                    </span>
								<div class="unika_number_travel d-flex align-items-center justify-content-between flex-wrap ">
									<div class="item_travelers item_content_booking d-flex  align-items-center">
										<span class="title">Adults</span>
										<div class="number d-flex " data-class="amount_adults">
											<span
													class="d-flex align-items-center value_travelers justify-content-center"
													name="value_travelers" contenteditable="false" onpaste="return false" contenteditable="true"
													>{$number_adults_z}</span>

										</div>
									</div>
									<div class="item_travelers item_content_booking d-flex ">
										<div class="title d-flex flex-column">
											<span>Children</span>
										</div>
										<div class="number d-flex " data-class="amount_children">
											<span
													class="d-flex align-items-center value_travelers justify-content-center"
													name="value_travelers" contenteditable="false" onpaste="return false" contenteditable="true"
													>{$number_child_z}</span>

										</div>
									</div>
									<div class="item_travelers item_content_booking d-flex ">
										<div class="title d-flex flex-column">
											<span>Infants</span>
										</div>
										<div class="number d-flex " data-class="amount_infants">
											<span
													class="d-flex align-items-center  value_travelers justify-content-center"
													name="value_travelers" contenteditable="false" onpaste="return false" contenteditable="true"
													>{$number_infants_z}</span>
										</div>
									</div>
								</div>
							</div>
							{if $lstRoom}
							<div class="distribution number_travelers d-flex flex-column  box_validate" data-class="room">
                                    <span class="title_content">
                                        Distribution of travelers
                                    </span>
								<div class="d-flex flex-column ">
									{section name=i loop=$lstRoom}
									<div
											class="item_distribution item_content_booking d-flex justify-content-between align-items-start  flex-wrap">
										<label class="item_checkbox">
											<div class="d-flex flex-column">
												<span class="item_checkbox_title title">{$clsTourProperty->getTitle($lstRoom[i].room_id)}</span>
												<div class="item_checkbox_money">US <span>${$lstRoom[i].price_room}</span></div>
											</div>
											<input type="checkbox" name="checkbox_room[]" {if $lstRoom[i].number_room} checked {/if} value="{$lstRoom[i].room_id}">
											<span class="checkmark"></span>
										</label>
										<input type="hidden" name="price_room[]" value="{$lstRoom[i].price_room}">
										<div class="calc_distribution lst_room number align-items-center {if $lstRoom[i].number_room}active{/if}"
											 data-class="amount_double_room_{$lstRoom[i].room_id}">
											<div class="minus item_calc_dis cursor"></div>
											<span contenteditable="true" class="value value_distribution"
												  name="value_distribution" onpaste="return false" data-price="{$lstRoom[i].price_room}">{if $lstRoom[i].number_room}{$lstRoom[i].number_room}{else}1{/if}</span>
											<input type="hidden" name="amount_room_id[]" value="0">
											<div class="plus item_calc_dis cursor active"></div>
										</div>
									</div>
									{/section}
								</div>
							</div>
							{/if}
						</div>
					</div>
					{if $lstAddOnService}
					<div class="other_services item_booking_content number_travelers" data-class="other-services">
						<div class="title_booking ">
							Other Services
						</div>
						<div class="content d-flex flex-column ">
							<div class="distribution d-flex flex-column ">
								{section name=i loop=$lstAddOnService}
								<div
										class="item_distribution item_content_booking d-flex justify-content-between align-items-start  flex-wrap">
									<label class="item_checkbox">
										<div class="d-flex flex-column">
											<span class="item_checkbox_title title">{$lstAddOnService[i].title}</span>
											<div class="item_checkbox_money">US <span>${$lstAddOnService[i].price}</span></div>
										</div>
										<input type="checkbox" name="service_id[]" value="{$lstAddOnService[i].addonservice_id}">
										<span class="checkmark"></span>
									</label>
									<div class="calc_distribution number align-items-center"
										 data-class="amount_other_{$lstAddOnService[i].price}">
										<div class="minus item_calc_dis cursor"></div>
										<span contenteditable="true" class="value" onpaste="return false"
											  data-price="{if $lstAddOnService[i].extra gt 0} {$lstAddOnService[i].price} {else} 0 {/if}">0</span>
										<input type="hidden" name="amount_service_id[]" value="0">
										<div class="plus item_calc_dis cursor active"></div>
									</div>
								</div>
								{/section}
							</div>
						</div>
					</div>
					{/if}
					<div class="contact_information item_booking_content">
						<div class="title_booking ">
							Contact information
						</div>
						<div class="content d-flex flex-wrap align-items-start justify-content-start flex-wrap ">
							<div class="d-flex flex-column information-3  box_validate">
								<label for="title">Title*</label>
								<select class="select2" name="title" id="title">
									<option value="">-- Please Select --</option>
									<option value="Mr.">Mr.</option>
									<option value="Mrs.">Mrs.</option>
									<option value="Ms.">Ms.</option>
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
								<input type="text" name="phone" class="information_input" placeholder="Enter your phone">
							</div>
							<div class="d-flex flex-column information-3 ">
								<label for="city">City</label>
								<select class="form-select state select2" name="city" id="city" aria-label="Default select example" onchange="loadCities()">
									<option value="">-- Please Select --</option>
								</select>
							</div>
							<div class="d-flex flex-column information-7 ">
								<label for="title">Address</label>
								<input type="text" name="address" class="information_input"
									   placeholder="Enter your address">
							</div>
							<label class="item_checkbox ">
								I am participating in the trip
								<input type="checkbox" name="checkbox_trip">
								<span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="payment_methods item_booking_content">
						<div class="title_booking ">
							Payment methods
						</div>
						<div class="content d-flex flex-column ">
							{if $clsConfiguration->getValue('SitePay_CashStatus_Mode') eq '1'}
								{assign var = SitePay_CashName value = SitePay_CashName_|cat:$_LANG_ID}
								{assign var = SitePay_CashDesc value = SitePay_CashDesc_|cat:$_LANG_ID}
							<div class="type_payment d-flex flex-column ">
								<label class="item_radio">{$clsConfiguration->getValue($SitePay_CashName)}
									<input type="radio" checked name="payment_method" class="radio" value="{$PAYMENT_CASH_ID}">
									<span class="checkmark"></span>
								</label>
								{if $clsConfiguration->getValue($SitePay_CashDesc)}
								<div class="describe active">
                                        <span>
                                            {$clsConfiguration->getValue($SitePay_CashDesc)|html_entity_decode}
                                        </span>
								</div>
								{/if}
							</div>
							{/if}
							{if $clsConfiguration->getValue('SitePay_Bank_Mode') eq '1'}
								{assign var = SitePay_BankName value = SitePay_BankName_|cat:$_LANG_ID}
								{assign var = SitePay_BankDesc value = SitePay_BankDesc_|cat:$_LANG_ID}
							<div class="type_payment d-flex flex-column ">
								<label class="item_radio">{$clsConfiguration->getValue($SitePay_BankName)}
									<input type="radio" name="payment_method" class="radio" value="{$PAYMENT_TRANSFER_ID}">
									<span class="checkmark"></span>
								</label>
								{if $clsConfiguration->getValue($SitePay_BankDesc)}
								<div class="describe">
                                        <span>
                                            {$clsConfiguration->getValue($SitePay_BankDesc)|html_entity_decode}
                                        </span>
								</div>
								{/if}
							</div>
							{/if}
							{if $clsConfiguration->getValue('Paypal_Status_Mode') eq '1'}
								{assign var = Paypal_Name value = Paypal_Name_|cat:$_LANG_ID}
							<div class="type_payment d-flex flex-column ">
								<label class="item_radio">{$clsConfiguration->getValue($Paypal_Name)}
									<input type="radio" name="payment_method" class="radio" value="{$PAYMENT_PAYPAL_GATEWAY}">
									<span class="checkmark"></span>
								</label>
							</div>
							{/if}
							{if $clsConfiguration->getValue('ONEPAY_Status_Mode') eq '1'}
								{assign var = ONEPAY_Name value = ONEPAY_Name_|cat:$_LANG_ID}
								<div class="type_payment d-flex flex-column ">
									<label class="item_radio">{$clsConfiguration->getValue($ONEPAY_Name)}
										<input type="radio" name="payment_method" class="radio" value="{$PAYMENT_ONEPAY_ATM}">
										<span class="checkmark"></span>
									</label>
								</div>
							{/if}
							{if $clsConfiguration->getValue('ONEPAY_Visa_Status_Mode') eq '1'}
								{assign var = ONEPAY_Visa_Name value = ONEPAY_Visa_Name_|cat:$_LANG_ID}
							<div class="type_payment d-flex flex-column ">
								<label class="item_radio">{$clsConfiguration->getValue($ONEPAY_Visa_Name)}
									<input type="radio" name="payment_method" class="radio" value="{$PAYMENT_ONEPAY_VISA}">
									<span class="checkmark"></span>
								</label>
							</div>
							{/if}
						</div>
					</div>
					<button class="btn_payment false d-flex align-items-center justify-content-center " type="submit">
						Payment
						<div class="div_img">
							<i class="fa-regular fa-arrow-right"></i>
						</div>
					</button>
				</div>
				<div class="booking_right d-flex flex-column ">
					<div class="summary d-flex flex-column  justify-content-start">
						<div class="title SF-Pro-Medium">Summary</div>
						<div class="div_img">
							<img src="{$clsTour->getImage($item.tour_id_z, 364, 194)}" alt="Images">
						</div>
						<div class="title_content">
							<a class="title_content" href="{$link_package}" title="{$title_package}">{$title_package}</a>
						</div>
						<div class="booking_right_content d-flex flex-column ">
							<div class="item_content d-flex flex-column ">
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">Travel Date:</span>
									<span class="span_content value_travel_date">{$clsISO->converTimeToText5($departure_date)}</span>
								</div>
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">End Date:</span>
									<span class="span_content value_end_date"></span>
								</div>
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">Duration:</span>
									<span class="span_content duration">{$clsTour->getTripDurationx($tour_id)}</span>
								</div>
							</div>
							<div class="item_content d-flex flex-column ">
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">Participants:</span>
									<div class="participants span_content d-flex flex-column  align-items-end">
										{if $number_adults_z}<span class="span_item"><span class="amount_adults">{$number_adults_z}</span> x Adults</span>{/if}
										{if $number_child_z}<span class="span_item"><span class="amount_adults">{$number_child_z}</span> x Children</span>{/if}
										{if $number_infants_z}<span class="span_item"><span class="amount_adults">{$number_infants_z}</span> x Infants</span>{/if}
									</div>
								</div>
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">Room:</span>
									<div class="room span_content d-flex flex-column align-items-end">
									</div>
								</div>
							</div>
							<div class="item_content d-flex flex-column ">
								<div class="d-flex justify-content-between align-items-start  width-100">
									<span class=" span_title">Other services:</span>
									<div class="span_content d-flex flex-column  align-items-end other-services">
									</div>
								</div>
							</div>
							<div class="d-flex flex-column ">
								<div class="d-flex justify-content-between align-items-start ">
									<span class=" span_title">Total:</span>
									<span class="span_content total_booking">US ${$totalGrand}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="subtotal d-flex flex-column ">
						<div class="d-flex flex-column ">
							<div class="d-flex justify-content-between align-items-start ">
								<span class=" span_title">Deposit:</span>
								<span class="span_content deposit_booking">US ${$totalPriceDeposit}</span>
							</div>
						</div>
						<div class="d-flex flex-column">
							<div class="d-flex justify-content-between align-items-start ">
								<span class="span_title">Remaining:</span>
								<span class="span_content remaining_booking">US ${$totalRemaining}</span>
							</div>
						</div>
						<div class="d-flex flex-column ">
							<div class="d-flex justify-content-between align-items-start ">
								<span class="span_title">Payment amount:</span>
								<p class="txt_monpr">US <span class="span_content payment_amount">${$totalPriceDeposit}</span></p>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="booking" value="booking">
				<input type="hidden" name="totalgrand" id="totalgrand" value="{$clsISO->formatPrice($totalGrand)}">
				<input type="hidden" name="deposit" id="price_deposit" value="{$clsISO->formatPrice($totalPriceDeposit)}">
				<input type="hidden" id="deposit" value="{$item.deposit}">
				<input type="hidden" id="total_price_adults" value="{$item.total_price_adults}">
				<input type="hidden" id="total_price_child" value="{if $item.total_price_child}{$item.total_price_child}{else}0{/if}">
				<input type="hidden" id="total_price_infants" value="{if $item.total_price_infants}{$item.total_price_infants}{else}0{/if}">
				<input type="hidden" name="totalFinal" class="totalFinal" value="{$totalPriceDeposit}">
				<input type="hidden" name="exchange_rate" id="exchange_rate" value="{$_EXCHANGE_RATE}" />
			</form>
		</div>

	</div>
		{/if}
	{/foreach}
		{else}
		<div class="image_cart">
			<img src="{$URL_IMAGES}/cart.png" class="img100">
		</div>
		<div class="text">
			<h2 class="text-bold size35 mb30">{$core->get_Lang('Your cart is empty')}</h2>
			<p>{$core->get_Lang("Looks like you haven't added anything to your cart yet")}.</p>
			<a class="btn_main" href="{$DOMAIN_NAME}{$extLang}" title="{$core->get_Lang('start selection')}">{$core->get_Lang('start selection')}</a>
		</div>
	{/if}

	<div class="unika_social">
		<div class="unika_social_icons">
			<a href="https://www.youtube.com/user/vietiso" class="unika_social_icon">
				<i class="fa-brands fa-youtube" aria-hidden="true"></i>
			</a>
			<a href="https://x.com/vietiso" class="unika_social_icon">
				<i class="fa-brands fa-twitter"></i>
			</a>
			<a href="https://www.instagram.com/unikaisa" class="unika_social_icon">
				<i class="fa-brands fa-instagram" aria-hidden="true"></i>
			</a>
			<a href="https://www.facebook.com/unikasia" class="unika_social_icon">
				<i class="fa-brands fa-facebook-f" aria-hidden="true"></i>
			</a>
		</div>
	</div>
	<div class="footer_booking d-flex justify-content-center">
		<div class="container">
			<span>© 2024 Unikasia. All rights reserved.</span>
		</div>
	</div>
</div>
<select class="form-select city d-none" aria-label="Default select example" >
	<option selected>Select City</option>
</select>

<script>
	var travel_date = $('#travel_date').val();
	var total_price_adults  = $('#total_price_adults').val();
	var total_price_child  = $('#total_price_child').val();
	var total_price_infants  = $('#total_price_infants ').val();
</script>
<script src="{$URL_JS}/cart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="{$URL_JS}/jquery.validate.min.js"></script>

{literal}
<script>
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

</script>
{/literal}