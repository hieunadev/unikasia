<?php
/* Smarty version 3.1.38, created on 2024-04-11 07:40:44
  from '/home/isocms/domains/isocms.com/private_html/admin/isocms/templates/default/feedback/default.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.38',
  'unifunc' => 'content_6617318cf09b25_58211457',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '56b2a851ce216870ac31e0a82da790c049cc5844' => 
    array (
      0 => '/home/isocms/domains/isocms.com/private_html/admin/isocms/templates/default/feedback/default.tpl',
      1 => 1702371436,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6617318cf09b25_58211457 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/home/isocms/domains/isocms.com/public_html/inc/smarty3138/plugins/modifier.truncate.php','function'=>'smarty_modifier_truncate',),));
?>
<div class="page_container">
	<div class="page-title  d-flex">
        <div class="title">
			<h2>
				<?php if ($_smarty_tpl->tpl_vars['is_process']->value != '') {?>
					<?php if ($_smarty_tpl->tpl_vars['is_process']->value == 0) {
echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Contact Reminding List');
}?>
					<?php if ($_smarty_tpl->tpl_vars['is_process']->value == 1) {
echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Contact Offered List');
}?>
					<?php if ($_smarty_tpl->tpl_vars['is_process']->value == 2) {
echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Contact Reviewed List');
}?>
				<?php } else { ?>
					<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Contact List');?>

				<?php }?>
			</h2>
			<?php $_smarty_tpl->_assignInScope('setting', ((('SiteIntroModule_').($_smarty_tpl->tpl_vars['mod']->value)).('_')).($_smarty_tpl->tpl_vars['_LANG_ID']->value));?>
			<?php if ($_smarty_tpl->tpl_vars['clsConfiguration']->value->getValue($_smarty_tpl->tpl_vars['setting']->value) != '') {?>
			<p><?php echo html_entity_decode($_smarty_tpl->tpl_vars['clsConfiguration']->value->getValue($_smarty_tpl->tpl_vars['setting']->value));?>
</p>
			<?php }?>
			
		</div>
    </div>
	<div class="container-fluid">
	<form method="post" id="forums" class="filterForm">
		<div class="wrap fiterbox">
			<div class="group_buttons fl">
				<a href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
" class="btn btn-success btnNew">
					<i class="icon-folder-open icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('total');?>
 (<?php echo $_smarty_tpl->tpl_vars['allItem']->value;?>
)</span>
				</a>
				<a href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&is_process=1" class="btn btn-success btnNew" style="background:#06C;border-color:#06C">
                    <i class="icon-folder-open icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Offered');?>
 (<?php echo $_smarty_tpl->tpl_vars['number_process']->value;?>
)</span>
                </a>
                <a href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&is_process=2" class="btn btn-success btnNew" style="background:#c00000;border-color:#c00000">
                    <i class="icon-warning-sign icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Reviewed');?>
 (<?php echo $_smarty_tpl->tpl_vars['number_reviewed']->value;?>
)</span>
                </a>
                <a href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&is_process=0" class="btn btn-success btnNew" style="background:#FC0;border-color:#FC0">
                    <i class="icon-warning-sign icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Reminding');?>
 (<?php echo $_smarty_tpl->tpl_vars['number_unprocess']->value;?>
)</span>
                </a>
                <?php if (1 == 2) {?>
                <a href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&act=setting" class="btn btn-danger" title="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('settingcontact');?>
"><i class="icon-list icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('settingcontact');?>
</span> </a>
                <?php }?>
			</div>

			<div id="isotabs" class="export_excel fr">
				 <ul>
					<li class="tabchild"><a><img src="<?php echo $_smarty_tpl->tpl_vars['URL_IMAGES']->value;?>
/v2/excel.png" style="vertical-align:middle"> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Export');?>
</a></li>
				</ul>
			</div>
			<a class="btn btn-danger btn-delete-all-new btnNew" clsTable="Feedback" style="display:none;float: right;">
				<i class="icon-remove icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Delete Options');?>
</span>
			</a>
			<div class="clearfix"></div>
			<div id="isotabs_content">
				<div class="isotabbox border_top_1 dateExport" style="display:none">
					<div class="form-group inline-block">
						<div class="span50 fl">
							<label class="col-md-3 col-sm-4 col-xs-4 control-label title" for="from_date">
								<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('From');?>
 <span class="color_r">*</span>
							</label>
							<div class="col-md-9 col-sm-8 col-xs-8">
								<input name="from_date" autocomplete="off" maxlength="10" id="from_date" value="<?php echo $_smarty_tpl->tpl_vars['clsISO']->value->formatTimeDate($_smarty_tpl->tpl_vars['now_day']->value);?>
" size="15" class="full-width text_32 border_aaa" placeholder="dd/mm/yyyy">
							</div>
						</div>
						<div class="span50 fr">
							<label class="col-md-3 col-sm-4 col-xs-4 control-label title" for="to_date">
								<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('To');?>
 <span class="color_r">*</span>
							</label>
							<div class="col-md-9 col-sm-8 col-xs-8">
								<input name="to_date" autocomplete="off" maxlength="10" id="to_date" value="<?php echo $_smarty_tpl->tpl_vars['clsISO']->value->formatTimeDate($_smarty_tpl->tpl_vars['now_next']->value);?>
" size="15" class="full-width text_32 border_aaa" placeholder="dd/mm/yyyy">
							</div>
						</div>
					</div>
					<button type="submit" class="buttonExport" id="button_export"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Export');?>
</button>
					<input type="hidden" name="Export" value="Export" />
				</div> 
			</div> 
		</div>
	</form>
    <div class="clearfix"></div>
    <div class="hastable">
    	<div style="width:100%;">
            <table width="100%" cellspacing="0" class="tbl-grid table-striped table_responsive table-layout-fixed">
                <thead>
                	<tr>
						<th class="gridheader" style="width:70px"><input id="check_all" type="checkbox" /></th>
						<th class="gridheader" style="width:80px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('id');?>
</strong></th>
						<th class="gridheader text-left" style="width:260px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("Customer's Contact");?>
</strong></th>
						<th class="gridheader text-left" style="min-width:150px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Special Requests');?>
</strong></th>
						<th class="gridheader" style="width:150px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Reg date');?>
</strong></th>
						<th class="gridheader" style="width:150px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('status');?>
</strong></th>
						<th class="gridheader" style="width:90px"><strong><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('action');?>
</strong></th>
					</tr>
                </thead>                
                <?php if ($_smarty_tpl->tpl_vars['listItem']->value[0]['feedback_id'] != '') {?>
                <?php
$__section_i_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['listItem']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_i_0_total = $__section_i_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_i'] = new Smarty_Variable(array());
if ($__section_i_0_total !== 0) {
for ($__section_i_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] = 0; $__section_i_0_iteration <= $__section_i_0_total; $__section_i_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']++){
?>
                <?php $_smarty_tpl->_assignInScope('FEEDBACKVALUE', $_smarty_tpl->tpl_vars['clsISO']->value->getArrayFromString($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_store']));?>
                <tr class="<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)%2 == 0) {?>row1<?php } else { ?>row2<?php }?>">
					<td class="index"><input name="p_key[]" class="chkitem" type="checkbox" value="<?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_id'];?>
" /></td>
					<td class="index"><?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_id'];?>
</td>
                   	<td class="td_overflow" style="white-space:nowrap">
						<strong><?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['title'];?>
. <?php echo $_smarty_tpl->tpl_vars['clsClassTable']->value->getFullName($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_id']);?>
 </strong>
						<br />
						<i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:<?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['email'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['email'];?>
</a>
						<br/>
						<i class="fa fa-phone" aria-hidden="true"></i> <a href="tel:+<?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['phone'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['phone'];?>
"><?php echo $_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['phone'];?>
</a>
						<br />
						<i class="fa fa-globe" aria-hidden="true"></i> <span><?php echo $_smarty_tpl->tpl_vars['clsCountry']->value->getTitle($_smarty_tpl->tpl_vars['FEEDBACKVALUE']->value['countryex_id']);?>
</span>
					</td>
                    <td class="td_message"><?php echo smarty_modifier_truncate(preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['FEEDBACKVALUE']->value['Comments']),300);?>
</td>
					<td class="td_overflow" style="white-space:nowrap; text-align:center"><?php echo $_smarty_tpl->tpl_vars['clsISO']->value->formatDate($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['reg_date']);?>
</td>
                    <td align="center" style="text-align:center;white-space:nowrap" >
                        <?php if ($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['is_process'] == '0') {?>
                        <span class="status_pending"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Reminding');?>
</span>
                        <?php } elseif ($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['is_process'] == '2') {?>
                        <span class="status_lock"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Reviewed');?>
</span>
                        <?php } else { ?>
                        <span class="status_approved"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Offered');?>
</span>
                        <?php }?>
                    </td>
                    <td style="vertical-align: middle; width:40px; text-align: center; white-space: nowrap;">
                        <div class="btn-group">
                            <button class="btn btn_dropdown dropdown-toggle" type="button" data-toggle="dropdown">
								<i class="fa fa-ellipsis-v" aria-hidden="true"></i>
							</button>
                            <ul class="dropdown-menu" style="right:0px !important">
                                <li><a title="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('view');?>
" href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&act=edit&feedback_id=<?php echo $_smarty_tpl->tpl_vars['core']->value->encryptID($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_id']);?>
"><i class="icon-edit"></i> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('view');?>
</a></li>
                                <li><a title="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('delete');?>
" class="confirm_delete" href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/?mod=<?php echo $_smarty_tpl->tpl_vars['mod']->value;?>
&act=delete&feedback_id=<?php echo $_smarty_tpl->tpl_vars['core']->value->encryptID($_smarty_tpl->tpl_vars['listItem']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['feedback_id']);?>
"><i class="icon-remove"></i> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('delete');?>
</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>	
                <?php
}
}
?>
                <?php } else { ?>
                <tr>
                    <td colspan="20" style="text-align:center"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('nodata');?>
</td>
                </tr>
                <?php }?>
            </table>
        </div>
        <div class="clearfix" style="height:5px"></div>
        <table width="100%" border="0" cellpadding="3" cellspacing="0">
			<tr>
				<td width="50%" align="left"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('statistical');?>
 <strong><?php echo $_smarty_tpl->tpl_vars['totalRecord']->value;?>
</strong> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('records');?>
/<strong><?php echo $_smarty_tpl->tpl_vars['totalPage']->value;?>
</strong> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('page');?>
. <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('youareonpagenumber');?>
 <strong><?php echo $_smarty_tpl->tpl_vars['currentPage']->value;?>
</strong></td>
				<td width="50%" align="right">
					<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('gotopage');?>
:
					<select name="page" onchange="window.location = this.options[this.selectedIndex].value">
						<?php
$__section_i_1_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['listPageNumber']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_i_1_total = $__section_i_1_loop;
$_smarty_tpl->tpl_vars['__smarty_section_i'] = new Smarty_Variable(array());
if ($__section_i_1_total !== 0) {
for ($__section_i_1_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] = 0; $__section_i_1_iteration <= $__section_i_1_total; $__section_i_1_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']++){
?>
						<option <?php if ($_smarty_tpl->tpl_vars['listPageNumber']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)] == $_smarty_tpl->tpl_vars['currentPage']->value) {?>selected="selected"<?php }?> value="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['link_page_current']->value;?>
&page=<?php echo $_smarty_tpl->tpl_vars['listPageNumber']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)];?>
"><?php echo $_smarty_tpl->tpl_vars['listPageNumber']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)];?>
</option>
						<?php
}
}
?>
					</select>
					<a class="btn btn-danger btn-delete-all" clsTable="Feedback" style="display:none">
						<i class="icon-remove icon-white"></i> <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Delete Options');?>
</span>
					</a>
				</td>
			</tr>
		</table>
        </div>
    </div>
</div>


<?php echo '<script'; ?>
 type="text/javascript">
$(document).ready(function(){
$('#from_date').datepicker({
	dateFormat: "dd/mm/yy", 
	maxDate: "+1Y",
	changeMonth: true,
	changeYear: true,
	numberOfMonths: 1,
	showOtherMonths: true,
	onSelect: function(dateStr) { 
		var date = $(this).datepicker('getDate'); 
		if(date){ 
			date.setDate(date.getDate() + 30); 
		} 
		$('#to_date').datepicker('option').datepicker('setDate', date); 
	},
	onClose: function(dateText, inst) {
		$('#to_date').focus();
	}
});
$("#to_date").datepicker( { 
	dateFormat: "dd/mm/yy", 
	changeMonth: true,
	changeYear: true,
	numberOfMonths: 1,
	showOtherMonths: true
});	
});
<?php echo '</script'; ?>
>

<link rel="stylesheet" type="text/css"  href="<?php echo $_smarty_tpl->tpl_vars['URL_JS']->value;?>
/datepicker/jquery-ui.css?ver=<?php echo $_smarty_tpl->tpl_vars['upd_version']->value;?>
"/>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['URL_JS']->value;?>
/datepicker/jquery-ui.js?v=<?php echo $_smarty_tpl->tpl_vars['upd_version']->value;?>
"><?php echo '</script'; ?>
><?php }
}
