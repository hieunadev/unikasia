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
        $clsCity = new City();
        $rec = $this->getAll("is_trash=0 and tour_id='$tour_id' order by order_no", "country_id, city_id");
        $cities = array();
        $other_city = array();
        $count_other_city = 0;
        foreach ($rec as $v) {
            if (count($cities) < 3) {
                $cities[] = $clsCity->getTitle($v["city_id"]);
            } else {
                $other_city[] = $clsCity->getTitle($v["city_id"]);
                $count_other_city++;
            }
        }
        switch ($act) {
            case "startFinish":
                $first_city_name = $clsCity->getTitle($rec[0]["city_id"]);
                $last_city_name = $clsCity->getTitle(end($rec)["city_id"]);
                $rec = ($first_city_name == $last_city_name) ? $first_city_name : "$first_city_name/$last_city_name";
                break;
            case "city":
                $rec = implode(' - ', $cities);
                break;
            case "other_city":
                $rec = implode(' - ', $other_city);
                break;
            default:
                $rec = $count_other_city;
        }
        return $rec;
    }
}
?>