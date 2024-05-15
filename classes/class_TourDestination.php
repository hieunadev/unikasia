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
}
?>