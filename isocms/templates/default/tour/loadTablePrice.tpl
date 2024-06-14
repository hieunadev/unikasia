<form class="form_booking_now" action="" method="post">
    <div class="infor_pricetour">
        <div class="container">
            <div class="txt_inf_locationtime">
                <h3 class="txt_infprice">{$clsTour->getTitle($tour_id)}</h3>
                <div class="location_daytime">
                    <p class="txt_location"><i class="fa-regular fa-location-dot"
                                               style="color: #004ea8;"></i>Ha Noi
                        <span style="color:#D3DCE1"> | </span> <span class="txt_timedays"> <i
                                    class="fa-solid fa-clock-three" style="color: #434b5c;"></i>{$clsTour->getTripDurationx($tour_id)}</span>
                    </p>
                </div>
                <hr style="opacity: 0.1; background: #111D37">
                <div class="type_price">
                    <div class="txt_price_type">
                        <p class="txt_typeprice">Customer Type</p>
                        <p class="txt_typeprice">Price</p>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-4">{$number_adults} {$core->get_Lang('Adults')}</div>
                        <div class="col-md-4 text-center">x US ${$price_adults|number_format:0:".":","}</div>
                        <div class="col-md-4 text-end">US <span class="bold_txtprice">${$total_price_adults|number_format:0:".":","}</span>
                        </div>
                    </div>
                    {if $number_child}
                        <div class="d-flex flex-wrap justify-content-between w-100 collapseHead collapsed mt-3" {if $arr_price_child|count gt 0}data-bs-toggle="collapse" data-bs-target="#collapseChild" aria-expanded="false" aria-controls="collapseChild"{/if}>
                            <div class="w_240 text_left">{$number_child} {$core->get_Lang('Children')}
                                <span class="w_120 text_right">{if $arr_price_child|count gt 0}<i class="fa fa-angle-down" aria-hidden="true"></i>{/if}</span>
                            </div>
                            {if $check_contact_child eq 0 && $total_price_child ne 0}
                                <span class="price text_right">{$clsISO->getShortRate()}{$total_price_child|number_format:0:".":","}</span>
                            {else}
                                <span class="price text_right">{$core->get_Lang('Contact')}</span>
                            {/if}
                        </div>
                        <div class="w-100 mt10 collapse" id="collapseChild">
                            {section name=i loop=$arr_price_child}
                                <div class="d-flex flex-wrap justify-content-between  w-100">
                                    <span class="w_240 text_left" style="padding-left:15px">{$arr_price_child[i].number} ({$arr_price_child[i].text})</span>
                                    {if $arr_price_child[i].price gt 0}
                                        <span class="w_120 text_right">x {$clsISO->getShortRate()}{$arr_price_child[i].price|number_format:0:".":","}</span> <span class="price text_right">{$clsISO->getShortRate()}{$arr_price_child[i].total_price|number_format:0:".":","}</span>
                                    {else}
                                        <span class="w_120 text_right"></span>
                                        <span class="price text_right">{$core->get_Lang('Contact')}</span>
                                    {/if}
                                </div>
                            {/section}
                        </div>
                    {/if}
                    {if $number_infants}
                        <div class="d-flex flex-wrap justify-content-between w-100 collapseHead collapsed mt-3" {if $arr_price_infant|count gt 0}data-bs-toggle="collapse" data-bs-target="#collapseInfant" aria-expanded="false" aria-controls="collapseInfant"{/if}>
                            <div class="w_240 text_left">{$number_infants} {$core->get_Lang('Infants')}
                                <span class="w_120 text_right">{if $arr_price_infant|count gt 0}<i class="fa fa-angle-down" aria-hidden="true"></i>{/if}</span>
                            </div>
                            {if $check_contact_infant eq 0 && $total_price_infants ne 0}
                                <span class="price text_right">{$clsISO->getShortRate()}{$total_price_infants|number_format:0:".":","}</span>
                            {else}
                                <span class="price text_right">{$core->get_Lang('Contact')}</span>
                            {/if}
                        </div>
                        <div class="w-100 mt10 collapse" id="collapseInfant">
                            {section name=i loop=$arr_price_infant}
                                <div class="d-flex flex-wrap w-100">
                                    <span class="w_240 text_left" style="padding-left:15px">{$arr_price_infant[i].number} ({$arr_price_infant[i].text})</span>
                                    {if $arr_price_infant[i].price gt 0}
                                        <span class="w_120 text_right">x {$clsISO->getShortRate()}{$arr_price_infant[i].price|number_format:0:".":","}</span> <span class="price text_right">{$clsISO->getShortRate()}{$arr_price_infant[i].total_price|number_format:0:".":","}</span>
                                    {else}
                                        <span class="w_120 text_right"></span>
                                        <span class="price text_right">{$core->get_Lang('Contact')}</span>
                                    {/if}
                                </div>
                            {/section}
                        </div>
                    {/if}
                    {if $number_room}
                        <div class="d-flex flex-wrap justify-content-between w-100 collapseHead collapsed mt-3" {if $arr_price_child|count gt 0}data-bs-toggle="collapse" data-bs-target="#collapseRoom" aria-expanded="false" aria-controls="collapseRoom"{/if}>
                            <div class="w_240 text_left">{$number_room} {$core->get_Lang('Room')}</div>
                            {if $total_price_room ne 0}
                                <span class="w_120 text_right">{if $arr_price_child|count gt 0}<i class="fa fa-angle-down" aria-hidden="true"></i>{/if}</span>
                                <span class="price text_right">{$clsISO->getShortRate()}{$total_price_room|number_format:0:".":","}</span>
                            {else}
                                <span class="w_120 text_right">{if $arr_price_child|count gt 0}<i class="fa fa-angle-down" aria-hidden="true"></i>{/if}</span>
                                <span class="price text_right">{$core->get_Lang('Contact')}</span>
                            {/if}
                        </div>
                        <div class="w-100 mt10 collapse" id="collapseRoom">
                            {section name=i loop=$lst_room}
                                <div class="d-flex flex-wrap justify-content-between  w-100">
                                    <span class="w_240 text_left" style="padding-left:15px">Single</span>
                                    {if $lst_room[i].price_room gt 0}
                                        <span class="w_120 text_right">x {$clsISO->getShortRate()}{$lst_room[i].price_room|number_format:0:".":","}</span> <span class="price text_right">{$clsISO->getShortRate()}{$arr_price_child[i].total_price|number_format:0:".":","}</span>
                                    {else}
                                        <span class="w_120 text_right"></span>
                                        <span class="price text_right">{$core->get_Lang('Contact')}</span>
                                    {/if}
                                </div>
                            {/section}
                        </div>
                    {/if}
                    <hr style="opacity: 0.1; background: #111D37;">
                    <div class="price_total">
                        <p class="txt_typeprice">Total price:</p>
                        <p class="txt_monpr">US <span class="numb_pr">${$total_price_promotion|number_format:0:".":","}</span></p>
                    </div>
                    <div class="txt_policy">
                        <p class="txt_regard">
                            Regarding cancellation conditions, please read our policy.  <a href="#"
                                                                                           style="color: #3F6DF6">Booking
                                Policy</a></p>
                        <p class="txt_regard">You can reserve now & pay later with this tour
                            option.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bg_btnbook">
            <div class="numbtxtbook">
                <div class="price-wrapper"><h3 class="txt_numbus">US</h3>
                    <h2 class="txt_numbus2">${$total_price_promotion|number_format:0:".":","}</h2>
                </div>
                <p class="txt_desus">All taxes and fees included</p>
            </div>
            <button class="btn txt_booking">Booking now</button>
        </div>
    </div>
</form>

