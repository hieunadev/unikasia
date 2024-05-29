<?php
class WhyTravelstyle extends dbBasic
{
    function __construct()
    {
        $this->pkey = "why_trvs_id";
        $this->tbl = DB_PREFIX . "why_travelstyle";
    }
    function getTitle($why_trvs_id, $one = null)
    {
        if (!isset($one['title'])) {
            $one = $this->getOne($why_trvs_id, 'title');
        }
        return $one['title'];
    }
    function getImageUrl($why_trvs_id)
    {
        global $clsISO;
        $one = $this->getOne($why_trvs_id, 'image');
        $url_image = $one['image'];
        return $clsISO->tripslashUrl($url_image);
    }
    function getImage($why_trvs_id, $oneTable = null)
    {
        global $clsISO;

        if (!isset($oneTable['image'])) {
            $oneTable = $this->getOne($why_trvs_id, 'image');
        }
        $url_image = $oneTable['image'];
        return $clsISO->tripslashUrl($url_image);
        //return $clsISO->tripslashUrlWebp($url_image);
    }
    function getMetaDescription($pvalTable)
    {
        global $_LANG_ID;
        $one = $this->getOne($pvalTable, 'intro');
        return html_entity_decode($one['intro']);
    }
    function getStripIntro($why_trvs_id, $one = null)
    {
        if (!isset($one['intro'])) {
            $one = $this->getOne($why_trvs_id, 'intro');
        }
        return strip_tags(html_entity_decode($one['intro']));
    }
    function getIntro($why_trvs_id, $one = null)
    {
        if (!isset($one['intro'])) {
            $one = $this->getOne($why_trvs_id, 'intro');
        }
        return html_entity_decode($one['intro']);
    }
    function checkExist($why_trvs_id, $type)
    {
        $res = $this->getAll("why_trvs_id='$why_trvs_id' and type='$type' limit 0,1");
        return (!empty($res)) ? 1 : 0;
    }
    function doDelete($why_trvs_id)
    {
        $this->deleteOne($why_trvs_id);
        return 1;
    }
}
