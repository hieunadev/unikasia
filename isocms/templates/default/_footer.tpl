{assign var=Copyright value=Copyright_|cat:$_LANG_ID}
{assign var=CompanyAddress value=CompanyAddress_|cat:$_LANG_ID}
{assign var=CompanyName value=CompanyName_|cat:$_LANG_ID}
{assign var=CompanyAddress1 value=CompanyAddress1_|cat:$_LANG_ID}
{assign var = DescriptionZoneFooter value = DescriptionZoneFooter_|cat:$_LANG_ID}
{if $mod ne 'cart'}
{if $act ne 'success'}
	<section class=" bg-footer">
		<div class="container">
			<footer class="d-flex flex-wrap justify-content-between align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-5 col-sm-6">
							<form method="post" action="#" class="form-sub">
								<input type="text" id="email-sub" placeholder="Enter your email" class="import-txt-email">
								<input type="text" id="email-check" class="check-txt-email" value>
								<input class="btn-reg btn_reg" id="subreg" type="button" name="btnSubmit" value="Submit">
							</form>
							<h3 class="txtfindus">Unikasia Travel</h3>
							<p class="txtheadersmll absolute-bar">
								<a href="#">
                         <span class="txtadress">4-5 floors, 13 Kim Ma Thuong, Ba Dinh dist, Hanoi, Vietnam
                         </span>
								</a>
							</p>
							<p class="txtheadersmll absolute-bar">
								<a href="www.hanoivoyage.com">
									<span class="txtwebsite">www.hanoivoyage.com</span>
								</a>
							</p>
							<p class="txtheadersmll absolute-bar">
								<a href="mailto:info@hanoivoyage.com">
                         <span class="txtwebsite">info@hanoivoyage.com
                         </span>
								</a>
							</p>
							<p class="txtheadersmll absolute-bar">
								<a href="tel:+842437153012">
									<span class="txtwebsite">+84 243 715 3012</span>
								</a>
							</p>
						</div>
						<div class="col-lg-8 col-md-6 col-sm-6">
							<div class="row">
								<div class="col-lg-4 col-sm-6 col-xs-6">
									<p class="txtheaderlarge">HANOI VOYAGES</p>
									<ul class="list-unstyled txthreflink">
										<li class=""><a href="#">About us</a></li>
										<li><a href="#">Tailor made travel</a></li>
										<li><a href="#">Professional guarantees</a></li>
										<li><a href="#">Contact</a></li>
										<li><a href="#">Testimonials</a></li>
										<li><a href="#">Our team</a></li>
										<li><a href="#">Good reasons to choose us</a></li>
										<li><a href="#">Recrutement</a></li>
										<li><a href="#">Sitemap</a></li>
									</ul>
								</div>
								<div class="col-lg-4 col-sm-6 col-xs-6">
									<p class="txtheaderlarge">DESTINATIONS</p>
									<ul class="list-unstyled txthreflink">
										<li><a href="#">Travel to Vietnam</a></li>
										<li><a href="#">Travel to Cambodia</a></li>
										<li><a href="#">Travel to Laos</a></li>
										<li><a href="#">Travel to Burma</a></li>
										<li><a href="#">Travel to Thailand</a></li>
										<li><a href="#">Combined travel</a></li>
										<li><a href="#">Cruises</a></li>
									</ul>
								</div>
								<div class="col-lg-4 col-sm-6 col-xs-6">
									<p class="txtheaderlarge">Tell you more
									</p>
									<ul class="list-unstyled txthreflink">
										<li><a href="#">Homestay</a></li>
										<li><a href="#">Experiences</a></li>
										<li><a href="#">Extensions</a></li>
										<li><a href="#">Favorite hotels</a></li>
										<li><a href="#">Our blog</a></li>
										<li><a href="#">Miscellaneous news</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-5 border-top">
							<div class="d-flex flex-nowrap align-items-center">
								<div class="img_logohn">
									<a href="https://hanoivoyage.com/" title="logohn" target="_blank">
										<img title="logohanoi" src="{$URL_IMAGES}/home/logo-hnvoyages.png" alt="img-hanoi">
									</a>
								</div>
								<p class="txtlogo">International tour operator approved by the National Tourism Administration in Vietnam. <br>LICENCE N°: 01 - 02 /TCDL-GP LHQT</p>
							</div>
							<div class="d-flex flex-column align-items-end">
								<p class="txt-contact">Share your trip with us</p>
								<div class="d-flex icon-mxh" style="gap: 20px">
									<a class="link-secondary" href="#">
										<i class="fa-brands fa-youtube fa-xl"></i>
									</a>
									<a class="link-secondary" href="#">
										<i class="fa-brands fa-twitter fa-xl"></i>
									</a>
									<a class="link-secondary" href="#">
										<i class="fa-brands fa-instagram fa-xl"></i>
									</a>
									<a class="link-secondary" href="#">
										<i class="fa-brands fa-facebook fa-xl"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a id="backTop" class="bg_main" role="link" href="javascript:void(0);">
					<i class="fa fa-arrow-up" aria-hidden="true"></i>
				</a>
{*				<div id="whatsapp-widget" class="ww-normal ww-right ww-standard">*}
{*					<a target="_blank" title="{$core->get_Lang('Chat with us')}" href="https://wa.me/{$clsConfiguration->getValue('CompanyWhatsapp')}" class="ww-text">{$core->get_Lang('Chat with us')}*}
{*						<div class="ww-arrow"></div>*}
{*					</a>*}
{*					<div class="ww-icon"><div>*}
{*							<a title="Whatsapp" class="ww-icon-link" target="_blank" href="https://wa.me/{$clsConfiguration->getValue('CompanyWhatsapp')}">*}
{*								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d=" M19.11 17.205c-.372 0-1.088 1.39-1.518 1.39a.63.63 0 0 1-.315-.1c-.802-.402-1.504-.817-2.163-1.447-.545-.516-1.146-1.29-1.46-1.963a.426.426 0 0 1-.073-.215c0-.33.99-.945.99-1.49 0-.143-.73-2.09-.832-2.335-.143-.372-.214-.487-.6-.487-.187 0-.36-.043-.53-.043-.302 0-.53.115-.746.315-.688.645-1.032 1.318-1.06 2.264v.114c-.015.99.472 1.977 1.017 2.78 1.23 1.82 2.506 3.41 4.554 4.34.616.287 2.035.888 2.722.888.817 0 2.15-.515 2.478-1.318.13-.33.244-.73.244-1.088 0-.058 0-.144-.03-.215-.1-.172-2.434-1.39-2.678-1.39zm-2.908 7.593c-1.747 0-3.48-.53-4.942-1.49L7.793 24.41l1.132-3.337a8.955 8.955 0 0 1-1.72-5.272c0-4.955 4.04-8.995 8.997-8.995S25.2 10.845 25.2 15.8c0 4.958-4.04 8.998-8.998 8.998zm0-19.798c-5.96 0-10.8 4.842-10.8 10.8 0 1.964.53 3.898 1.546 5.574L5 27.176l5.974-1.92a10.807 10.807 0 0 0 16.03-9.455c0-5.958-4.842-10.8-10.802-10.8z" fill-rule="evenodd"></path></svg>*}
{*							</a>*}
{*						</div>*}
{*					</div>*}
{*				</div>*}
			</footer>
		</div>
	</section>
	{if $mod eq "homepackage"}
	<div id="btn-tailor-fixed"><a href="#" class="tailor_btn_fixed" title="TAILOR-MADE TRAVEL"> <div class="tailor_img_fixed"> <img src="https://unikasia.vietiso.com/isocms/templates/default/skin/images/destination/hn_voyages.png" alt=""> </div>
		TAILOR-MADE TRAVEL
	</a></div>
	<div class="footer-content-nav-icon">
		<div class="footer-icon-img"><a href="#" title="Youtube"> <img
						src="{$URL_IMAGES}/icon/yt.svg" alt="error-yt"
						id="footer-icon-mess"> </a></div>
		<div class="footer-icon-img"><a href="#" title="Twitter"> <img
						src="{$URL_IMAGES}/icon/tw.svg" alt="error-tw"
						id="footer-icon-mess" class="icon-color"> </a></div>
		<div class="footer-icon-img"><a href="#" title="instagram"> <img
						src="{$URL_IMAGES}/icon/ins.svg" alt="error-ins"
						id="footer-icon-mess"> </a></div>
		<div class="footer-icon-img"><a href="#" title="Facebook"> <img
						src="{$URL_IMAGES}/icon/fb.svg" alt="error-fb"
						id="footer-icon-mess"> </a></div>
	</div>
	{/if}
{/if}
{/if}
<script>
	var mod = '{$mod}';
	var act = '{$act}';
</script>
{literal}
<style>
.aml_dk-style-default.aml_dk-bottom-right{bottom: 100px !important;transform: unset !important; top: auto}
img{max-width: 100% !important}
</style>
<script>
$('.footer_info .footer_Link').each(function(){
    var $_this = $(this);
    if($_this.height()>140){
        $_this.css("height","140px");
        $_this.closest(".footer_info").find(".readmore").show();
    }else{
        $_this.closest(".footer_info").find(".readmore").hide();
    }
});
$(document).on("click",".footer_info .readmore",function(){
    var $_this = $(this);
    if(!$_this.hasClass("less")){
        $_this.addClass("less");
        $_this.closest(".footer_info").find(".footer_Link").css("height","auto");
        $_this.html('{/literal}{$core->get_Lang("Hide")}{literal}');
    }
    else{
        $_this.removeClass("less");
        $_this.closest(".footer_info").find(".footer_Link").css("height","140px");
        $_this.html('{/literal}{$core->get_Lang("See more")}{literal}');
    }
});
//moreLessSetHeightNew('.footer_info','.footer_Link','.readmore','less');

</script>
{/literal}