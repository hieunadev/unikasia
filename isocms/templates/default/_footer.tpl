{assign var=Copyright value=Copyright_|cat:$_LANG_ID}
{assign var=CompanyAddress value=CompanyAddress_|cat:$_LANG_ID}
{assign var=CompanyName value=CompanyName_|cat:$_LANG_ID}
{assign var=CompanyAddress1 value=CompanyAddress1_|cat:$_LANG_ID}
{assign var = DescriptionZoneFooter value = DescriptionZoneFooter_|cat:$_LANG_ID}

<div class="unika_footer">
    <div class="container">
        <div class="unika_footer_1 d-flex">
            <div class="unika_footer_1_left d-flex flex-column">
                <div class="unika_logo_footer_mobile">
                    <a class="unika_logo_footer_1">
                        <img src="https://unikasia.vietiso.com/uploads//Demo/image-6.png" alt="Logo" width="178" height="62">
                    </a>
                </div>
                <form action="" class="unika_search">
                    <input type="email" class="unika_input_search" name="email" id="email" placeholder="{$core->get_Lang('Enter your mail')}" required>
                    <input type="button" class="unika_btn_search" value="{$core->get_Lang('Submit')}">
                </form>
                <div class="unika_1_left_link d-flex flex-column">
                    <a href="#" class="unikasia_travel">{$clsConfiguration->getValue($CompanyName)}</a>
                    <a href="#" class="unikasia_footer_link">
                        {$clsConfiguration->getValue($CompanyAddress1)}
                    </a>
                    <a href="https://{$clsConfiguration->getValue('CompanyWebsite')}" class="unikasia_footer_link">
                        {$clsConfiguration->getValue('CompanyWebsite')}
                    </a>
                    <a href="mailto:{$clsConfiguration->getValue('CompanyEmail')}" class="unikasia_footer_link">
                        {$clsConfiguration->getValue('CompanyEmail')}
                    </a>
                    <a href="tel:{$clsConfiguration->getValue('CompanyPhone')}" class="unikasia_footer_link">
                        {$clsConfiguration->getValue('CompanyPhone')}
                    </a>
                </div>
            </div>
            <div class="unika_footer_1_right d-flex">
                <div class="unika_footer_item d-flex flex-column">
                    <div class="unika_footer_title">
                        {$core->get_Lang("HANOI VOYAGES")}
                    </div>
                    <div class="unika_footer_list_link flex-column">
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("About us")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Tailor made travel")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Professional guarantees")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Contact")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Testimonials")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Our team")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Good reasons to choose us")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Recrutement")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Sitemap")}
                        </a>
                    </div>
                </div>
                <div class="unika_footer_item d-flex flex-column">
                    <div class="unika_footer_title">
                        {$core->get_Lang("DESTINATIONS")}
                    </div>
                    <div class="unika_footer_list_link flex-column">
                        <a href="#" class="unikasia_footer_link">
                            Travel to Vietnam
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            Travel to Cambodia
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            Travel to Laos
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            Travel to Myanmar
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            Travel to Thailand
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            Travel to Thailand
                        </a>
                    </div>
                </div>
                <div class="unika_footer_item d-flex flex-column">
                    <div class="unika_footer_title d-flex flex-column">
                        {$core->get_Lang("OTHERS")}
                    </div>
                    <div class="unika_footer_list_link flex-column">
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Stay")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Cruise")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Experiences")}
                        </a>
                        <a href="#" class="unikasia_footer_link">
                            {$core->get_Lang("Blog")}
                        </a>
                    </div>
                </div>
            </div>
            <div class="unika_infor_mobile">
                <a href="#" class="unikasia_travel">{$clsConfiguration->getValue($CompanyName)}</a>
                <div class="unika_link_mobile">
                    <a href="#" class="unikasia_footer_link">
                        {assign var=CompanyAddress1 value=CompanyAddress1_|cat:$_LANG_ID}
                        {$clsConfiguration->getValue($CompanyAddress1)}
                    </a>
                    <a href="#" class="unikasia_footer_link">
                        www.hanoivoyage.com
                    </a>
                    <a href="#" class="unikasia_footer_link">
                        info@hanoivoyage.com
                    </a>
                    <a href="#" class="unikasia_footer_link">
                        +84 243 715 3012
                    </a>
                </div>
                <div class="unika_social_footer_icon">
                    <a href="https://www.youtube.com/user/vietiso" class="unika_social_footer">
                        <i class="fa-brands fa-youtube" aria-hidden="true"></i>
                    </a>
                    <a href="https://x.com/vietiso" class="unika_social_footer">
                        <i class="fa-brands fa-twitter"></i>
                    </a>
                    <a href="https://www.instagram.com/unikaisa" class="unika_social_footer">
                        <i class="fa-brands fa-instagram" aria-hidden="true"></i>
                    </a>
                    <a href="https://www.facebook.com/unikasia" class="unika_social_footer">
                        <i class="fa-brands fa-facebook-f" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="unika_footer_2 d-flex justify-content-between">
            <div class="unika_footer_2_left d-flex align-items-center">
                <a class="unika_logo_footer" href="/">
                    <img src="{$clsConfiguration->getValue('FooterLogo')}" alt="Logo" width="150" height="56">
                </a>
                <div class="unika_footer_2_txt d-flex flex-column">
                    <span>{$core->get_Lang("International tour operator approved by the National Tourism Administration in Vietnam")}.</span>
                    <span>LICENCE N°: {$clsConfiguration->getValue('GPKD')}</span>
                </div>
            </div>
            <div class="unika_footer_2_right">
                <span>Follow our social networks</span>
                <div class="unika_social_footer_icon">
                    <a href="https://www.youtube.com/user/vietiso" class="unika_social_footer">
                        <i class="fa-brands fa-youtube" aria-hidden="true"></i>
                    </a>
                    <a href="https://x.com/vietiso" class="unika_social_footer">
                        <i class="fa-brands fa-twitter"></i>
                    </a>
                    <a href="https://www.instagram.com/unikaisa" class="unika_social_footer">
                        <i class="fa-brands fa-instagram" aria-hidden="true"></i>
                    </a>
                    <a href="https://www.facebook.com/unikasia" class="unika_social_footer">
                        <i class="fa-brands fa-facebook-f" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var mod = '{$mod}';
    var act = '{$act}';
</script>

<!-- Code Backup cho Hiếu -->
 <a id="backTop" class="bg_main" role="link" href="javascript:void(0);">
    <i class="fa fa-arrow-up" aria-hidden="true"></i>
</a>
<div id="btn-tailor-fixed">
    <a href="{$clsTour->getLink2(0, 1)}" class="tailor_btn_fixed" title="TAILOR-MADE TRAVEL">
        <div class="tailor_img_fixed">
            <img src="https://unikasia.vietiso.com/isocms/templates/default/skin/images/destination/hn_voyages.png" alt="">
        </div>
        {$core->get_Lang("TAILOR-MADE TRAVEL")}
    </a>
</div>
<div id="icon-fixed">
    <div class="social-icons">
        {if $clsConfiguration->getValue('Youtube_Link')}
        <a href="https://www.youtube.com/{$clsConfiguration->getValue('SiteYoutubeLink')}" class="social-icon"><i class="fa-brands fa-youtube"></i></a>
        {/if}
        {if $clsConfiguration->getValue('Twitter_Link')}
        <a href="https://x.com/{$clsConfiguration->getValue('SiteTwitterLink')}" class="social-icon">
            <i class="fa-brands fa-x-twitter"></i>
        </a>
        {/if}
        {if $clsConfiguration->getValue('Instagram_Link')}
        <a href="https://www.instagram.com/{$clsConfiguration->getValue('SiteInstagramLink')}" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
        {/if}
        {if $clsConfiguration->getValue('Facebook_Link')}
        <a href="https://www.facebook.com/{$clsConfiguration->getValue('SiteFacebookLink')}" class="social-icon"> <i class="fa-brands fa-facebook-f"></i> </a>
        {/if}
        {if $clsConfiguration->getValue('Printest_Link')}
        <a href="https://www.pinterest.com/{$clsConfiguration->getValue('SitePrintestLink')}" class="social-icon"> <i class="fa-brands fa-pinterest"></i></a>
        {/if}
        {if $clsConfiguration->getValue('LinkedIn_Link')}
        <a href="https://www.linkedin.com/{$clsConfiguration->getValue('SiteLinkedInLink')}" class="social-icon"><i class="fa-brands fa-linkedin-in"></i></a>
        {/if}
    </div>
</div>
<script>
    var msg_success = "{$core->get_Lang('Send email successfully. Please check!')}"
    var msg_fail = "{$core->get_Lang('Send email fail. Please sent again!')}"
    var msg_error = "{$core->get_Lang('Please enter your email')}"
</script>
{literal}
    <script>
        $(".unika_btn_search").click(function() {
            let data = {email: $("#email").val()};
            if ($("#email").val() == "") {
                alert(msg_error)
                return;
            }
            $.post(path_ajax_script+'/index.php?mod=home&act=ajSubmitSubscribe', data)
                .done(function(res) { alert(res); })
        });
    </script>
{/literal}