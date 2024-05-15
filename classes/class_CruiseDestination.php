<?php
class CruiseDestination extends dbBasic{
	function __construct(){
		$this->pkey = "cruise_destination_id";
		$this->tbl = DB_PREFIX."cruise_destination";
	}
	/*function getMaxId(){
		$res = $this->getAll("1=1 order by cruise_destination_id desc");
		return intval($res[0]['cruise_destination_id'])+1;
	}*/
	function checkExist($cruise_id, $destination_id){
		$res = $this->getAll("cruise_id='$cruise_id' and destination_id='$destination_id' limit 0,1");
		return (!empty($res))?1:0;
	}
	function getByDestination($cruise_id,$destination_id){
		$all=$this->getAll("is_trash=0 and cruise_id='$cruise_id' and destination_id='$destination_id' order by ".$this->pkey." limit 0,1");
		return $all[0][$this->pkey];
	}
	function getDesIti($cruise_id,$itinerary_id){
	    $clsCity = new City();
		$all=$this->getAll("is_trash=0 and cruise_id='$cruise_id' and cruise_itinerary_id='$itinerary_id' order by order_no",$this->pkey.',city_id');
		$des_text = '';
		if($all!=''){
			foreach($all as $key =>$al){
				$name_city = $clsCity->getTitle($al['city_id']);
				if($key == 0){
					$des_text .= $name_city;
				}else{
					$des_text .= ', '.$name_city;
				}
	
			}
			return trim($des_text,', ');
		}
	}
}