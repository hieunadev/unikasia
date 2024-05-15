<?php
/* Smarty version 3.1.38, created on 2024-05-06 10:03:52
  from '/home/unikasia/domains/unikasia.com/private_html/isocms/templates/default/hotel/default.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.38',
  'unifunc' => 'content_663848985edee3_85982272',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '80353c352406ab929eaa232e00bfff432b007e83' => 
    array (
      0 => '/home/unikasia/domains/unikasia.com/private_html/isocms/templates/default/hotel/default.tpl',
      1 => 1714822361,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_663848985edee3_85982272 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="page_container page<?php echo $_smarty_tpl->tpl_vars['mod']->value;
echo $_smarty_tpl->tpl_vars['act']->value;?>
">
    <div class="banner">
    	<img src="<?php echo $_smarty_tpl->tpl_vars['clsConfiguration']->value->getImage('site_hotel_banner',1920,400);?>
" width="1920" height="400" class="img100" alt="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Hotels');?>
" />
		<?php echo $_smarty_tpl->tpl_vars['core']->value->getBlock('box_form_search_hotel');?>

    </div>
    <nav class="breadcrumb-main breadcrumb-cruise bg-default breadcrumb-more bg_fff">
        <div class="container">
            <ol class="breadcrumb hidden-xs mt0 bg_fff" itemscope itemtype="https://schema.org/BreadcrumbList">
               <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
				   <a itemprop="item" href="<?php echo $_smarty_tpl->tpl_vars['PCMS_URL']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Home');?>
">
					   <span itemprop="name" class="reb"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Home');?>
</span></a>
					<meta itemprop="position" content="1" />
				</li>
               <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
				   <a itemprop="item" href="<?php echo $_smarty_tpl->tpl_vars['clsISO']->value->getLink('hotel');?>
" title="<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Hotels');?>
">
					   <span itemprop="name" class="reb"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Hotels');?>
</span></a>
					<meta itemprop="position" content="2" />
				</li>
            </ol>
        </div>
    </nav>
    <div id="contentPage" class="hotelPlacePage pdt40">
        <div class="container">
        	<h1><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Hotels');?>
</h1>
        	<?php $_smarty_tpl->_assignInScope('site_hotel_intro', ('site_hotel_intro_').($_smarty_tpl->tpl_vars['_LANG_ID']->value));?>
			<div class="intro_top short_content" data-height="150">
				<?php echo html_entity_decode($_smarty_tpl->tpl_vars['clsConfiguration']->value->getValue($_smarty_tpl->tpl_vars['site_hotel_intro']->value));?>

			</div>
        	<div class="row">
				<h2 class="result_search"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Find');?>
 <?php echo $_smarty_tpl->tpl_vars['totalRecord']->value;?>
 <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('accommodations');?>
</h2>
				<div class="col-lg-3">
                    <div class="block991" style="display:none">
                        <div class="tag-search">
                            <div class="btn_open_modal btn_quick_search bg_main" data-bs-toggle="modal"
                                 data-bs-target="#filter_search">
                                <span><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Filter Trip');?>
</span> <i class="fa fa-sliders" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="filter_search" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="filter_left">
                                    <div class="modal-header">
                                        <h2>
                                            <button type="button" class="close" data-bs-dismiss="modal">
                                                <span aria-hidden="true">X</span>
                                                <span class="sr-only"><?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Close');?>
</span>
                                            </button> <?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang('Search');?>

                                        </h2>
                                    </div>
                                    <div class="modal-body">
                                        <?php echo $_smarty_tpl->tpl_vars['core']->value->getBlock('filter_left_search_hotel');?>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

				</div>
				<div class="col-lg-9">
					<?php $_smarty_tpl->_assignInScope('totalHotel', count($_smarty_tpl->tpl_vars['listHotel']->value));?>
					<?php
$__section_i_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['listHotel']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_i_0_total = $__section_i_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_i'] = new Smarty_Variable(array());
if ($__section_i_0_total !== 0) {
for ($__section_i_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] = 0; $__section_i_0_iteration <= $__section_i_0_total; $__section_i_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']++){
?>
					<?php $_smarty_tpl->_assignInScope('hotel_id', $_smarty_tpl->tpl_vars['listHotel']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]['hotel_id']);?>
					<?php $_smarty_tpl->_assignInScope('arrHotel', $_smarty_tpl->tpl_vars['listHotel']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_i']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_i']->value['index'] : null)]);?>
						<?php echo $_smarty_tpl->tpl_vars['clsISO']->value->getBlock('box_hotel_item',array("hotel_id"=>$_smarty_tpl->tpl_vars['hotel_id']->value,"arrHotel"=>$_smarty_tpl->tpl_vars['arrHotel']->value));?>

					<?php
}
}
?>
					<?php if ($_smarty_tpl->tpl_vars['totalPage']->value > '1') {?>
						<div class="pagination pager">
							<?php echo $_smarty_tpl->tpl_vars['page_view']->value;?>

						</div>
					<?php }?>
				</div>
            </div>
        </div>
    </div>
</div>
<?php echo '<script'; ?>
 type="text/javascript">
	var $_View_more = '<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("View more");?>
';
	var $_Less_more = '<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("Less more");?>
';
	var $Loading = '<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("Loading");?>
';
	var selectmonth='<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("select month");?>
';
	var $_Expand_all = '<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("Expand all");?>
';
	var $_Collapse_all = '<?php echo $_smarty_tpl->tpl_vars['core']->value->get_Lang("Collapse all");?>
';
	var $_LANG_ID = '<?php echo $_smarty_tpl->tpl_vars['_LANG_ID']->value;?>
';
<?php echo '</script'; ?>
>

<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['URL_JS']->value;?>
/jquery.countdown.min.js?v=<?php echo $_smarty_tpl->tpl_vars['upd_version']->value;?>
"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['URL_JS']->value;?>
/jquery-confirm.min.js?v=<?php echo $_smarty_tpl->tpl_vars['upd_version']->value;?>
"><?php echo '</script'; ?>
>
<?php }
}
