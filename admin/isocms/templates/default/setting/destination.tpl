<div class="breadcrumb">
    <strong>Bạn đang ở:</strong>
    <a href="{$PCMS_URL}" title="Trang chủ">{$core->get_Lang('Home')}</a>
    <a>&raquo;</a>
    <a href="{$PCMS_URL}/index.php?mod={$mod}" title="Cài đặt">{$core->get_Lang('Installation')}</a>
    <a href="javascript:window.history.back();" class="back fr">{$core->get_Lang('Come back')}</a>
</div>
<div class="page-destination_setting">
    <div class="page-title  d-flex" onclick="location.href='{$PCMS_URL}/?&mod={$mod}&act={$act}'">
        <div class="title">
            <h1>{$core->get_Lang('Destination Config')}</h1>
            <p>{$core->get_Lang('Enter full fields in the required fields')}</p>
        </div>
    </div>
    <div class="container-fluid">
        <form id="form_destination_setting" method="post" class="filterForm" action="">
            <fieldset>
                <legend>{$core->get_Lang("Header Destination")}</legend>
                <div class="row-span">
                    <div class="fieldlabel">{$core->get_Lang('Title')}</div>
                    {assign var = TitleAgenceHyour value = TitleAgenceHyour_|cat:$_LANG_ID}
                    <div class="fieldarea">
                        <textarea style="width:100%" class="textarea_intro_editor_simple" name="iso-{$TitleAgenceHyour}" id="TitleAgenceHyour" cols="255" rows="2">{$clsConfiguration->getValue($TitleAgenceHyour)}</textarea>
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
        </form>
    </div>
</div>