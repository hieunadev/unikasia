    <link rel="stylesheet" href="{$URL_CSS}/tailor_made_tour.css?v={$upd_version}" />

{$core->getBlock('des_header_short')}

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

                <h2 class="txt_plantrip">Plan your extraordinary trips with Unikasia!</h2>
                <p class="txt_desplantrip">Please share your preferences for your trip to Vietnam, Cambodia, Laos...: dates, itinerary, type of stay, accommodations...</p>
                    <p class="txt_desplantrip">
                    One of our travel consultant will contact you within 24 hours to create a unique, tailor-made program with you.</p>

                </div>

                </div>
            </section>

            <section class="input_informationtrip">
                <div class="travelinf">
                    <div class="container">
                    <div class="txt_inftravel">
                        <h3 class="txt_infotravel">Your Travel Information’s</h3>

                        <div class="input_inf">
                            <div class="row">
                              <div class="col-md-4">
                                <label for="title" class="txtlabel">Title*</label>
                                <select class="form-select select-input-inf" id="title">
                                  <option value="mr">Mr.</option>
                                  <option value="ms">Ms.</option>
                                  <option value="mrs">Mrs.</option>
                                  <option value="dr">Dr.</option>
                                </select>
                              </div>
                              <div class="col-md-8">
                                <label for="fullName" class="txtlabel ">Full Name*</label>
                                <input type="text" class="form-control select-input-inf" id="fullName">
                              </div>
                            </div>
                          
                            <div class="row">
                              <div class="col-md-4">
                                <label for="nationality" class="txtlabel">Nationality*</label>
                                <select class="form-select select-input-inf" id="nationality">
                                  <option value="vn">Vietnamese</option>
                                  <option value="us">American</option>
                                  </select>
                              </div>
                              <div class="col-md-4">
                                <label for="email" class="txtlabel">Email*</label>
                                <input type="email" class="form-control select-input-inf" id="email">
                              </div>
                              <div class="col-md-4">
                                <label for="phoneNumber" class="txtlabel">Phone Number*</label>
                                <input type="tel" class="form-control select-input-inf" id="phoneNumber">
                              </div>
                            </div>
                          
                            <div class="row">
                              <div class="col-12">
                                <label for="socialMedia" class="txtlabel">Social Media</label>
                                <input type="text" class="form-control select-input-inf" id="socialMedia">
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
                                <label for="traveldate" class="txtlabel">Travel Date</label>
                                <p class="txt_smalltrip">approximately</p>
                                <input type="date" id="traveldate" class="date_selecttour date_travel"> 

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
                                    <option value="mr">Mr.</option>
                                    <option value="ms">Ms.</option>
                                    <option value="mrs">Mrs.</option>
                                    <option value="dr">Dr.</option>
                                  </select>
                                </div>
                                <div class="col-md-6">
                                  <label for="tourguide" class="txtlabel ">Tour guide preference</label>
                                  <select class="form-select select-input-inf" id="tourguide">
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
                                    <option value="mr">Mr.</option>
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
                                        <div class="accordion" id="accordionPanelsStayOpenExample">


                                      <div class="accordion-item">
                                        <div class="accordion-header" id="panelsStayOpen-headingTwo">
                                          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo" id="accordion1btn">
                                            <input class="form-check-input chkAll me-2" type="checkbox" value="" id="chkAccordion1All">Vietnam</button>
                                        </div>
                                        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                                          <div class="accordion-body ms-3 d-flex flex-wrap">
                                            <div class="form-check form-region me-3">
                                      <input class="form-check-region" type="checkbox" value="" id="chkAccordion2Child0">
                                              <label for="chkAccordion1Child0">Ba Be</label>
                                    </div>

                                    <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion2Child1">
                                                <label for="chkAccordion1Child0">Bac Ha</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion2Child2">
                                                <label for="chkAccordion1Child0">Ban Giuoc</label>
                                      </div>

                                      <div class="form-check form-region me-3">
                                        <input class="form-check-region" type="checkbox" value="" id="chkAccordion2Child2">
                                                <label for="chkAccordion1Child0">Cao Bang</label>
                                      </div>



                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other">


                                          </div>
                                        </div>
                                      </div>



                                      <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                            <div class="form-check mt-1">
                                      <input class="form-check-input chkAll" type="checkbox" value="" id="chkAccordion3All">
                                    </div>
                                            Cambodia
                                          </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                          <div class="accordion-body ms-3">
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion3Child0">
                                              <label for="chkAccordion3Child0">Accordion 3 checkbox 1</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion3Child1">
                                              <label for="chkAccordion3Child1">Accordion 3 checkbox 2</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion3Child2">
                                              <label for="chkAccordion3Child2">Accordion 3 checkbox 3</label>
                                    </div>
                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other">
                                          </div>
                                        </div>
                                      </div>


                                      <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                                            <div class="form-check mt-1">
                                      <input class="form-check-input chkAll" type="checkbox" value="" id="chkAccordion4All">
                                    </div>
                                            Thailand
                                          </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                                          <div class="accordion-body ms-3">
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion4Child0">
                                              <label for="chkAccordion4Child0">Accordion 4 checkbox 1</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion4Child1">
                                              <label for="chkAccordion4Child1">Accordion 4 checkbox 2</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion4Child2">
                                              <label for="chkAccordion4Child2">Accordion 4 checkbox 3</label>
                                    </div>

                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other">
                                          </div>
                                        </div>
                                      </div>

                                      <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
                                            <div class="form-check mt-1">
                                      <input class="form-check-input chkAll" type="checkbox" value="" id="chkAccordion4All">
                                    </div>
                                            Myanmar
                                          </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
                                          <div class="accordion-body ms-3">
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion5Child0">
                                              <label for="chkAccordion5Child0">Accordion 5 checkbox 1</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion45hild1">
                                              <label for="chkAccordion5Child1">Accordion 5 checkbox 2</label>
                                    </div>
                                            <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="" id="chkAccordion5Child2">
                                              <label for="chkAccordion5Child2">Accordion 5 checkbox 3</label>
                                    </div>

                                    <input type="txt-input-other" class="form-control select-input-inf" id="input-other">
                                          </div>
                                        </div>
                                      </div>



                                    </div>
                                      </div>


                                      <hr style="background: #D3DCE1;">

                                      <div class="prefence_acco">
                                        <h3 class="txt_destinations">Accommodations preference</h3>
                                        <div class="select-checkbox-prefer">
                                            
                                            <label for="title" class="txtlabel">Accommodations</label>
                                            <select class="form-select select-input-inf" id="title">
                                              <option value="mr">Select</option>
                                              <option value="ms">Ms.</option>
                                              <option value="mrs">Mrs.</option>
                                              <option value="dr">Dr.</option>
                                            </select>
          
                                        </div>

                                        <div class="checkbox_type">
                                            <p class="txt_roomtype" style="margin: 26px 0 0 0">Type of room you prefer</p>
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

                        <div class="input_inf">
                            <div class="row">
                              <div class="col-12">
                                <input type="text" class="form-control select-input-inf txt_require" id="txtRequirement" placeholder="Any must-see landmarks in your bucket list, desired accommodations, special food requirements, allergies…">
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
							<button class="btn btnrq">Request for Quotation</button>
						</div>
                 
                </div>
					</div>
            </section>
					
				
<script>
// Tự động đóng các accordion khác khi một accordion được mở
const accordionButtons = document.querySelectorAll('.accordion-button');
accordionButtons.forEach(button => {
  button.addEventListener('click', () => {
    accordionButtons.forEach(otherButton => {
      if (otherButton !== button) {
        const collapseElement = document.querySelector(otherButton.dataset.bsTarget);
        bootstrap.Collapse.getInstance(collapseElement).hide();
      }
    });
  });
});

</script>

