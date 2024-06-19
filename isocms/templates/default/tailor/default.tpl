<link rel="stylesheet" href="{$URL_CSS}/tailor_made_tour.css?v={$upd_version}" />
<link href="https://fonts.cdnfonts.com/css/nunito-sans" rel="stylesheet">

<section class="listblogdetail_breadcrumb">
        <div class="breadcrumb_list">
            <div class="container">
                <div class="breadcrumb">
                    <h2 class="txt_youarehere">You are here:</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{PCMS_URL}" title="{$core->get_Lang('Home')}">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tailor made tour</li>
                    </ol>
                </div>
            </div>
        </div>
            </section>

            <section class="plantrip">
                <div class="txt_tripex">
                <div class="container">

                <h2 class="txt_plantrip">{$core->get_Lang('Plan your extraordinary trips with Unikasia')}!</h2>
                <p class="txt_desplantrip">{$core->get_Lang('Please share your preferences for your trip to Vietnam, Cambodia, Laos')}...: {$core->get_Lang('dates, itinerary, type of stay, accommodations')}...<br>
                    {$core->get_Lang('One of our travel consultant will contact you within 24 hours to create a unique, tailor-made program with you')}.</p>

                </div>

                </div>
            </section>

            <section class="input_informationtrip">
                <div class="travelinf">
                    <div class="container">
                    <div class="txt_inftravel">
                        <h3 class="txt_infotravel">{$core->get_Lang('Your Travel Information’s')}</h3>

                        <div class="input_inf">
                            <div class="row">
                              <div class="col-md-4">
                                <label for="title" class="txtlabel">{$core->get_Lang('Title')}<span style="color:black"> *</span>
								</label>
                                <select id="title" name="title" class="form-select select-input-inf required">
								<option value="" disabled selected hidden>-- Please Select --</option> 
                                {$clsISO->makeSelectTitle($title)}
                                </select>
                              </div>
								
                              	<div class="col-md-8">
                                <label for="fullname" class="txtlabel">{$core->get_Lang('Full Name')}
								<span style="color:black"> *</span>
								  </label>
                                <input id="fullname" name="fullname" type="text" class="form-control select-input-inf required" value="" placeholder="Enter your name">
								  <div class="clearfix"></div>
                            	<div id="error_fullname" class="error text-left"></div>
                              </div>
                            </div>
                          
                            <div class="row">
                              <div class="col-md-4">
                                <label for="nationality" class="txtlabel">{$core->get_Lang('Nationality')} 
									<span style="color:black"> *</span>
								  </label>
                                <select name ="country_id" id="nationality" class="form-select select-input-inf required">
									<option value="" disabled selected hidden>-- {$core->get_Lang('Please Select')} --</option> 
                                  {section name=i loop=$lstCountryRegion}
								<option value="{$lstCountryRegion[i].country_id}">{$lstCountryRegion[i].title}</option>
								{/section}
                                  </select>
								 <div class="clearfix"></div>
                            <div id="error_country_id" class="error text-left"></div> 
                              </div>
								
                              <div class="col-md-4">
                                <label for="email" class="txtlabel">{$core->get_Lang('Email')} 
									<span style="color:black"> *</span>
								  </label>
								  
                                <input id="email" name="email" type="text" class="form-control select-input-inf required" value="" placeholder="Enter your mail">
								  <div class="clearfix"></div>
                            <div id="error_email" class="error text-left"></div>
                              </div>
								
                              <div class="col-md-4">
                                <label for="phone" class="txtlabel">{$core->get_Lang('Phone Number')}
									<span style="color:black"> *</span>
								  </label>
                                <input id="phone" name="phone" type="text" class="form-control select-input-inf required" value="" placeholder="Enter your phone">
								  <div class="clearfix"></div>
                            <div id="error_phone" class="error"></div>
                              </div>
								
                            </div>
                          
                            <div class="row">
                              <div class="col-12">
                                <label for="socialMedia" class="txtlabel">{$core->get_Lang('Social Media')}</label>
                                <input type="text" class="form-control select-input-inf" id="socialMedia" placeholder="Facebook, Whatsapp, Zalo,..">
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
                        <h3 class="txt_infotravel">Your Travel’s Preferences</h3>

                        <div class="input_inf">
                            <div class="row">
								
                              <div class="col-md-4">
								<label for="traveldate" class="txtlabel">{$core->get_Lang('Travel Date')}</label>
								<p class="txt_smalltrip">approximately</p>
								<div class="input-group"> 
									<i class="fa-solid fa-calendar"></i>
									<input type="text" class="form-control wpcf7-datepicker" autocomplete="off" name="arrival_date" id="arrival_date" placeholder="Apr 1, 2024" value='{$PostVal.arrival_date|date_format:"%b %e, %Y"}'/>
								</div>
								<div id="error_arrival_date" class="error"></div> 
							</div>

								
                              <div class="col-md-4">
                                <label for="duration" class="txtlabel">Duration</label>
                                <p class="txt_smalltrip">in Days</p>

                                <input type="duration" class="form-control select-input-inf" id="duration" placeholder="Example: 7 Days">
                              </div>
                              <div class="col-md-4">
                                <label for="bugetperson" class="txtlabel">Budget per person</label>
                                <p class="txt_smalltrip">excluding international flights</p>

                                <input type="budget" class="form-control select-input-inf" id="bugetperson" placeholder="Example: 2.000$">
                              </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                  <label for="arrival-airport" class="txtlabel">Arrival Airport</label>
                                  <select class="form-select select-input-inf" id="arrival-airport">
									<option value="" disabled selected hidden>-- Please Select --</option>  
                                    <option value="mr">Mr.</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>
                                </div>
                                <div class="col-md-6">
                                  <label for="tourguide" class="txtlabel ">Tour guide preference</label>
                                  <select class="form-select select-input-inf" id="tourguide">
									<option value="" disabled selected hidden>-- Please Select --</option> 
                                    <option value="mr">Mr.</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>                                
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6">
                                  <label for="participants" class="txtlabel">Participants</label>
                                  <select class="form-select select-input-inf" id="participants">
                                    <option value="mr">Mr.</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>
                                </div>
                                <div class="col-md-6">
                                  <label for="travelstyles" class="txtlabel ">Travel Styles & Activities</label>
                                  <select class="form-select select-input-inf" id="travelstyles">
									<option value="" disabled selected hidden>-- Please Select --</option> 
                                    <option value="mr">Mr.</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>                                
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6">
                                  <label for="meals" class="txtlabel">Meals</label>
                                  <select class="form-select select-input-inf" id="meals">
									<option value="" disabled selected hidden>-- Please Select --</option> 
                                    <option value="mr">{$clsTourItinerary->getGoodMeal($tour_id)}</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>
                                </div>
                                <div class="col-md-6">
                                  <label for="suitabletime" class="txtlabel">The most suitable time to reach you</label>
                                  <input type="suitable" class="form-control select-input-inf" id="suitabletime" placeholder="In the morning, the afternoon,... or at a specific time">
                                </div>
                              </div>
                              <hr style="background: #D3DCE1;">

                              <div class="checkbox_destination">
                                <h3 class="txt_destinations">Destinations</h3>

                                <div class="list_checkboxtravel">
                                    <div class="mt-3">
                                        <div class="accordion" id="accordionPanelsStayOpenDestiantion">
											
								
									{section name=i loop=$lstCountry}
											
									 <div class="accordion-item">
                                        <div class="accordion-header" id="panelsStayOpen-heading{$lstCountry[i].country_id}">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse{$lstCountry[i].country_id}" aria-expanded="false" aria-controls="panelsStayOpen-collapse{$lstCountry[i].country_id}">
                                            <input class="form-check-input chkAll me-2" type="checkbox" value="" id="chkAccordion{$lstCountry[i].country_id}All">{$lstCountry[i].title}</button>
                                        </div>
                                        <div id="panelsStayOpen-collapse{$lstCountry[i].country_id}" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading{$lstCountry[i].country_id}">
                                          <div class="accordion-body d-flex flex-wrap" style="gap:12px">
                                            <div class="form-check form-region me-3">
                                      <input class="form-check-region" type="checkbox" value="" id="chkAccordion3Child0">
                                              <label for="chkAccordion3Child0">Ba Be</label>
                                    </div>

                                    <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion3Child1">
                                           <label for="chkAccordion3Child1">Bac Ha</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion3Child2">
                                                <label for="chkAccordion3Child2">Ban Giuoc</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion3Child2">
                                                <label for="chkAccordion3Child3">Cao Bang</label>
                                      </div>

                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other" placeholder="Other">

                                          </div>
                                        </div>
                                      </div>
									{/section}


<!--
                                      <div class="accordion-item">
                                        <div class="accordion-header" id="panelsStayOpen-heading{$lstCountry[i].country_id}">
                                          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne" id="accordion1btn">
                                            <input class="form-check-input chkAll me-2" type="checkbox" value="" id="chkAccordion1All">{$lstCountry[i].title}</button>
                                        </div>
                                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                          <div class="accordion-body d-flex flex-wrap" style="gap:12px">
                                            <div class="form-check form-region me-3">
                                      <input class="form-check-region" type="checkbox" value="" id="chkAccordion1Child0">
                                              <label for="chkAccordion1Child0">Ba Be</label>
                                    </div>

                                    <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion1Child1">
                                           <label for="chkAccordion1Child1">Bac Ha</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion1Child2">
                                                <label for="chkAccordion1Child2">Ban Giuoc</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion1Child3">
                                                <label for="chkAccordion1Child3">Cao Bang</label>
                                      </div>

                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other" placeholder="Other">

                                          </div>
                                        </div>
                                      </div>
-->
											
                                    </div>
                                      </div>
								  </div>



                              <hr style="background: #D3DCE1; margin: 24px 0 24px 0;">

                                      <div class="prefence_acco">
                                        <h3 class="txt_destinations">Accommodations preference</h3>
                                        <div class="select-checkbox-prefer">
                                            
                                            <label for="accommodations" class="txtlabel">Accommodations</label>
                                            <select class="form-select select-input-inf" id="accommodations">
											  <option value="" disabled selected hidden>-- Please Select --</option> 
                                              <option value="ms">Ms.</option>
                                              <option value="mrs">Mrs.</option>
                                              <option value="dr">Dr.</option>
                                            </select>
          
                                        </div>

                                        <div class="checkbox_type">
                                            <p class="txt_roomtype" style="margin: 26px 0 8px 0">Type of room you prefer</p>
											<div class="checkbox-room">
												<div class="accordion-body d-flex flex-wrap">
											<div class="form-check form-region me-3">
                                        <input class="form-check-room" type="checkbox" value="" id="chkAccordion5Room0">
                                                <label for="chkAccordion1Room0">Single room</label>
                                      </div>
													
											<div class="form-check form-region me-3">
                                        <input class="form-check-room" type="checkbox" value="" id="chkAccordion5Room1">
                                                <label for="chkAccordion1Room1">Double room with one large bed</label>
                                      </div>
													
											<div class="form-check form-region me-3">
                                        <input class="form-check-room" type="checkbox" value="" id="chkAccordion5Room2">
                                                <label for="chkAccordion1Room2">Double room with 2 beds</label>
                                      </div>
													
											<div class="form-check form-region me-3">
                                        <input class="form-check-room" type="checkbox" value="" id="chkAccordion5Room3">
                                                <label for="chkAccordion1Room3">Room for three people</label>
                                      </div>
													
													
													
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
                                <textarea class="form-control input_txttravel" cols="255" rows="5" placeholder="Any must-see landmarks in your bucket list, desired accommodations, special food requirements, allergies…" name="notes" style="height: 152px;"></textarea>
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
                        <p class="txt_requirement2">
							*One of our Tailor-Made consultants will be in touch within 24 business hours.
						</p>
						 <p class="txt_requirement2">
							If you don't receive ourconfirmation email after 1 working day, please check your spam email. It may go to your spam mailbox.
						</p>
						
							<div class="g-recaptcha" data-sitekey="{$clsISO->getVar('reCAPTCHA_KEY')}"></div>
							{if $errMsg ne ''}
							<div id="error_recaptcha" class="error text_left">{$errMsg}</div>
							{else}
							<div id="error_recaptcha" class="error text_left"></div>
							{/if}
                    </div>
						
						<div class="btn_rqfQ text-center">
							 <input type="hidden" name="plantrip" value="plantrip" />
                        	 <input type="hidden" name="hidden_field" value="" />
							<button type="submit" class="btn btnrq" id="SubmitEnquiry">{$core->get_Lang('Request for Quotation')}</button>
						</div>
                 
                </div>
					</div>
            </section>
					
					
{literal}			
<script>
			$(document).ready(function() {
			  $('.unika_header').removeClass('unika_header_2');

			  $(window).scroll(function() {
				requestAnimationFrame(function() {
				  $('.unika_header').removeClass('unika_header_2');
				});
			  });
			});


				if($('.wpcf7-datepicker').length){
						$('.wpcf7-datepicker').datepicker({
							dateFormat:"MM d, yy",
							minDate: new Date()
						});
					}

			const accordionButtons = document.querySelectorAll('.accordion-button');

				accordionButtons.forEach(button => {
				  button.addEventListener('click', () => {
					const collapseElement = document.querySelector(button.dataset.bsTarget);

					// Kiểm tra trạng thái accordion hiện tại
					if (bootstrap.Collapse.getInstance(collapseElement).hide()) { // Nếu đang mở thì đóng lại
					  bootstrap.Collapse.getInstance(collapseElement).hide();
					} else { // Nếu đang đóng thì mở ra
					  accordionButtons.forEach(otherButton => { // Đóng các accordion khác
						if (otherButton !== button) {
						  const otherCollapseElement = document.querySelector(otherButton.dataset.bsTarget);
						  bootstrap.Collapse.getInstance(otherCollapseElement).hide();
						}
					  });
					  bootstrap.Collapse.getInstance(collapseElement).show(); // Mở accordion hiện tại
					}
				  });
				});


</script>
{/literal}
					
<script>
	var msg_title_required ="{$core->get_Lang('Your title should not be empty')}";
    var msg_fullname_required = "{$core->get_Lang('Your full name should not be empty')}!";
    var msg_phone_required = "{$core->get_Lang('Your telephone should not be empty')}!";
    var msg_email_required = "{$core->get_Lang('Your email should not be empty')}!";
    var msg_email_not_valid = "{$core->get_Lang('Please enter a valid email address')}!";
    var msg_country_id_not_valid = "{$core->get_Lang('Please select country')}!";
    var msg_confirmemail_not_valid = "{$core->get_Lang('Email addresses do not match')}!";
    var showInfo = "{$core->get_Lang('Show more information')}";
    var hideInfo = "{$core->get_Lang('information hidden')}";
	
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
					
{literal}
    <script>
        $(function(){
            $('#EnquiryForm').validate();
            $("#SubmitEnquiry").click(function(ev){
                var $fullname = $("#fullname").val();
                var $country_id = $("#country_id").val();
                var $email = $("#email").val();
                var $phone = $("#phone").val();
                if($("#fullname").val()==''){
                    $('#error_fullname').html(msg_fullname_required).fadeIn().delay(3000).fadeOut();
                    $("#fullname").focus();
                    return false;
                }
                if($country_id == 0){
                    $('#error_country_id').html(msg_country_id_not_valid).fadeIn().delay(3000).fadeOut();
                    $("#country_id").focus();
                    return false;
                }
                if($("#email").val()==''){
                    $('#error_email').html(msg_email_required).fadeIn().delay(3000).fadeOut();
                    $("#email").focus();
                    return false;
                }

                if($("#phone").val()==''){
                    $('#error_phone').html(msg_phone_required).fadeIn().delay(3000).fadeOut();
                    $("#phone").focus();
                    return false;
                }
                if(checkValidEmail($email)==false){
                    $('#error_email').html(msg_email_not_valid).fadeIn().delay(3000).fadeOut();
                    $("#email").focus();
                    return false;
                }
                if(grecaptcha.getResponse() == "") {
                    ev.preventDefault();
                    $('#error_recaptcha').html(msg_recapcha).fadeIn().delay(3000).fadeOut();
                    return false;
                } else {
                    $('#EnquiryForm').submit();
                }
            });
			/*
            $('.delete_service').click(function (){
                 var type =$(this).data('type');
                $.confirm({
                    title: Confirm,
                    content: remove_text,
                    minHeight: 100,
                    maxHeight: 200,
                    buttons: {
                        Confirm: {
                            text: Confirm,
                            action: function(){
                                $.ajax({
                                    type:'POST',
                                    url: path_ajax_script+'/index.php?mod='+mod+'&act=deleteService&lang='+LANG_ID,
                                    data:{type:type},
                                    dataType:'json',
                                    success: function (res){
                                        if(res.msg == 'ok'){
                                            window.location.reload();
                                        }
                                    }
                                });
                            }
                        },
                        Cancel: {
                            text: Cancel
                        }
                    }
                });

            });
			*/
        });
        function checkValidEmail(email){
            var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
    </script>
{/literal}
