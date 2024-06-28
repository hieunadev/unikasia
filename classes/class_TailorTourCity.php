<?php
class TailorTourCity extends dbBasic
{
    function __construct()
    {
        $this->pkey = "tailor_tour_city_id";
        $this->tbl = DB_PREFIX . "tailor_tour_city";
    }

    function getMaxId()
    {
        global $_LANG_ID, $dbconn;
        //$res = $this->getAll("1=1 order by reviews_id desc"); 
        $res = $dbconn->getAll("SELECT tailor_tour_city_id FROM default_tailor_tour_city WHERE 1=1 order by tailor_tour_city_id desc");
        return intval($res[0]['tailor_tour_city_id']) + 1;
    }

    function getMaxOrderNo()
    {
        $res = $this->getAll("is_trash=0 order by order_no desc limit 0,1");
        return intval($res[0]['order_no']) + 1;
    }
}
