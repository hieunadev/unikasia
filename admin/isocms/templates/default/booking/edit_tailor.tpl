<div class="container_booking" style="height: 100%">
    <div class="content_head">
        <a href="{$DOMAIN_NAME}/admin/index.php?mod=booking&act={$action}" class="d-flex align-items-center">
            <div class="text_booking">
                <p class="booking_name">{$oneItem.booking_code}</p>
                <span class="status">{$core->get_Lang("Still unconfirmed service")}</span>
            </div>
        </a>
        {*<a href="{$PCMS_URL}/?mod={$mod}&act=print&action={$action}&booking_id={$core->encryptID($pvalTable)}"
            class="btn-print fr">
            <i class="fa fa-print"></i> {$core->get_Lang('print')}
        </a>*}

    </div>
    <div id="bookingTab" class="booking_tabs">
        <ul>
            <li class="item_booking_tab active" data-box="box01"><a>{$core->get_Lang('Tailor Made Tour')}</a></li>
            <li class="item_booking_tab" data-box="box02"><a>{$core->get_Lang('Confirmation Email')}</a></li>
        </ul>
    </div>
    <div id="tab_content">
        <div class="tabbox box01">
            <div class="wrap">
                <div class="unika_admin_box">
                    <h3>Customer Travel Information’s</h3>
                    <p class="booking_item">
                        <label class="bold600" for="">Title: </label>
                        <span class="">{$oneItem.title}</span>
                    </p>
                    <p class="booking_item">
                        <label class="bold600" for="">Full name: </label>
                        <span class="">{$oneItem.name}</span>
                    </p>
                    <p class="booking_item">
                        <label class="bold600" for="">Nationality: </label>
                        <span class="">{$clsCountry->getTitle($oneItem.nationality)}</span>
                    </p>
                    <p class="booking_item">
                        <label class="bold600" for="">Email: </label>
                        <span class="">{$oneItem.email}</span>
                    </p>
                    <p class="booking_item">
                        <label class="bold600" for="">Phone: </label>
                        <span class="">{$oneItem.phone}</span>
                    </p>
                    {if $oneItem.social_media}
                    <p class="booking_item">
                        <label class="bold600" for="">Social Media: </label>
                        <span class="">{$oneItem.social_media}</span>
                    </p>
                    {/if}
                    <p class="contact_edit bgf9f9f9">
                        <button class="unikasia_btn_edit" data-id="information" data-toggle="modal" data-target="#unikasia_form_edit">Edit</button>
                    </p>
                </div>
                <div class="unika_admin_box">
                    <h3>Customer Travel’s Preferences</h3>
                    {if $oneItem.arrival_date}
                    <p class="booking_item">
                        <label class="bold600" for="">Travel Date: </label>
                        <span class="">{$oneItem.arrival_date}</span>
                    </p>
                    {/if}
                    {if $oneItem.duration}
                    <p class="booking_item">
                        <label class="bold600" for="">Duration: </label>
                        <span class="">{$oneItem.duration}</span>
                    </p>
                    {/if}
                    {if $oneItem.budget}
                    <p class="booking_item">
                        <label class="bold600" for="">Budget per person: </label>
                        <span class="">{$oneItem.budget}</span>
                    </p>
                    {/if}
                    {if $oneItem.arrival_airport}
                    <p class="booking_item">
                        <label class="bold600" for="">Arrival Airport: </label>
                        <span class="">{$clsTailorProperty->getTitle($oneItem.arrival_airport)}</span>
                    </p>
                    {/if}
                    {if $oneItem.tour_guide}
                    <p class="booking_item">
                        <label class="bold600" for="">Tour guide preference: </label>
                        <span class="">{$clsTailorProperty->getTitle($oneItem.tour_guide)}</span>
                    </p>
                    {/if}
                    {if $oneItem.adult || $oneItem.children || $oneItem.infant}
                    <p class="booking_item">
                        <label class="bold600" for="">Participants: </label>
                        <span class="">{$clsClassTable->getParticipants($oneItem.tailor_made_tour_id)}</span>
                    </p>
                    {/if}
                    {if $oneItem.travel_style}
                    <p class="booking_item">
                        <label class="bold600" for="">Travel Styles & Activities: </label>
                        <span class="">{$clsTourCategory->getTitle($oneItem.travel_style)}</span>
                    </p>
                    {/if}
                    {if $oneItem.meals}
                    <p class="booking_item">
                        <label class="bold600" for="">Meals: </label>
                        <span class="">{$clsTailorProperty->getTitle($oneItem.meals)}</span>
                    </p>
                    {/if}
                    {if $oneItem.suitable}
                    <p class="booking_item">
                        <label class="bold600" for="">The most suitable time to reach you: </label>
                        <span class="">{$oneItem.suitable}</span>
                    </p>
                    {/if}
                    <p class="contact_edit bgf9f9f9">
                        <button class="unikasia_btn_edit" data-id="preference" data-toggle="modal" data-target="#unikasia_form_edit">Edit</button>
                    </p>
                </div>
                <div class="unika_admin_box">
                    <h3 style="padding: 0;">Destinations</h3>
                    {if $oneItem.destinations}
                    <p class="booking_item">
                        <span class="">{$clsClassTable->renderTextDestinations($oneItem.tailor_made_tour_id)}</span>
                    </p>
                    {/if}
                    <p class="contact_edit bgf9f9f9">
                        <button class="unikasia_btn_edit" data-id="destinations" data-toggle="modal" data-target="#unikasia_form_edit">Edit</button>
                    </p>
                </div>
                <div class="unika_admin_box">
                    <h3>Accommodations preference</h3>
                    {if $oneItem.accommodation}
                    <p class="booking_item">
                        <label class="bold600" for="">Accommodations: </label>
                        <span class="">{$clsTailorProperty->getTitle($oneItem.accommodation)}</span>
                    </p>
                    {/if}
                    {if $oneItem.type_room}
                    <p class="booking_item">
                        <label class="bold600" for="">Type of room: </label>
                        <span class="">{$clsClassTable->getTypeRoom($oneItem.type_room)}</span>
                    </p>
                    {/if}
                    <p class="contact_edit bgf9f9f9">
                        <button class="unikasia_btn_edit" data-id="accommodations" data-toggle="modal" data-target="#unikasia_form_edit">Edit</button>
                    </p>
                </div>
                <div class="unika_admin_box">
                    <h3>Customer Special Requirements</h3>
                    {if $oneItem.special}
                    <p class="booking_item">
                        <span class="">{$oneItem.special}</span>
                    </p>
                    {/if}
                    <p class="contact_edit bgf9f9f9">
                        <button class="unikasia_btn_edit" data-id="special" data-toggle="modal" data-target="#unikasia_form_edit">Edit</button>
                    </p>
                </div>
            </div>
        </div>
		<div id="unikasia_form_edit" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form id="unika_form_tailor" class="modal-content" method="POST" enctype="multipart/form-data" onsubmit="return false">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<input type="hidden" value="{$pvalTable}" name="tailor_made_tour_id">
						<h4 class="modal-title">{$core->get_Lang("Edit Tailor Made Tour")}</h4>
					</div>
					<div class="modal-body">
						<p class="error" style="color: red;display: none"></p>
						<div class="unikasia_body"></div>
					</div>
					<div class="modal-footer version-xs">
						<button type="button" class="btn btn-default unika_close_modal">
							{$core->get_Lang('Close')}
						</button>
						<button type="submit" class="btn btn-success submitTailorMadeTour">
							{$core->get_Lang('Update')}
						</button>
					</div>
				</form>

			</div>
		</div>
        <div class="tabbox box02" style="display: none">
            <div class="wrap">
                <div class="page-title">
                    <p class="title_box_email bold600">{$core->get_Lang('Email confirm')}</p>
                    <p class="text_email">({$core->get_Lang('Email automatically sent to customers when confirming the
                        service')})</p>
                </div>
                <div class="clearfix"></div>
                <form id="newitem" method="post" action="" enctype="multipart/form-data" class="validate-form">
                    <div class="row-field">
                        {$clsClassTable->sendMail($oneItem['tailor_made_tour_id'])}
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
let listNationality = `{$lstCountryRegion}`;
let titleOption = `{$clsISO->makeSelectTitle($title)}`;
let _ARRIVAL_AIRPORT = `{$clsTailorProperty->getSelectByProperty('_ARRIVAL_AIRPORT')}`;
let listTravelStyle = `{$listTravelStyle}`;
let _TOUR_GUIDE = `{$clsTailorProperty->getSelectByProperty('_TOUR_GUIDE')}`;
let _MEALS = `{$clsTailorProperty->getSelectByProperty('_MEALS')}`;
let _ACCOMMODATIONS = `{$clsTailorProperty->getSelectByProperty('_ACCOMMODATIONS')}`;
let _ROOM_CLASS = `{json_encode($clsTailorProperty->getListByProperty('_ROOM_CLASS'))}`;
let lstCountry = `{$lstCountry}`;
let lstCitiesValue = `{json_encode($clsClassTable->listValueCity($oneItem['tailor_made_tour_id']))}`
let lstCitiesOther = `{json_encode($clsClassTable->listOtherCity($oneItem['tailor_made_tour_id']))}`

let title = "{$oneItem.title}";
let name = "{$oneItem.name}";
let nationality = "{$oneItem.nationality}";
let email = "{$oneItem.email}";
let phone = "{$oneItem.phone}";
let arrival_date = "{$oneItem.arrival_date}";
let social_media = "{$oneItem.social_media}";
let duration = "{$oneItem.duration}";
let budget = "{$oneItem.budget}";
let arrival_airport = "{$oneItem.arrival_airport}";
let tour_guide = "{$oneItem.tour_guide}";
let adult = "{$oneItem.adult}";
let children = "{$oneItem.children}";
let infant = "{$oneItem.infant}";
let travel_style = "{$oneItem.travel_style}";
let meals = "{$oneItem.meals}";
let suitable = "{$oneItem.suitable}";
let participants = "{$clsClassTable->getParticipants($oneItem.tailor_made_tour_id)}";
let accommodation = "{$oneItem.accommodation}";
let type_room = `{json_encode($clsClassTable->getArray($oneItem.type_room))}`;
let special = "{$oneItem.special}";
let destinations = `{json_encode($clsClassTable->getArray($oneItem.destinations))}`;
</script>
{literal}
<style type="text/css">
.item_booking_tab{
	cursor: pointer;
}

.item_booking_tab.active{
	background: rgba(245, 131, 33, 0.1);
}

.item_booking_tab.active a{
	color: #f58321 !important;
	font-weight: 700 !important;
}

.table-mce {
    margin: 0 auto
}

td {
    font-size: 13px !important
}

.hidden {
    display: none !important
}

.select2 {
	width: 100% !important;
}

.unika_row{
	display: flex;
	justify-content: space-between;
}

.unika_row .form-group{
	width: 30%;
}

.form-region {
    display: flex;
    padding: 9px 10px;
    align-items: center;
    border-radius: 4px;
    border: 1px solid #CCC;
    background: #FBFBFB;
    margin-top: 12px;
	width: 40%;
}

.form-region label {
    color: #111D37;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: 24px;
	margin: 0;
}

.unika_checkbox {
    display: block;
    position: relative;
    padding-left: 35px;
    cursor: pointer;
    font-size: 16px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
	margin-bottom: 10px;
	line-height: 24px;
}

/* Hide the browser's default checkbox */
.unika_checkbox input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 24px;
  width: 24px;
  border-radius: 4px;
  border: 1px solid var(--Neutral-4, #D3DCE1);
  background-color: #FFFFFF;
}

/* When the checkbox is checked, add a blue background */
.unika_checkbox input:checked ~ .checkmark {
  background-color: #FFA718;
  border: 1px solid #FFA718;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.unika_checkbox input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.unika_checkbox .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
.form-check-label .checkmark{
  top: 5px;
}

.unika_type_room {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.unika_type_city {
    display: flex;
    flex-wrap: wrap;
    justify-content: start;
	padding-bottom: 15px;
	gap: 15px;
}

.city_other{
	margin-top: 15px;
}

.unika_option{
	display: none;
}

.unika_option.active{
	display: block;
}

label.error{
	display: block !important;
	font-size: 12px !important;
    color: red;
}
</style>
<script>
	$(function(){
		listNationality = JSON.parse(listNationality);
		listTravelStyle = JSON.parse(listTravelStyle);
		_ROOM_CLASS = JSON.parse(_ROOM_CLASS);
		type_room = JSON.parse(type_room);
		destinations = JSON.parse(destinations);
		lstCountry = JSON.parse(lstCountry);
		lstCitiesValue = JSON.parse(lstCitiesValue);
		lstCitiesOther = JSON.parse(lstCitiesOther);

		function renderTypeRoom(){
			let html = '';
			$.each(_ROOM_CLASS, function(index, item){
				html += `
					<div class="form-check form-region"> <label class="unika_checkbox" for="unika_room_${index}">
						${item.title}
						<input class="type_room form-check-region" type="checkbox" name="type_room[]" id="unika_room_${index}" value="${item.tailor_property_id}"> 
						<span class="checkmark"></span> 
						</label> 
					</div>
				`;
			})

			return html;
		}

		function renderOptionNationality(){
			let html = '';
			$.each(listNationality, function(index, item){
				{
				html += `
					<option value="${item.country_id}">${item.title}</option>
				`;
			}
			})

			return html;
		}

		function renderTravelStyle(){
			let html = '';
			$.each(listTravelStyle, function(index, item){
				{
				html += `
					<option value="${item.tourcat_id}">${item.title}</option>
				`;
			}
			})

			return html;
		}

		function renderInformation(){	
			let html = `
				<input name="check_information" type="hidden" class="form-control" value="1">
				<div class="form-group box_validate"> 
					<label class="col-form-label text-bold">
						Title<span class="text-red">*</span>
					</label> 
					<select id="title" name="title" class="tailor_select2 form-control">
						<option value="" disabled selected hidden>-- Please Select --</option>
						${titleOption}
					</select>
				</div>
				<div class="form-group box_validate"> 
					<label class="col-form-label text-bold">
						Full Name<span class="text-red">*</span>
					</label> 
					<input id="fullname" name="name" type="text" class="form-control" value="${name}" placeholder="Enter name">
				</div>
				<div class="form-group box_validate"> 
					<label class="col-form-label text-bold">
						Nationality <span class="text-red">*</span>
					</label> 
					<select id="nationality" name="nationality" class="nationality tailor_select2 form-control">
						<option value="" disabled selected hidden>-- Please Select --</option>
						${renderOptionNationality()}
					</select>
				</div>
				<div class="form-group box_validate"> 
					<label class="col-form-label text-bold">
						Email<span class="text-red">*</span>
					</label> 
					<input id="email" name="email" type="text" class="form-control" value="${email}" placeholder="Enter email">
				</div>
				<div class="form-group box_validate"> 
					<label class="col-form-label text-bold">
						Phone<span class="text-red">*</span>
					</label> 
					<input id="phone" name="phone" type="text" class="form-control" value="${phone}" placeholder="Enter phone">
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Social Media
					</label> 
					<input id="social_media" name="social_media" type="text" class="form-control" value="${social_media}" placeholder="Enter your name">
				</div>
			`;

			$('.unikasia_body').html(html);
			$("#title").val(title);
			$('.nationality').val(nationality);
		}
		
		function renderPreference(){
			let html = `
				<input name="check_preference" type="hidden" class="form-control" value="1">
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Travel Date
					</label> 
					<input type="text" class="form-control arrival_date" value="${arrival_date}" name="arrival_date" placeholder="">
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Duration
					</label> 
					<input id="duration" name="duration" type="text" class="duration form-control" value="${duration}" placeholder="Enter duration">
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Budget per person
					</label> 
					<input id="budget" name="budget" type="text" class="budget form-control" value="${budget}" placeholder="Enter budget">
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Arrival Airport
					</label> 
					<select id="arrival_airport" name="arrival_airport" class="arrival_airport tailor_select2 form-control">
						${_ARRIVAL_AIRPORT}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Tour guide preference
					</label> 
					<select id="tour_guide" name="tour_guide" class="tour_guide tailor_select2 form-control">
						${_TOUR_GUIDE}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Tour guide preference
					</label> 
					<select id="tour_guide" name="tour_guide" class="tour_guide tailor_select2 form-control">
						${_TOUR_GUIDE}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Participants
					</label> 
					<div class="unika_row">
						<div class="form-group"> 
							<label class="col-form-label">
								Adults
							</label> 
							<input type="number" class="form-control adult" value="${adult}" name="adult" placeholder="">
						</div>
						<div class="form-group"> 
							<label class="col-form-label">
								Children
							</label> 
							<input type="number" class="form-control children" value="${children}" name="children" placeholder="">
						</div>
						<div class="form-group"> 
							<label class="col-form-label">
								Infants
							</label> 
							<input type="number" class="form-control infant" value="${infant}" name="infant" placeholder="">
						</div>
					</div>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Travel Styles & Activities
					</label> 
					<select id="travel_style" name="travel_style" class="travel_style tailor_select2 form-control">
						<option value="">-- Travel Styles --</option>
						${renderTravelStyle()}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Meals
					</label> 
					<select id="meals" name="meals" class="meals tailor_select2 form-control">
						${_MEALS}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						The most suitable time to reach
					</label> 
					<input id="suitable" name="suitable" type="text" class="suitable form-control" value="${suitable}" placeholder="Enter suitable">
				</div>
			`;
			
			$('.unikasia_body').html(html);
			$('.arrival_date').datepicker({
				dateFormat: 'yy-mm-dd',
				minDate: new Date()
			});
			$('.arrival_airport').val(arrival_airport);
			$('.tour_guide').val(tour_guide);
			$('.meals').val(meals);
			$('.travel_style').val(travel_style);
		}
		
		function renderAccommodations(){
			let html = `
				<input name="check_accommodations" type="hidden" class="form-control" value="1">
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Arrival Airport
					</label> 
					<select id="accommodation" name="accommodation" class="accommodation tailor_select2 form-control">
						${_ACCOMMODATIONS}
					</select>
				</div>
				<div class="form-group"> 
					<label class="col-form-label text-bold">
						Type of room
					</label> 
					<div class="unika_type_room">
						${renderTypeRoom()}	
					</div>

				</div>
			`;
			
			$('.unikasia_body').html(html);
			$('.accommodation').val(accommodation);
			$('.type_room').each(function(){
				let value = $(this).val();
				if(type_room.includes(value)){
					$(this).prop('checked', true);
				}
			})
		}

		function renderSpecial(){
			let html = `
				<input name="check_special" type="hidden" class="form-control" value="1">
				<div class="form-group"> 
					<textarea class="form-control input_txttravel" name="special" cols="255" rows="5" placeholder="Any must-see landmarks in your bucket list, desired accommodations, special food requirements, allergies…" style="height: 152px;">${special}</textarea>
				</div>
			`;

			$('.unikasia_body').html(html);
		}

		function renderListCity(cities, country_id){
			let html = '';
			$.each(cities, function(index, item){
				html += `
					<option value="${item.city_id}">${item.title}</option>
				`;
			})

			return html;
		}

		function renderDestinations(){
			let html = '<input name="check_destinations" type="hidden" class="form-control" value="1">';
			$.each(lstCountry, function(index, item){
				html += `
					<div class="form-group unika_form_group"> 
						<label class="unika_checkbox" for="checkbox_parent_${index}">
							${item.title}
							<input class="form-check-region" name="destination_country[]" type="checkbox" value="${item.country_id}"
								id="checkbox_parent_${index}">
							<span class="checkmark"></span>
						</label>
						<div class="unika_option form-group">
							<span class="check_all_select fr" style="margin-bottom:10px;cursor: pointer">Select all</span>
							<select name="destinations[${item.country_id}][cities]" class="js-select2-multi form-control" multiple="multiple">
								${renderListCity(item.cities, item.country_id)}
							</select>
							<input type="text" class="form-control unika_city_txt city_other city_other_${item.country_id}" value="" name="destinations[${item.country_id}][text]" placeholder="Other">	
						</div>
					</div>
				`;
			})

			$('.unikasia_body').html(html);

			$('.unika_checkbox input').each(function(){
				let value = $(this).val();
				if(destinations.includes(value)){
					$(this).prop('checked', true);
					$(this).parents('.unika_form_group').find('.unika_option').addClass('active');
				}
			})

			
			$('.js-select2-multi option').each(function(){
				let value = $(this).attr('value');
				if(lstCitiesValue.includes(value)){
					$(this).prop('selected', true);
				}
			})

			$(".js-select2-multi").select2({
				placeholder: 'Select options',
				closeOnSelect: false,
				allowClear: true 
			});

			$.each(lstCitiesOther, function(index, item){
				$(`.city_other_${item.country_id}`).val(item.other);
			})
		}

		$(document)
			.on('click', '.unika_close_modal', function(){
				$('#unikasia_form_edit').modal('hide');
			})
			.on('click', '.unikasia_btn_edit', function(){
				let data_id = $(this).attr('data-id');
				if(data_id == 'information'){
					renderInformation();
				}else if(data_id == 'preference'){
					renderPreference();
				}else if(data_id == 'accommodations'){
					renderAccommodations();
				}else if(data_id == 'special'){
					renderSpecial();
				}else if(data_id == 'destinations'){
					renderDestinations();
				}
		
				$('.tailor_select2').select2();
			})
			.on('click', '.unika_checkbox', function(){
				let unika_option = $(this).parents('.unika_form_group').find('.unika_option');
				if($(this).find('input').prop('checked')){
					unika_option.addClass('active');
				}else{
					unika_option.removeClass('active');
				}
			})
			.on('click', '.item_booking_tab', function(){
				$('.item_booking_tab').removeClass('active');
				$('.tabbox').hide();
				let data_box = $(this).attr('data-box');
				$(`.${data_box}`).show();
				$(this).addClass('active');
			})
			.on('click', '.check_all_select', function(){
				let allOptions = $(this).parents('.unika_option').find('option');
				allOptions.each(function() {
					$(this).prop('selected', true);
				});
				$('.js-select2-multi').trigger('change');
			})

		$('#unika_form_tailor').validate({
            errorPlacement: function (error, element) {
                error.appendTo(element.parents(".box_validate"));
                error.wrap("<span class='errors'>");
                element.parents('.box_validate').addClass('validate_input');
            },
            highlight: function (element) {
                $(element).parents('.box_validate').addClass('validate_input')
                $(element).addClass('form-control-danger')
            },
            success: function (label, element) {
                $(element).parents('.box_validate').removeClass('validate_input')
                $(element).removeClass('form-control-danger')
                label.parents('.errors').remove();
            },
            ignore: [],
            debug: false,
            rules: {
                title: "required",
                name: "required",
                nationality: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: "required",
                recapcha: "required",
            },
            messages: {
                title: "Your title should not be empty",
                name: "Your full name should not be empty",
                nationality: "Please select country",
                email: {
                    required: "Your email should not be empty",
                    email: "Please enter a valid email address"
                },
                phone: "Your telephone should not be empty",
            },
            submitHandler: function () {
                let formData = new FormData();

                $('#unika_form_tailor').find('input, select, textarea').each(function(){
                    let name_val = $(this).attr('name');
					if(name_val){
						let value = $(this).val();
						console.log('value', value)
						let is_check_parents = $(this).parents('.unika_form_group').find('.unika_checkbox input').prop('checked')
						if($(this).hasClass('form-check-region') || $(this).hasClass('js-select2-multi')  ){
							if($(this).hasClass('type_room') && $(this).prop('checked')){
								formData.append(name_val, value);
							}else if(is_check_parents && value){
								formData.append(name_val, value);
							}
						}else if($(this).hasClass('unika_check_all')){
							if($(this).prop('checked')){
								formData.append(name_val, value);
							}
						}else if($(this).hasClass('unika_city_txt')){
							if(value != '' && is_check_parents){
								formData.append(name_val, value);
							}
						}else{
							formData.append(name_val, value);
						}
					}
                    
                })

                $.ajax({
                    type: "POST",
                    url: path_ajax_script+"/index.php?mod=booking&act=ajaxUpdateTailor",
                    data: formData,
                    processData: false, 
                    beforeSend: function (xhr) {
                        // vietiso_loading(1);
                    },
                    contentType: false,
                    dataType: 'JSON',
                    success: function (res) {
						console.log('res:', res)
						vietiso_loading(0);
						alert(res.message);
                        if(res.result){
                            window.location.reload();
                        }   
						
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('Lỗi:', textStatus, errorThrown);
                    }
                });
            }
        });
	})
</script>
{/literal}