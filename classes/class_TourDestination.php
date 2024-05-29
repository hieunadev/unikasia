<?php
class TourDestination extends dbBasic{
	function __construct(){
		$this->pkey = "tour_destination_id";
		$this->tbl = DB_PREFIX."tour_destination";
	}
	function getMaxOrderNoByTour($tour_id){
		$res = $this->getAll("tour_id='$tour_id' order by order_no DESC limit 0,1");
		return intval($res[0]['order_no'])+1;
	}
	function checkExist($tour_id){
		$res = $this->getAll("tour_id='$tour_id' limit 0,1");
		return (!empty($res))?1:0;
	}
	function getByDestination($tour_id,$destination_id){
		$all=$this->getAll("is_trash=0 and tour_id='$tour_id' and destination_id='$destination_id' order by ".$this->pkey." limit 0,1");
		return $all[0][$this->pkey];
	}

    function getByCountry($tour_id, $act = "place") {
        global $clsISO;
        $clsCity = new City();
        $rec = $this->getAll("is_trash=0 and tour_id='$tour_id' order by order_no"  , "country_id, city_id");
        $list_city_names = array();
        foreach ($rec as $k => $v) {
            $list_city_names[] = $clsCity->getTitle($v["city_id"]);
        }
        if ($act == "startFinish") {
            $first_city_name = $clsCity->getTitle($rec[0]["city_id"]);
            $last_city_name = $clsCity->getTitle(end($rec)["city_id"]);
            return ($first_city_name == $last_city_name) ? $first_city_name : "$first_city_name/$last_city_name";
        }

        return implode(' - ', $list_city_names);
    }
}
?>