<div class="breadcrumb">
    <strong>{$core->get_Lang('youarehere')} : </strong>
    <a href="{$PCMS_URL}" title="{$core->get_Lang('home')}">{$core->get_Lang('home')}</a>
    <a>&raquo;</a>
    <a href="{$PCMS_URL}/index.php?mod=country">{$core->get_Lang('Travel Styles by Country')}</a>
    <a>&raquo;</a>
    <!-- // -->
    <a href="javascript:window.history.back();" class="back fr">{$core->get_Lang('back')}</a>
</div>
<div class="page-tour_setting page_container">
    {$core->getBlock('header_title_tour_setting')}
    <div class="container-fluid container-fluid-2 d-flex">
        {$core->getBlock('menu_tour_exhautive_setting')}

        <div class="content_setting_box">
            <div class="page_detail-title d-flex">
                <div class="title">
                    <h2>{$core->get_Lang('Travel Styles by Country list')}
                    </h2>
                    <p>{$core->get_Lang('Chức năng quản lý danh sách các danh mục tour theo quốc gia phục vụ cho việc phân loại tour du lịch trong hệ thống isoCMS')}</p>
                    <p>{$core->get_Lang('This function is intended to manage Travel Styles by Country in isoCMS system')}</p>
                </div>
                <div class="button_right">
                    <a class="btn btn-main btn-addnew add_new_why_travelstyle_country" title="{$core->get_Lang('Add')}">{$core->get_Lang('Add new')}</a>
                </div>
            </div>
            <div class="filter_box">
                <form id="forums" method="post" class="filterForm" action="">
                    {*<div class="form-group form-keyword">
                        <input class="form-control" type="text" name="keyword" value="{$keyword}" placeholder="{$core->get_Lang('search')}..." />
                    </div>*}
                    <div class="form-group form-category">
                        <select onchange="_reload()" name="country_id" class="form-control">
                            {$clsCountry->makeSelectboxOption($country_id)}
                        </select>
                    </div>
                    <div class="form-group form-button">
                        <button type="submit" class="btn btn-main" id="findtBtn">Tìm kiếm</button>
                        <input type="hidden" name="filter" value="filter" />
                    </div>
                    <div class="form-group form-button">
                        <a class="btn btn-delete-all" id="btn_delete" clsTable="WhyTravelstyle" style="display:none">
                            {$core->get_Lang('Delete')}
                        </a>
                    </div>
                </form>
            </div>

            <div class="hastable">
                <table cellspacing="0" class="tbl-grid full-width table-striped table_responsive">
                    <thead>
                        <tr>
                            <th class="gridheader" style="width:40px"><input id="check_all" type="checkbox" /></th>
                            <th class="gridheader hiden767"><strong>{$core->get_Lang('ID')}</strong></th>
                            <th class="gridheader name_responsive" style="text-align:left">
                                <strong>{$core->get_Lang('Title')}</strong>
                            </th>
                            <th class="gridheader hiden_responsive" style="text-align:left; width:150px">
                                <strong>{$core->get_Lang('Country')}</strong>
                            </th>
                            <th class="gridheader hiden_responsive" style="text-align:left; width:150px">
                                <strong>{$core->get_Lang('Travel style')}</strong>
                            </th>
                            <th class="gridheader hiden_responsive" style="width:55px;"><strong>{$core->get_Lang('status')}</strong></th>
                            <th class="gridheader hiden_responsive" width="60px"><strong>{$core->get_Lang('func')}</strong></th>
                        </tr>
                    </thead>
                    {if $allItem[0].why_trvs_id ne ''}

                    {/if}
                </table>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="{$URL_THEMES}/tour_exhautive/js/jquery.category_country.js?v={$upd_version}"></script>

<script type="text/javascript">
    var country_id = "{$country_id}";
    var $recordPerPage = '{$recordPerPage}';
    var $currentPage = '{$currentPage}';
    console.log(country_id);
    console.log(recordPerPage);
    console.log(currentPage);
</script>
{literal}
<script type="text/javascript">
    $("#SortAble").sortable({
        opacity: 0.8,
        cursor: 'move',
        start: function() {
            vietiso_loading(1);
        },
        stop: function() {
            vietiso_loading(0);
        },
        update: function() {
            var recordPerPage = $recordPerPage;
            var currentPage = $currentPage;
            var order = $(this).sortable("serialize") + '&update=update' + '&recordPerPage=' + recordPerPage + '&currentPage=' + currentPage;
            $.post(path_ajax_script + "/index.php?mod=tour&act=ajUpdPosSortTravelStylebyCountry", order,

                function(html) {
                    vietiso_loading(0);
                    location.href = REQUEST_URI;
                });
        }
    });
</script>
{/literal}