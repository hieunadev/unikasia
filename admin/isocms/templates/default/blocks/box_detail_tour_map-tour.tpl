<div class="box_title_trip_code">
    <div class="row d-flex full-height">
        <div class="col-md-9">
            <div class="fill_data_box">
                <h3 class="title_box">{$core->get_Lang('Map tour')}</h3>
                {assign var = SiteHasProgramFile_Tours value = $clsConfiguration->getValue('SiteHasProgramFile_Tours')}
                <div class="form-group inpt_tour">
                    <div class="row">
                        <div class="col-xs-12 col-md-5">
                            <div class="drop_gallery" onClick="loadHelp(this)">
                                <div class="filedrop full" onClick="file_explorer(this,event);" ondrop="file_drop(this,event)" toid="selectFile" toel="isoman_show_map_tour" data-options='{ldelim}"openFrom":"map_tour","clsTable":"Tour", "table_id":"{$pvalTable}","toId":"isoman_show_map_tour" {rdelim}' ondragover="return false">
                                    <h3>{$core->get_Lang('Drop files to upload')}</h3>
                                    <p>Kích thước (WxH=842x672)<br />
                                        Các loại tệp được hỗ trợ là: .png,.jpg,.jpeg</p>
                                    <button type="button" class="btn btn-upload">{if $oneItem.map_tour}Thay ảnh{else}Tải ảnh lên{/if}</button>
                                </div>
                                <input class="hidden" id="selectFile" type="file" data-options='{ldelim}"openFrom":"map_tour","clsTable":"Tour", "table_id":"{$pvalTable}","toId":"isoman_show_map_tour"{rdelim}' name="map_tour">

                                <input type="hidden" value="{$oneItem.map_tour}" name="map_tour" id="map_tour" />
                                <a table_id="{$pvalTable}" isoman_multiple="0" isoman_callback='isoman_callback({ldelim}"openFrom":"map_tour", "clsTable":"Tour", "pvalTable":"{$pvalTable}","toField":"map_tour","toId":"isoman_show_map_tour"{rdelim})' class="btn-upload-2 ajOpenDialog" isoman_for_id="map_tour" isoman_name="map_tour">{$clsISO->makeIcon('folder-o', $core->get_Lang('From library'))}</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-5">
                            <img class="img-responsive radius-3" id="isoman_show_map_tour" src="{$clsTour->getMapTour($oneItem.tour_id,842,672)}" onerror="this.src='{$URL_IMAGES}/none_image.png'" alt="{$core->get_Lang('images')}" style="width:450px; height:285px"  />
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn_save_titile_trip_code">
                <a tour_id="{$pvalTable}" cat_run="{$cat_run}" prev_step="{if $child_cat_menu_j_index_prev eq ''}{if $list_cat_menu_prev eq ''}{$child_cat_menu_j}{/if}{if $list_cat_menu_prev ne ''}{$list_cat_menu_prev}/{$child_cat_menu_prev[$count_child_cat_menu_prev]}{/if}{else}{$child_cat_menu_j_index_prev}{/if}" class="back_step">{$core->get_Lang('Back')}</a>
                <a id="btn-save-img-file"  tour_id="{$pvalTable}" cat_run="{$cat_run}" status="" present_step="{$child_cat_menu_j}" next_step="{if $child_cat_menu_j_index_next eq ''}{if $list_menu_tour_i_index_next.cat_menu eq ''}SaveAll{/if}{if $list_menu_tour_i_index_next.cat_menu ne ''}{$list_cat_menu_next}/{$child_cat_menu_next[0]}{/if}{else}{$child_cat_menu_j_index_next}{/if}" class="save_and_continue_tour">{$core->get_Lang('Save &amp; Continue')}</a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="instruction_fill_data_box">
                <p class="title_box"><i class="fa fa-question-circle text-red " aria-hidden="true"></i> {$core->get_Lang('Instructions')}</p>
                <div class="content_box">{$clsConfiguration->getValue($image_tour)|html_entity_decode}</div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var clsTable = 'Tour';
    var table_id = '{$pvalTable}';
</script>