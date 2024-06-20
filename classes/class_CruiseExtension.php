<?php
class CruiseExtension extends dbBasic
{
    function __construct()
    {
        $this->pkey = "cruise_extension_id";
        $this->tbl = DB_PREFIX . "cruise_extension";
    }
    function checkExist($cruise_id, $tour_id, $type)
    {
        $res = $this->getAll("is_trash=0 AND cruise_id='$cruise_id' AND tour_id='$tour_id' AND type = '$type' limit 0,1");
        return !empty($res) ? 1 : 0;
    }
    function checkExistOne($cruise_id)
    {
        $res = $this->getAll("is_trash=0 AND cruise_id='$cruise_id' limit 0,1");
        return !empty($res) ? 1 : 0;
    }
}
