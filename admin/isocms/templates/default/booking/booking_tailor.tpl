{literal}
    <style>
        .tbl-grid tr td{
            padding: 2px 2px;
        }

		.select2-container {
            width: 100% !important;
        }
    </style>
{/literal}

<div class="page_container">
	<div class="page-title d-flex">
        <div class="title">
			<h2>
				{if $status ne ''}
					{if $status eq 0}{$core->get_Lang('Tour Request Reminding List')}{/if}
					{if $status eq 1}{$core->get_Lang('Tour Request Offered List')}{/if}
					{if $status eq 2}{$core->get_Lang('Tour Request Reviewed List')}{/if}
				{else}
					{$core->get_Lang('Tour Request List')}
				{/if}
			</h2>
			{assign var = setting value = 'SiteIntroModule_'|cat:$mod|cat:'_'|cat:$_LANG_ID}
			{if $clsConfiguration->getValue($setting) ne ''}
			<p>{$clsConfiguration->getValue($setting)|html_entity_decode}</p>
			{/if}
		</div>
    </div>
	<div class="container-fluid">
		<div class="filter_box">
			<form id="forums" method="POST" class="filterForm" action="">
				{assign var=blog_category_check value=$clsISO->getCheckActiveModulePackage($package_id,$mod,'category','default')}
				<div class="form-group form-keyword">
					<input class="form-control" type="text" name="keyword" value="{$keyword}" placeholder="{$core->get_Lang('search')}" />
				</div>
				<div class="form-group form-keyword">
					<select name="nationality" id="nationality" class="tailor_select2">
						<option value="">-- {$core->get_Lang('Please Select')} --
						</option>
						{section name=i loop=$lstCountryRegion}
						<option value="{$lstCountryRegion[i].country_id}" {if ($nationality eq $lstCountryRegion[i].country_id)} selected {/if}>{$lstCountryRegion[i].title}
						</option>
						{/section}
					</select>
				</div>
				<div class="form-group form-button">
					<button type="submit" class="btn btn-main" id="findtBtn">Tìm kiếm</button>
					<input type="hidden" name="filter" value="filter" />
				</div>
				<div class="form-group form-button"> <a class="btn btn-delete-all" id="btn_delete" clstable="TailorMadeTour" style="display: none">
					Delete
				</a> </div>
			</form>	
		</div>
		<div class="hastable">
			<div class="statistical mb5">
				<table width="100%" border="0" cellpadding="3" cellspacing="0">
					<tr>
						<td width="50%" align="left">{$core->get_Lang('statistical')} <strong>{$totalRecord}</strong> {$core->get_Lang('records')}/<strong>{$totalPage}</strong> {$core->get_Lang('page')}. {$core->get_Lang('youareonpagenumber')} <strong>{$currentPage}</strong></td>
						<td width="50%" align="right">
							{$core->get_Lang('gotopage')}:
							<select name="page" onchange="window.location = this.options[this.selectedIndex].value">
								{section name=i loop=$listPageNumber}
								<option {if $listPageNumber[i] eq $currentPage}selected="selected"{/if} value="{$PCMS_URL}/{$link_page_current}&page={$listPageNumber[i]}">{$listPageNumber[i]}</option>
								{/section}
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="table_list_booking">
				<table cellspacing="0" class="tbl-grid table-striped table-layout-fixed" width="100%">
					<thead>
						<tr>
							<th class="gridheader" style="width: 40px; text-align: center;">
								<input id="check_all" type="checkbox" style="cursor: pointer;" />
							</th>
							<th class="gridheader" style="width: 10%;">
								<strong>{$core->get_Lang('id')}</strong>
							</th>
							<th class="gridheader" style="text-align:left;white-space:nowrap; width: 15%;">
								<strong>{$core->get_Lang('Name')}</strong>
							</th>
							<th class="gridheader" style="width: 200px; text-align: center;">
								<strong>{$core->get_Lang("Nationality")}</strong>
							</th>
							<th class="gridheader" style="white-space:nowrap; text-align: center;">
								<strong>{$core->get_Lang('Email')}</strong>
							</th>
							<th class="gridheader" style="white-space:nowrap; width: 150px;">
								<strong>{$core->get_Lang('Phone Number')}</strong>
							</th>
							<!-- <th class="gridheader" style="">
								<strong>{$core->get_Lang('Status')}</strong>
							</th> -->
							<th class="gridheader" style="width: 80px;">
								<strong>{$core->get_Lang('action')}</strong>
							</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$listItem key=key item=item }
						<tr {if $key%2 eq '0'}class="row1"{else}class="row2"{/if}>
							<td class="index" style="text-align: center;">
								<input name="p_key[]" class="chkitem" style="cursor: pointer;" type="checkbox" value="{$item.tailor_made_tour_id}" />
							</td>
							<td class="td_overflow" style="white-space:nowrap; text-align: center;">
								{$item.tailor_made_tour_id}
							</td>
							<td class="index td_overflow" style="white-space:nowrap; text-align: left;">
								{$item.title}. {$item.name}
							</td>
							<td class="td_overflow" style="white-space:nowrap; text-align: center">
								{$cls_Country->getTitle($item.nationality)}
							</td>
							<td class="td_overflow" style="white-space:nowrap">
								{$item.email}
							</td>
							<td class="td_overflow" style="white-space:nowrap; text-align: center;">
								{$item.phone}
							</td>
							<td style="vertical-align: top; text-align: right; white-space: nowrap; width:5%;text-align: center"> 
								<div class="btn-group">
									<button class="btn iso-button-standard dropdown-toggle" type="button" data-toggle="dropdown">
										<i class="icon-cog"></i> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" style="right:0px !important">
									   <li>
											<a href="{$PCMS_URL}/?mod={$mod}&act=edit_tailor&action=booking_tailor&tailor_id={$core->encryptID($item.tailor_made_tour_id)}" title="{$core->get_Lang('view')}">
												<i class="icon-edit"></i> {$core->get_Lang('view')}
											</a>
										</li>
										<li>
											<a class="confirm_delete" href="{$PCMS_URL}/?mod={$mod}&act={$act}&action=delete&tailor_id={$core->encryptID($item.tailor_made_tour_id)}" title="{$core->get_Lang('delete')}">
												<i class="icon-remove"></i> {$core->get_Lang('delete')}
											</a>
										</li>
									</ul>
								</div>
							</td>
						</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
			<div class="clearfix"></div>
			<div class="statistical mb5">
				<table width="100%" border="0" cellpadding="3" cellspacing="0">
					<tr>
						<td width="50%" align="left">{$core->get_Lang('statistical')} <strong>{$totalRecord}</strong> {$core->get_Lang('records')}/<strong>{$totalPage}</strong> {$core->get_Lang('page')}. {$core->get_Lang('youareonpagenumber')} <strong>{$currentPage}</strong></td>
						<td width="50%" align="right">
							{$core->get_Lang('gotopage')}:
							<select name="page" onchange="window.location = this.options[this.selectedIndex].value">
								{section name=i loop=$listPageNumber}
								<option {if $listPageNumber[i] eq $currentPage}selected="selected"{/if} value="{$PCMS_URL}/{$link_page_current}&page={$listPageNumber[i]}">{$listPageNumber[i]}</option>
								{/section}
							</select>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
{literal}
<script>
	$('.tailor_select2').select2({
		width: 'resolve'
	});
</script>
{/literal}