<div class="page_container page-tour_setting">
	{$core->getBlock('header_title_module_setting')}
	<div class="container-fluid container-fluid-2 d-flex">
		{$core->getBlock('menu_cruise_setting')}
		<div class="content_setting_box">
			<div class="page_detail-title d-flex">
				<div class="title">
					<h2>{$core->get_Lang('Module Setting')}</h2>
				</div>
			</div>
			<form method="post" action="" enctype="multipart/form-data">
				{*<div class="inpt_tour">
					<h4 class="mb10">{$core->get_Lang('Booking Includes')}</h4>
					<textarea style="width:100%" table_id="{$pvalTable}" name="iso-{$site_cruise_include}" class="textarea_intro_editor" data-column="iso-intro" id="textarea_intro_editor_overview_{$now}" cols="255" rows="2">{$clsConfiguration->getValue($site_cruise_include)}</textarea>
				</div>*}

				<div class="inpt_tour">
					<h4 class="mb10">{$core->get_Lang('Cruise banner title')}</h4>
					<input class="input_text_form" data-table_id="{$pvalTable}" name="iso-CruiseBannerTitle" value="{$clsConfiguration->getValue('CruiseBannerTitle')}" maxlength="255" type="text" />
				</div>
				<div class="inpt_tour mt30">
					<h4 class="mb10">{$core->get_Lang('Cruise banner description')}</h4>
					<textarea style="width:100%" table_id="{$pvalTable}" name="iso-CruiseBannerDescription" id="CruiseBannerDescription_{time()}" data-column="iso-CruiseBannerDescription" class="textarea_intro_editor_simple" cols="255" rows="2">
						{$clsConfiguration->getValue('CruiseBannerDescription')}
					</textarea>
				</div>
				<div class="inpt_tour mt30">
					<h4 class="mb10">{$core->get_Lang('Cruise banner image')}</h4>
					<div class="fieldarea">
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<input class="text_32 border_aaa bold" type="text" id="CruiseBannerImage" name="iso-CruiseBannerImage" value="{$clsConfiguration->getValue('CruiseBannerImage')}" style="float: right;width: 85%;" onClick="loadHelp(this)" readonly>
								<a style="float:left" href="#" class="ajOpenDialog" isoman_for_id="CruiseBannerImage" isoman_name="iso-CruiseBannerImage"><img src="{$URL_IMAGES}/general/folder-32.png" border="0" title="Open" alt="Open" /></a>
							</div>
							<div class="col-sm-12 col-md-6">
								<img id="isoman_show_CruiseBannerImage" class="float-left mr-3" src="{$clsConfiguration->getValue('CruiseBannerImage')}" width="480" height="150" />
							</div>
						</div>
					</div>
				</div>

				<div class="clearfix mt10"></div>
				<fieldset class="submit-buttons">
					{$saveBtn}
					<input value="UpdateConfiguration" name="submit" type="hidden">
				</fieldset>
			</form>
		</div>
	</div>
</div>