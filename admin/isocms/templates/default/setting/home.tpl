<div class="breadcrumb">
	<strong>Bạn đang ở:</strong>
	<a href="{$PCMS_URL}" title="Trang chủ">{$core->get_Lang('Home')}</a>
    <a>&raquo;</a>
    <a href="{$PCMS_URL}/index.php?mod={$mod}" title="Cài đặt">{$core->get_Lang('Installation')}</a>
    <a href="javascript:window.history.back();" class="back fr">{$core->get_Lang('Come back')}</a>
</div>
<div class="page-tour_setting">
	<div class="page-title  d-flex" onclick="location.href='{$PCMS_URL}/?&mod={$mod}&act={$act}'">
		<div class="title">
			<h1>{$core->get_Lang('Home Config')}</h1>
			<p>{$core->get_Lang('Enter full fields in the required fields')}</p>
		</div>
	</div>
	<div class="container-fluid">
		<form id="forums" method="post" class="filterForm" action="">

			<fieldset>
				<legend>{$core->get_Lang("Attractive tour")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleAttractiveTour value = TitleAttractiveTour_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleAttractiveTour)}" name="iso-{$TitleAttractiveTour}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroAttractiveTour value = IntroAttractiveTour_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroAttractiveTour}" id="IntroAttractiveTour" cols="255" rows="2">{$clsConfiguration->getValue($IntroAttractiveTour)}</textarea>
					</div>
				</div>
			</fieldset>
            {if $package_id !=1}
			{if $_LANG_ID ne 'vn'}
			<fieldset>
				<legend>{$core->get_Lang("Outstanding Travel Styles")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleCatTour value = TitleCatTour_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleCatTour)}" name="iso-{$TitleCatTour}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroCatTour value = IntroCatTour_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroCatTour}" id="IntroCatTour" cols="255" rows="2">{$clsConfiguration->getValue($IntroCatTour)}</textarea>
					</div>
				</div>
			</fieldset>
			{/if}
			<fieldset>
				<legend>{$core->get_Lang("Favorite destination")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleFavoriteDestination value = TitleFavoriteDestination_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleFavoriteDestination)}" name="iso-{$TitleFavoriteDestination}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroFavoriteDestination value = IntroFavoriteDestination_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroFavoriteDestination}" id="IntroFavoriteDestination" cols="255" rows="2">{$clsConfiguration->getValue($IntroFavoriteDestination)}</textarea>
					</div>
				</div>
			</fieldset>
			{if $_LANG_ID eq 'vn'}
			<fieldset>
				<legend>{$core->get_Lang("Tour Inbound")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleTourInbound value = TitleTourInbound_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleTourInbound)}" name="iso-{$TitleTourInbound}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroTourInbound value = IntroTourInbound_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroTourInbound}" id="IntroTourInbound" cols="255" rows="2">{$clsConfiguration->getValue($IntroTourInbound)}</textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend>{$core->get_Lang("Tour Outbound")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleTourOutbound value = TitleTourOutbound_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleTourOutbound)}" name="iso-{$TitleTourOutbound}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroTourOutbound value = IntroTourOutbound_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroTourOutbound}" id="IntroTourOutbound" cols="255" rows="2">{$clsConfiguration->getValue($IntroTourOutbound)}</textarea>
					</div>
				</div>
			</fieldset>
			{/if}
			{/if}
			<fieldset>
				<legend>{$core->get_Lang("Testimonials Box")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleTestimonialsHome value = TitleTestimonialsHome_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleTestimonialsHome)}" name="iso-{$TitleTestimonialsHome}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroTestimonialsHome value = IntroTestimonialsHome_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroTestimonialsHome}" id="IntroTestimonialsHome" cols="255" rows="2">{$clsConfiguration->getValue($IntroTestimonialsHome)}</textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend>{$core->get_Lang("Travel inspiration")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleTravelInspiration value = TitleTravelInspiration_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleTravelInspiration)}" name="iso-{$TitleTravelInspiration}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroTravelInspiration value = IntroTravelInspiration_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroTravelInspiration}" id="IntroTravelInspiration" cols="255" rows="2">{$clsConfiguration->getValue($IntroTravelInspiration)}</textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend>{$core->get_Lang("Partner")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitlePartner value = TitlePartner_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitlePartner)}" name="iso-{$TitlePartner}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroPartner value = IntroPartner_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroPartner}" id="IntroPartner" cols="255" rows="2">{$clsConfiguration->getValue($IntroPartner)}</textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend>{$core->get_Lang("Press news")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitlePressNews value = TitlePressNews_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitlePressNews)}" name="iso-{$TitlePressNews}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroPressNews value = IntroPressNews_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroPressNews}" id="IntroPressNews" cols="255" rows="2">{$clsConfiguration->getValue($IntroPressNews)}</textarea>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>{$core->get_Lang("Agence Hyour")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleAgenceHyour value = TitleAgenceHyour_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleAgenceHyour)}" name="iso-{$TitleAgenceHyour}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroAgenceHyour value = IntroAgenceHyour_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroAgenceHyour}" id="IntroAgenceHyour" cols="255" rows="2">{$clsConfiguration->getValue($IntroAgenceHyour)}</textarea>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>{$core->get_Lang("Explore our trips")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleExploreTrips value = TitleExploreTrips_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleExploreTrips)}" name="iso-{$TitleExploreTrips}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroExploreTrips value = IntroExploreTrips_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroExploreTrips}" id="IntroExploreTrips" cols="255" rows="2">{$clsConfiguration->getValue($IntroExploreTrips)}</textarea>
					</div>
				</div>
			</fieldset>

			<fieldset>
				<legend>{$core->get_Lang("How it works")}</legend>
				{section name=i loop=5 start=1}
					{assign var = k value = $smarty.section.i.index}
					<fieldset class="how_it_work_{$k}">
						<legend>{$core->get_Lang("Step $k")}</legend>
						<div class="row-span">
							<div class="fieldlabel">{$core->get_Lang('Title')}</div>
							{assign var = TitleHowItWorkStep value = TitleHowItWorkStep|cat:$k|cat:_|cat:$_LANG_ID}
							<div class="fieldarea">
								<input type="text" class="text_32 full-width border_aaa"
									   value="{$clsConfiguration->getValue($TitleHowItWorkStep)}"
									   name="iso-{$TitleHowItWorkStep}"/>
							</div>
						</div>
						<div class="row-span">
							<div class="fieldlabel">{$core->get_Lang("Icon")}</div>
							<div class="fieldarea">
								{assign var = IconHowItWorkStep value = IconHowItWorkStep|cat:$k|cat:_|cat:$_LANG_ID}
								<img class="float-left mr-3" src="{$clsConfiguration->getValue($IconHowItWorkStep)}" width="40px" height="40px" />
								<input class="text_32 border_aaa bold" type="text" id="isoman_hidden_file_programme_{$k}" name="iso-{$IconHowItWorkStep}" value="{$clsConfiguration->getValue($IconHowItWorkStep)}" style="width:100%; max-width:300px; float:left" onClick="loadHelp(this)" readonly><a style="float:left; margin-left:4px; margin-top:-4px;" href="#" class="ajOpenDialog" isoman_for_id="file_programme_{$k}" isoman_name="file_programme_{$k}"><img src="{$URL_IMAGES}/general/folder-32.png" border="0" title="Open" alt="Open" /></a>
							</div>
						</div>
						<div class="row-span">
							<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
							<div class="fieldarea">
								{assign var = IntroHowItWorkStep value = IntroHowItWorkStep|cat:$k|cat:_|cat:$_LANG_ID}
								<textarea style="width:100%" class="textarea_intro_editor_simple"
										  name="iso-{$IntroHowItWorkStep}" id="{$IntroHowItWorkStep}" cols="255"
										  rows="2">{$clsConfiguration->getValue($IntroHowItWorkStep)}</textarea>
							</div>
						</div>
					</fieldset>
				{/section}
			</fieldset>

			<fieldset>
				<legend>{$core->get_Lang("Your perfect trip begins with a conversation")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitlePerfectTrip value = TitlePerfectTrip_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitlePerfectTrip)}" name="iso-{$TitlePerfectTrip}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroPerfectTrip value = IntroPerfectTrip_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroPerfectTrip}" id="IntroPerfectTrip" cols="255" rows="2">{$clsConfiguration->getValue($IntroPerfectTrip)}</textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend>{$core->get_Lang("SO, READY TO START?")}</legend>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Title')}</div>
					{assign var = TitleVideoPerfect value = TitleVideoPerfect_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($TitleVideoPerfect)}" name="iso-{$TitleVideoPerfect}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Short description')}</div>
					<div class="fieldarea">
						{assign var = IntroVideoPerfect value = IntroVideoPerfect_|cat:$_LANG_ID}
						<textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$IntroVideoPerfect}" id="IntroVideoPerfect" cols="255" rows="2">{$clsConfiguration->getValue($IntroVideoPerfect)}</textarea>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang('Link Youtube')}</div>
					{assign var = LinkVideoPerfect value = LinkVideoPerfect_|cat:$_LANG_ID}
					<div class="fieldarea">
						<input type="text" class="text_32 full-width border_aaa" value="{$clsConfiguration->getValue($LinkVideoPerfect)}" name="iso-{$LinkVideoPerfect}"/>
					</div>
				</div>
				<div class="row-span">
					<div class="fieldlabel">{$core->get_Lang("Thumbnail")}</div>
					<div class="fieldarea">
						{assign var = ThumbnailYoutube value = ThumbnailYoutube_|cat:$_LANG_ID}
						<img class="float-left mr-3" src="{$clsConfiguration->getValue($ThumbnailYoutube)}" width="40px" height="40px" />
						<input class="text_32 border_aaa bold" type="text" id="isoman_hidden_file_programme_ThumbnailYoutube" name="iso-{$ThumbnailYoutube}" value="{$clsConfiguration->getValue($ThumbnailYoutube)}" style="width:100%; max-width:300px; float:left" onClick="loadHelp(this)" readonly><a style="float:left; margin-left:4px; margin-top:-4px;" href="#" class="ajOpenDialog" isoman_for_id="file_programme_ThumbnailYoutube" isoman_name="file_programme_ThumbnailYoutube"><img src="{$URL_IMAGES}/general/folder-32.png" border="0" title="Open" alt="Open" /></a>
					</div>
				</div>
			</fieldset>
			<fieldset class="submit-buttons">
				{$saveBtn}
				<input value="UpdateConfiguration" name="submit" type="hidden">
			</fieldset>
		</form>
	</div>
</div>
<script type="text/javascript">
	var $type = 'WhyUsHomePage';
	var $target_id = '0';
</script>