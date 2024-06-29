<div class="container_booking" style="height: 100%">
	<div class="content_head">
		<a href="{$DOMAIN_NAME}/admin/index.php?mod=booking&act={$action}" class="d-flex align-items-center">
			<div class="text_booking">
				<p class="booking_name">{$oneItem.booking_code}</p>
				<span class="status">{$core->get_Lang("Still unconfirmed service")}</span>
			</div>
		</a>
		{*<a href="{$PCMS_URL}/?mod={$mod}&act=print&action={$action}&booking_id={$core->encryptID($pvalTable)}" class="btn-print fr">
			<i class="fa fa-print"></i> {$core->get_Lang('print')}
		</a>*}
		
	</div>
	<div id="bookingTab" class="booking_tabs">
		<ul>
			<li><a href="javascript:void();">{$core->get_Lang('Tailor Made Tour')}</a></li>
			<li><a href="javascript:void();">{$core->get_Lang('Confirmation Email')}</a></li>
		</ul>
	</div>
	<div id="tab_content">
		<div class="tabbox">
			<div class="wrap">
				<form id="unika_tailor_form" class="unika_tailor_form" method="POST" enctype="multipart/form-data" onsubmit="return false">
					<div class="box_info">
						<h3 class="txt_infotravel">{$core->get_Lang('Your Travel Information’s')}</h3>
						<div class="form-group"> 
							<label class="col-form-label text-bold">
								Full name<span class="text-red">*</span>
							</label> 
							<select id="title" name="title" class="tailor_select2 form-control">
								<option value="" disabled selected hidden>-- Please Select --</option>
								{$clsISO->makeSelectTitle($title)}
							</select>
						</div>
					</div>
					<h3 class="txt_infotravel">{$core->get_Lang('Your Travel Information’s')}</h3>
					<div class="form-group"> 
						<label class="col-form-label text-bold">
							Full name<span class="text-red">*</span>
						</label> 
						<input type="text" class="form-control required" value="Matsuda" name="full_name" placeholder=""> </div>
					<section class="input_informationtrip">
						<div class="travelinf">
							<div class="container">
								<div class="txt_inftravel">
									

									<div class="input_inf">
										<div class="row">
											<div class="col-md-4 box_validate">
												<label for="title" class="txtlabel">{$core->get_Lang('Title')}
													<span style="color:black">*</span>
												</label>
												
											</div>
											<div class="col-md-8 box_validate">
												<label for="fullname" class="txtlabel">{$core->get_Lang('Full Name')}
													<span style="color:black"> *</span>
												</label>
												<input id="fullname" name="name" type="text"
													class="form-control select-input-inf required" value=""
													placeholder="Enter your name">
											</div>
										</div>
										<div class="row">
											<div class="col-md-4 box_validate">
												<label for="nationality" class="txtlabel">{$core->get_Lang('Nationality')}
													<span style="color:black"> *</span>
												</label>
												<select name="nationality" id="nationality"
													class="tailor_select2 form-select select-input-inf required">
													<option value="" disabled selected hidden>-- {$core->get_Lang('Please Select')} --
													</option>
													{section name=i loop=$lstCountryRegion}
													<option value="{$lstCountryRegion[i].country_id}">{$lstCountryRegion[i].title}
													</option>
													{/section}
												</select>
											</div>
											<div class="col-md-4 box_validate">
												<label for="email" class="txtlabel">{$core->get_Lang('Email')}
													<span style="color:black"> *</span>
												</label>
												<input id="email" name="email" type="text"
													class="form-control select-input-inf required" value=""
													placeholder="Enter your mail">
											</div>
											<div class="col-md-4 box_validate">
												<label for="phone" class="txtlabel">{$core->get_Lang('Phone Number')}
													<span style="color:black"> *</span>
												</label>
												<input id="phone" name="phone" type="text"
													class="unika_tailor_phone form-control select-input-inf required"
													placeholder="Enter your phone">
											</div>
										</div>

										<div class="row">
											<div class="col-12">
												<label for="socialMedia" class="txtlabel">{$core->get_Lang('Social Media')}</label>
												<input type="text" class="form-control select-input-inf" id="socialMedia" name="social_media"
													placeholder="Facebook, Whatsapp, Zalo,..">
											</div>
										</div>
									</div>

								</div>


							</div>

					</section>

					<section class="input_informationtrip">
						<div class="travelinf">
							<div class="container">
								<div class="txt_inftravel">
									<h3 class="txt_infotravel">{$core->get_Lang('Your Travel’s Preferences')}</h3>

									<div class="input_inf">
										<div class="row">

											<div class="col-md-4">
												<label for="traveldate" class="txtlabel">{$core->get_Lang('Travel Date')}</label>
												<p class="txt_smalltrip">{$core->get_Lang('approximately')}</p>
												<div class="input-group">
													<i class="fa-solid fa-calendar"></i>
													<input type="text" class="form-control wpcf7-datepicker" autocomplete="off"
														name="arrival_date" id="arrival_date" placeholder="Apr 1, 2024"
														value='{$PostVal.arrival_date|date_format:"%b %e, %Y"}' />
												</div>
												<div id="error_arrival_date" class="error"></div>
											</div>


											<div class="col-md-4">
												<label for="duration" class="txtlabel">{$core->get_Lang('Duration')}</label>
												<p class="txt_smalltrip">{$core->get_Lang('in Days')}</p>

												<input type="duration" name="duration" class="duration form-control select-input-inf" id="duration"
													placeholder="Example: 7 Days">
											</div>
											<div class="col-md-4">
												<label for="bugetperson" class="txtlabel">{$core->get_Lang('Budget per person')}</label>
												<p class="txt_smalltrip">{$core->get_Lang('excluding international flights')}</p>

												<input type="text" name="budget" class="form-control select-input-inf" id="bugetperson"
													placeholder="Example: 2.000$">
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<label for="arrival-airport" class="txtlabel">
													{$core->get_Lang('Arrival Airport')}
												</label>
												<select class="tailor_select2 form-select select-input-inf" name="arrival_airport" id="arrival-airport">
													{$clsTailorProperty->getSelectByProperty('_ARRIVAL_AIRPORT')}
												</select>
											</div>
											<div class="col-md-6">
												<label for="tourguide" class="txtlabel ">{$core->get_Lang('Tour guide
													preference')}</label>
												<select class="tailor_select2 form-select select-input-inf" name="tour_guide" id="tourguide">
													{$clsTailorProperty->getSelectByProperty('_TOUR_GUIDE')}
												</select>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="choose-participants">
													<div class="label_box">
														<label for="participants" class="txtlabel">
															{$core->get_Lang('Participants')}
														</label>
													</div>
													<div class="tailor_participant_txt">
														<div>
															<i class="fa-regular fa-user-vneck"></i>
															<span class="tailor_participant_text"></span>
														</div>
														<i class="fa-light fa-chevron-down"></i>
													</div>
													<div class="tailor_participants">
														<div class="tailor_participant_content">
															<div class="tailor_participant_item">
																<div class="tailor_participant_item_txt">
																	Adults
																</div>
																<div class="tailor_participant_event">
																	<div class="tailor_minus">
																		<i class="fa-regular fa-minus"></i>
																	</div>
																	<input inputmode="numeric" class="unika_inp_participant" pattern="[0-9]*" name="adult" value="0">
																	<div class="tailor_plus">
																		<i class="fa-regular fa-plus"></i>
																	</div>
																</div>
															</div>
															<div class="tailor_participant_item">
																<div class="tailor_participant_item_txt">
																	Children
																</div>
																<div class="tailor_participant_event">
																	<div class="tailor_minus">
																		<i class="fa-regular fa-minus"></i>
																	</div>
																	<input inputmode="numeric" class="unika_inp_participant" pattern="[0-9]*" name="children" value="0">
																	<div class="tailor_plus">
																		<i class="fa-regular fa-plus"></i>
																	</div>
																</div>
															</div>
															<div class="tailor_participant_item">
																<div class="tailor_participant_item_txt">
																	Infants
																</div>
																<div class="tailor_participant_event">
																	<div class="tailor_minus">
																		<i class="fa-regular fa-minus"></i>
																	</div>
																	<input inputmode="numeric" class="unika_inp_participant" pattern="[0-9]*" name="infant" value="0">
																	<div class="tailor_plus">
																		<i class="fa-regular fa-plus"></i>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<label for="travelstyles" class="txtlabel ">
													{$core->get_Lang('Travel Styles &amp; Activities')}
												</label>
												<select class="tailor_select2 form-select select-input-inf" name="travel_style" id="travelstyles">
													<option value="">-- Travel Styles --</option>
													{section name=i loop=$listTravelStyle}
													{assign var=tourcat_id value=$listTravelStyle[i].tourcat_id}
													<option value="{$tourcat_id}">
														{$clsTourCategory->getTitle($tourcat_id)}
													</option>
													{/section}

												</select>

											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="meals" class="txtlabel">{$core->get_Lang('Meals')}</label>
												<select class="tailor_select2 form-select select-input-inf" id="meals" name="meals">
													{$clsTailorProperty->getSelectByProperty('_MEALS')}
												</select>
											</div>

											<div class="col-md-6">
												<label for="suitabletime" class="txtlabel">The most suitable time to reach you</label>
												<input type="text" name="suitable" class="form-control select-input-inf" id="suitabletime"
													placeholder="In the morning, the afternoon,... or at a specific time">
											</div>
										</div>
										<hr style="background: #D3DCE1;">

										<div class="checkbox_destination">
											<h3 class="txt_destinations">{$core->get_Lang('Destinations')}</h3>
											<div class="list_checkboxtravel">
												<div class="mt-3">
													<div class="accordion" id="accordionPanelsStayOpenDestiantion">
														{section name=i loop=$lstCountry}
														<div class="accordion-item">
															<div class="accordion-header"
																id="panelsStayOpen-heading{$lstCountry[i].country_id}">
																<div class="accordion-button collapsed" type="button"
																	data-bs-toggle="collapse"
																	data-bs-target="#panelsStayOpen-collapse{$lstCountry[i].country_id}"
																	aria-expanded="false"
																	aria-controls="panelsStayOpen-collapse{$lstCountry[i].country_id}">
																	<label class="form-check-label unika_checkbox"
																		for="chkAccordion{$lstCountry[i].country_id}All">
																		{$lstCountry[i].title}
																		<input class="form-check-input chkAll me-2 unika_check_all" 
																			type="checkbox" value="{$lstCountry[i].country_id}" name="destination_country[]"
																			id="chkAccordion{$lstCountry[i].country_id}All">
																		<span class="checkmark"></span>
																	</label>
																</div>
															</div>
															<div id="panelsStayOpen-collapse{$lstCountry[i].country_id}"
																class="accordion-collapse collapse"
																aria-labelledby="panelsStayOpen-heading{$lstCountry[i].country_id}">
																<div class="accordion-body d-flex flex-wrap" style="gap:12px">
																	{assign var=cities value=$clsCountryEx->getListCity($lstCountry[i].country_id)}
																	{section name=t loop=$cities}
																	<div class="form-check form-region mr-12">
																		<label class="unika_checkbox"
																			for="chkAccordion{$lstCountry[i].country_id}Child{$cities[t].city_id}">{$clsCity->getTitle($cities[t].city_id)}
																			<input class="form-check-region" name="destinations[{$lstCountry[i].country_id}][]" type="checkbox" value="{{$cities[t].city_id}}"
																				id="chkAccordion{$lstCountry[i].country_id}Child{$cities[t].city_id}">
																			<span class="checkmark"></span>
																		</label>
																	</div>
																	{/section}
																	<input type="text" name="destinations[{$lstCountry[i].country_id}][text]" class="unika_city_txt form-control select-input-inf"
																		id="input-other" placeholder="Other">
																</div>
															</div>
														</div>
														{/section}
													</div>
												</div>
											</div>
											<hr style="background: #D3DCE1; margin: 24px 0 24px 0;">
											<div class="prefence_acco">
												<h3 class="txt_destinations">Accommodations preference</h3>
												<div class="select-checkbox-prefer">
													<label for="accommodations" class="txtlabel">Accommodations</label>
													<select class="tailor_select2 form-select select-input-inf" name="accommodation" id="accommodations">
														{$clsTailorProperty->getSelectByProperty('_ACCOMMODATIONS')}
													</select>
												</div>
												<div class="checkbox_type">
													<p class="txt_roomtype" style="margin: 26px 0 8px 0">Type of room you prefer</p>
													<div class="checkbox-room">
														<div class="accordion-body d-flex flex-wrap">
															{assign var=roomClass value=$clsTailorProperty->getListByProperty('_ROOM_CLASS')}
															{section name=i loop=$roomClass}
															<div class="form-check form-region me-3">
																<label class="unika_checkbox"
																	for="unika_room_{$roomClass[i].tailor_property_id}">
																	{$roomClass[i].title}
																	<input class="type_room form-check-region" type="checkbox" name="type_room[]"
																		id="unika_room_{$roomClass[i].tailor_property_id}" value="{$roomClass[i].tailor_property_id}">
																	<span class="checkmark"></span>
																</label>
															</div>
															{/section}
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</section>

					<section class="input_informationtrip">
						<div class="travelinf">
							<div class="container">
								<div class="txt_inftravel">
									<h3 class="txt_infotravel">Your Special Requirements</h3>

									<div class="input_inf2">
										<div class="row">
											<div class="col-12">
												<textarea class="form-control input_txttravel" name="special" cols="255" rows="5"
													placeholder="Any must-see landmarks in your bucket list, desired accommodations, special food requirements, allergies…"
													name="notes" style="height: 152px;"></textarea>
											</div>
										</div>
									</div>

								</div>

							</div>
					</section>

					<section class="input_informationtrip">
						<div class="travelinf">
							<div class="container">
								<div class="txt_captcha_btn">
									<div class="btn_rqfQ text-center">
										<button type="submit" class="btn btnrq" id="SubmitEnquiry">
											{$core->get_Lang('Request for Quotation')}
										</button>
									</div>
								</div>
							</div>
					</section>
				</form>
			</div>
		</div>
		<div class="tabbox" style="display: none">
			<div class="wrap">				
				<div class="page-title">
					<p class="title_box_email bold600">{$core->get_Lang('Email confirm')}</p>
					<p class="text_email">({$core->get_Lang('Email automatically sent to customers when confirming the service')})</p>
				</div>
				<div class="clearfix"></div>
				<form id="newitem" method="post" action="" enctype="multipart/form-data" class="validate-form">
					<div class="row-field">
						<div style="width: 100%;padding: 15px 22px 18px 20px;font-family: 'Segoe UI';background: #F1F1F1;font-weight: 400;color: #222222;">
							<center style="width: 100%;height: 70px;background: #101A36;">
								<div style="width: 100%;height: 100%;max-width: 650px;display: flex;justify-content: space-between;align-items:center;padding:0px 5px">
									<a href="{$DOMAIN_NAME}{$extLang}" title="IsoCMS.com"><img width="109" height="54" src="{$URL_IMAGES}/logo_isocms_mail.png" alt="IsoCMS.com"></a>
									<div style="text-align: right;color: #fff;">
										<p style="margin: 0;font-weight: 400;font-size: 14px;line-height: 19px; color: #FFFFFF;">{$core->get_Lang('Booking Code')}: {$oneItem.booking_code}</p>
										<p style="margin: 0;font-weight: 400;font-size: 14px;line-height: 19px; color: #FFFFFF;">{$core->get_Lang('Verification code')}: 12321321</p>
									</div>
								</div>
							</center>
							<!--<table style="width: 100%;max-width: 650px;">
								<tr>
									<td style="padding: 0">
										<div style="background:#fff;border-top: 5px solid #32A923;border-radius: 5px 5px 0px 0px;text-align:center;margin-top: 30px;">
											<div style="padding: 30px 30px 0px;">
												<img width="35" height="35" src="{$URL_IMAGES}/icon/icon_tick_email.png" alt="tick" style="margin-bottom: 19px">
												<h1 style="font-weight: 700;font-size: 21px;line-height: 28px;color: #32A923;margin-bottom: 34px;">{$core->get_Lang('Your service has been confirmed')}</h1>
												<div style="text-align: left;">
													<p style="font-size: 16px;line-height: 21px;margin-bottom: 17px;display: flow-root">{$core->get_Lang('Dear')} {$oneItem.full_name},</p>
													{foreach from=$tour_cart_store item=item name=i}
														{assign var=tour_id 		value=$item.tour_id_z}
														{assign var=title 			value=$clsTour->getTitle($tour_id)}
														{assign var=Depart_point 	value=$clsTour->getDepartureCity($tour_id)}
														{if $clsTour->getTextdepartureCityEnd($tour_id) != ''}
															{assign var=address 		value=$clsTour->getTextdepartureCityEnd($tour_id)}
														{else}
															{assign var=address 		value=$fullTextAddress}
														{/if}
														<p style="font-size: 16px;line-height: 21px;margin-bottom: 17px;display: flow-root"><img src="{$URL_IMAGES}/icon/icon_tick.png" alt="tick" style="margin-right: 16px;margin-right: 16px;float: left;margin-top: 6px;"><span style=" width: calc(100% - 29px); float: left; "><b>{$tour_id}: [{$Depart_point}-{$address}] {$title}</b> {$core->get_Lang('is departed from')} <b>{$Depart_point}</b> {$core->get_Lang('days')} <b>{$clsISO->converTimeToText7($item.check_in_book_z)}</b></span></p>
														<p style="font-size: 16px;line-height: 21px;margin-bottom: 17px;display: flow-root"><img src="{$URL_IMAGES}/icon/icon_tick.png" alt="tick" style="margin-right: 16px;margin-right: 16px;float: left;margin-top: 6px;"><span style=" width: calc(100% - 29px); float: left; "><b>{$core->get_Lang('Payment')}</b> {$core->get_Lang('yours will be handled by')} isoCMS. {$core->get_Lang('The')} "<b>{$core->get_Lang('Contact Information')}</b>" {$core->get_Lang('section below will give you more information')}</span></p>
														<p style="font-size: 16px;line-height: 21px;margin-bottom: 48px;display: flow-root"><img src="{$URL_IMAGES}/icon/icon_tick.png" alt="tick" style="margin-right: 16px;margin-right: 16px;float: left;margin-top: 6px;"><span style=" width: calc(100% - 29px); float: left; ">{$core->get_Lang('You can cancel for FREE until')} <b>{$clsISO->converTimeToText8($item.check_in_book_z,7,'')}</b></span></p>
													{/foreach}
												</div>
											</div>
											<div style="padding: 20px;background: rgba(245, 131, 33, 0.1);border-radius: 0px 0px 5px 5px;">
												<p style="font-size: 13px;line-height: 18px;color: #666666;width: 100%;max-width: 400px;margin: auto;">{$core->get_Lang('To view, cancel, or modify your booking, use our easy self-service')}.</p>
											</div>
										</div>
									</td>
								</tr>
								{foreach from=$tour_cart_store item=item name=i}
									{assign var=tour_id 		value=$item.tour_id_z}
									{assign var=title 			value=$clsTour->getTitle($tour_id)}
									{assign var=Depart_point 	value=$clsTour->getDepartureCity($tour_id)}
									{assign var=fullTextAddress value=$clsTour->getTextdepartureCityEnd($tour_id,'full')}
									{assign var=tour_option  	value=$clsTourOption->getTitle($item.tour__class)}
									{assign var=lstService  	value=$clsTour->getListService($tour_id)}
									{if $clsTour->getTextdepartureCityEnd($tour_id) != ''}
										{assign var=address 		value=$clsTour->getTextdepartureCityEnd($tour_id)}
									{else}
										{assign var=address 		value=$fullTextAddress}
									{/if}
									{if $item.price_deposit}
										{assign var=price_deposit  	value=$item.price_deposit}
									{else}
										{assign var=price_deposit  	value=0}
									{/if}
									{math assign="balance" equation="x-y" x=$item.total_price_z y=$price_deposit}
									
									<tr>
										<td style="padding: 0">
											<div style="background:#fff;border-radius: 5px;margin-top: 20px;padding: 30px 30px 24px;">
												<div style="padding-bottom: 20px;clear: both;height: 100%;display: flow-root;border-bottom: 1px solid rgba(0, 0, 0, 0.1);">
													<a href="{$clsTour->getLink($tour_id)}" title="{$title}"><img width="128" height="85" src="{$clsTour->getImage($tour_id,128,85)}" alt="{$title}" style="margin-right: 20px;width: 20%;height: auto; max-width: 128px;float: left">
													<h3 style=" overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; font-weight: 700; font-size: 18px; line-height: 24px; color: #222222; width: calc(80% - 20px);float:left">{$tour_id}: [{$Depart_point}-{$address}] {$title}</h3></a>
												</div>
												<div style=" padding: 20px 0px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<div style=" width: 50%; border-right: 1px solid rgba(0, 0, 0, 0.1); ">
														<p style=" font-weight: 600; margin-bottom: 10px; ">{$core->get_Lang('Departure')}</p>
														<p style=" margin-bottom: 5px; ">{$clsTour->getListDeparturePoint($tour_id)}</p>
														<p style=" margin: 0; ">{$clsISO->converTimeToText7($item.check_in_book_z)}</p>
													</div>
													<div style="text-align: right;width:50%">
														<p style=" margin-bottom: 10px; font-weight: 600; ">{$core->get_Lang('End')}</p>
														<p style=" margin-bottom: 5px; ">{$fullTextAddress}</p>
														<p style=" margin: 0; ">{$clsISO->converTimeToText5($clsTour->getTextEndDate($item.check_in_book_z,$tour_id))}</p>
													</div>
												</div>
												<div style=" padding: 20px 0px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<p style=" margin: 0; ">{$core->get_Lang('Tour option')}</p>
													<p style=" margin: 0; ">{$tour_option}</p>
												</div>
												<div style=" padding: 20px 0px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<p style=" margin: 0; ">{$core->get_Lang('Duration')}</p>
													<p style=" margin: 0; ">{$clsTour->getTripDuration($tour_id)}</p>
												</div>
												<div style=" padding: 20px 0px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<div>
														<p style=" margin: 0; ">{$core->get_Lang('Tourer')}</p>
													</div>
													<div>
														{if $item.number_infants}<p style=" margin-bottom: 5px; ">{$item.number_infants} x {$core->get_Lang('Infants')}</p>{/if}
														{if $item.number_child_z}<p style=" margin: 0; ">{$item.number_child_z} x {$core->get_Lang('Children')}</p>{/if}
											
													</div>
												</div>
												<div style=" padding: 20px 0px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<div>
														<p style=" margin: 0; ">{$core->get_Lang('Services bonus')}</p>
													</div>
													<div>
														<p style=" margin: 0; ">
															{if $lstService}
																{foreach from=$lstService item=itemService name=i}
																	{$clsAddOnService->getTitle($itemService)}</br>
																{/foreach}
															{/if}
														</p>
													</div>
												</div>
												<div style=" padding-top: 20px; display: flex; justify-content: space-between; font-size: 14px; line-height: 19px; ">
													<div>
														<p style=" margin: 0; ">{$core->get_Lang('Customer Contact')}</p>
													</div>
													<div style="text-align: right">
														<p style=" font-weight: 600; margin-bottom: 10px; ">{$oneItem.full_name}</p>
														<p style=" font-weight: 600; margin-bottom: 10px; ">{$oneItem.email}</p>
														<p style=" font-weight: 600; margin-bottom: 0px;">{$oneItem.phone}</p>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td style="padding: 0">
											<h2 style=" font-weight: 700; font-size: 16px; line-height: 21px; color: #222222; margin-top: 20px; ">{$core->get_Lang('Payment Details')}</h2>
											<div style="background:#fff;border-radius: 5px;text-align:center;margin-top: 18px;">
												<div style="padding: 30px">
													<p style="margin-bottom: 13px; display: flex; justify-content: space-between; font-size: 16px; line-height: 21px; ">
														<span style=" margin: 0; ">{$core->get_Lang('Total price service')}</span>
														<span style=" margin: 0; ">{$item.total_price_z|number_format:0:".":" "} đ</span>
													</p>
													<p style="margin-bottom: 13px; display: flex; justify-content: space-between; font-size: 16px; line-height: 21px; ">
														<span style=" margin: 0; ">{$core->get_Lang('Deposit')} ({if $item.deposit}{$item.deposit}{else}0{/if}%)</span>
														<span style=" margin: 0; ">{$item.price_deposit|number_format:0:".":" "} đ</span>
													</p>
													<p style="margin-bottom: 13px; display: flex; justify-content: space-between; font-size: 16px; line-height: 21px; ">
														<span style=" margin: 0; ">{$core->get_Lang('Balance')}</span>
														<span style=" margin: 0; ">{$balance|number_format:0:".":" "} đ</span>
													</p>
													<p style="margin-bottom: 13px; display: flex; justify-content: space-between; font-size: 16px; line-height: 21px; ">
														<span style=" margin: 0; font-weight: 600">{$core->get_Lang('Total payment')}</span>
														<span style=" margin: 0; font-weight: 600 ">{$item.price_deposit|number_format:0:".":" "} đ</span>
													</p>
												</div>
												<div style="padding: 18px;background: #FFE62E;border-radius: 0px 0px 5px 5px;">
													<p style="width: 100%;max-width: 440px;margin: auto;font-size: 14px;line-height: 20px;text-align: center;color: #222222;">{$core->get_Lang('You must pay')} <span style=" font-weight: 600; color: rgba(255, 0, 0, 1); ">{$balance|number_format:0:".":" "} đ</span> {$core->get_Lang('to us 1 day before departure')} ({$clsISO->converTimeToText8($item.check_in_book_z)})</p>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td style="padding: 0">
											<div style="background:#fff;border-radius: 5px;margin-top: 18px;padding: 30px;">
												<h2 style=" font-weight: 700; font-size: 18px; line-height: 24px; color: #222222; margin-bottom: 20px; ">{$core->get_Lang('Customer support')}</h2>
												<p style=" font-size: 15px; line-height: 24px; color: #222222; margin: 0; ">{$core->get_Lang('Using our convenient support mode, travelers can take action to resend confirmation, make a request, cancel a room or modify contact information')}.</p>
												<div style=" display: flex; flex-wrap: wrap; justify-content: space-between; text-align: center; ">
													<div style="min-width: 163px; width: 50%; margin-top: 33px; ">
														<div style="width: 53px;height: 53px;margin: auto;margin-bottom: 10px;background: #FFE62E;border-radius: 50%;display: flex;align-items: center;justify-content: center;"><img src="{$URL_IMAGES}/icon/icon_mail_send.png" alt=""></div>
														<p style=" width: 100%; max-width: 160px; margin: auto; font-weight: 600; font-size: 16px; line-height: 24px; text-align: center; color: #2B439F; margin-bottom: 10px; ">{$core->get_Lang('Share confirmation')}</p>
														<p style=" width: 100%; max-width: 164px; margin: auto; font-size: 14px; line-height: 20px; text-align: center; color: #222222; ">{$core->get_Lang('Resend service confirmations to yourself or others')}</p>
													</div>
													<div style="min-width: 163px; width: 50%; margin-top: 33px; ">
														<div style="width: 53px;height: 53px;margin: auto;margin-bottom: 10px;background: #FFE62E;border-radius: 50%;display: flex;align-items: center;justify-content: center;"><img src="{$URL_IMAGES}/icon/icon_story.png" alt=""></div>
														<p style=" width: 100%; max-width: 160px; margin: auto; font-weight: 600; font-size: 16px; line-height: 24px; text-align: center; color: #2B439F; margin-bottom: 10px; ">{$core->get_Lang('Special requirements')}</p>
														<p style=" width: 100%; max-width: 164px; margin: auto; font-size: 14px; line-height: 20px; text-align: center; color: #222222; ">{$core->get_Lang('Add some special requests for the best trip')}</p>
													</div>
													<div style="min-width: 163px; width: 50%; margin-top: 33px; ">
														<div style="width: 53px;height: 53px;margin: auto;margin-bottom: 10px;background: #FFE62E;border-radius: 50%;display: flex;align-items: center;justify-content: center;"><img src="{$URL_IMAGES}/icon/icon_cancel_file.png" alt=""></div>
														<p style=" width: 100%; max-width: 160px; margin: auto; font-weight: 600; font-size: 16px; line-height: 24px; text-align: center; color: #2B439F; margin-bottom: 10px; ">{$core->get_Lang('Cancel service')}</p>
														<p style=" width: 100%; max-width: 164px; margin: auto; font-size: 14px; line-height: 20px; text-align: center; color: #222222; ">{$core->get_Lang('Cancel online service easily before')} {$clsISO->converTimeToText8($item.check_in_book_z,7,'')}</p>
													</div>
													<div style="min-width: 163px; width: 50%; margin-top: 33px; ">
														<div style="width: 53px;height: 53px;margin: auto;margin-bottom: 10px;background: #FFE62E;border-radius: 50%;display: flex;align-items: center;justify-content: center;"><img src="{$URL_IMAGES}/icon/icon_contact_book.png" alt=""></div>
														<p style=" width: 100%; max-width: 160px; margin: auto; font-weight: 600; font-size: 16px; line-height: 24px; text-align: center; color: #2B439F; margin-bottom: 10px; ">{$core->get_Lang('Contact Information')}</p>
														<p style=" width: 100%; max-width: 164px; margin: auto; font-size: 14px; line-height: 20px; text-align: center; color: #222222; ">{$core->get_Lang('Change some contact information')}</p>
													</div>
												</div>
											</div>
										</td>
									</tr>
								{/foreach}
								<tr>
									<td style="padding: 0">
									{assign var=CompanyAddress value=CompanyAddress_|cat:$_LANG_ID}
										<div style="background:#fff;border-radius: 5px;margin-top: 18px;padding: 30px 30px 34px;">
											<h2 style=" font-weight: 700; font-size: 18px; line-height: 24px; color: #222222; margin-bottom: 20px; ">{$core->get_Lang('Need more support information')}?</h2>
											<p style=" font-size: 15px; line-height: 24px; color: #222222; margin-bottom: 20px; ">{$core->get_Lang('Let your hotline')} <b>{$clsConfiguration->getValue('CompanyHotline')}</b> {$core->get_Lang('always be within reach')}. {$core->get_Lang('You will need it if you want to contact our customer support')}.</p> 
											<p style=" font-size: 15px; line-height: 24px; color: #222222; margin-bottom: 20px; ">{$core->get_Lang('Quickly learn the “how” in our content diverse FAQ library')}.</p>
											<div style=" height: 46px; line-height: 46px; background: rgba(255, 230, 46, 0.2); border: 1px solid #FFE62E; text-align: center; ">
												<a href="{$clsISO->getLink('faqs')}" title="{$core->get_Lang('Faqs')}" style=" font-weight: 600; font-size: 16px;color: #000000; ">{$core->get_Lang('Questions frequently')}</a>
											</div>
											
										</div>
									</td>
								</tr>
								<tr>
									<td style="padding: 0">
										<div style="border-radius: 5px;padding: 30px 30px 34px;">
											<p style=" font-weight: 600; font-size: 14px; line-height: 19px; color: #555555; text-transform: uppercase; text-align: center; margin-bottom: 10px; ">{$core->get_Lang('Online tourism business plan')} - ISOCMS</p>
											<div style=" font-weight: 400; font-size: 14px; line-height: 19px; text-align: center; color: #555555; ">
												<p style=" margin-bottom: 5px; ">{$core->get_Lang('Phone')}: {$clsConfiguration->getValue('CompanyHotline')}</p>
												<p style=" margin-bottom: 5px; ">{$core->get_Lang('Address')}: {$clsConfiguration->getValue($CompanyAddress)}</p>
												<p style=" margin-bottom: 5px; ">{$core->get_Lang('Email')}: <a href="mailto:{$clsConfiguration->getValue('CompanyEmail')}" title="{$clsConfiguration->getValue('CompanyEmail')}">{$clsConfiguration->getValue('CompanyEmail')}</a></p>
												<p style=" margin-bottom: 20px; ">{$core->get_Lang('Website')}: <a href="https://isocms.com" title="vietiso.com">https://isocms.com</a></p>
											</div>
											<div style=" text-align: center; ">
												<a href="http://www.facebook.com/{$clsConfiguration->getValue('SiteFacebookLink')}" title="{$core->get_Lang('Facebook')}" style=" margin-right: 10px; "><img src="{$URL_IMAGES}/icon/icon_fb.png" alt="facebook"></a>
												<a href="http://www.twitter.com/{$clsConfiguration->getValue('SiteTwitterLink')}" title="{$core->get_Lang('Twitter')}" style=" margin-right: 10px; "><img src="{$URL_IMAGES}/icon/icon_twiter.png" alt="twiter"></a>
												<a href="http://www.youtube.com/{$clsConfiguration->getValue('SiteYoutubeLink')}" title="{$core->get_Lang('Youtube')}" style=" margin-right: 10px; "><img src="{$URL_IMAGES}/icon/icon_youtube.png" alt="{$core->get_Lang('Youtube')}"></a>
											</div>
										</div>
									</td>
								</tr>
							</table>-->
							{$oneItem.booking_html|html_entity_decode}
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
var text_price_min_error = "{$core->get_Lang('Price min')}";
var text_price_max_error = "{$core->get_Lang('Price max')}";
var text_price_error = "{$core->get_Lang('Amount must be greater than 0')}";
var text_payment_term_error = "{$core->get_Lang('Payment term is required')}";
var $booking_id = 	"{$pvalTable}";
var comfirm_cancel_booking="{$core->get_Lang('Are you sure cancel booking?')}";
</script>
{literal}
<style type="text/css">
.table-mce{margin:0 auto}
td{ font-size:13px !important}
.hidden { display:none !important}
</style>
<script>
	$('.tailor_select2').select2();
</script>
{/literal}