<?php
class TourProperty extends dbBasic{
	function __construct(){
		$this->pkey = "tour_property_id";
		$this->tbl = DB_PREFIX."tour_property";
	}
	function getTitle($tour_property_id){
		$one = $this->getOne($tour_property_id,'title');
		return $one['title'];
	}
	function getSymbol($tour_property_id){
		$one = $this->getOne($tour_property_id,'symbol');
		return $one['symbol'];
	}
	function getIntro($tour_property_id){
		$one = $this->getOne($tour_property_id,'intro');
		return $one['intro'];
	}
	function getListType() {
		global $core;
        $listType = array();
		$listType['VISITORTYPE'] = $core->get_Lang('Adults - Children - Infants type');
		$listType['NATIONALITY'] = $core->get_Lang('nationality');
		$listType['MEAL'] = $core->get_Lang('Meals');
        return $listType;
    }
	function getNameType($selected = '') {
        $lstType = $this->getListType();
        return $lstType[$selected];
    }
    function getSelectType($selected = '') {
        global $core;
        #
        $listType = $this->getListType();
        $html = '<option value="0"> -- ' . $core->get_Lang('select') . ' -- </option>';
        foreach ($listType as $key => $val) {
            $html .= '<option value="'.$key.'" ' .($key==$selected?'selected="selected"':'').'> -- '.$val.' -- </option>';
        }
        return $html;
    }
	function doDelete($property_country_id){
		$clsISO = new ISO();
		#
		$this->deleteOne($property_country_id);
		return 1;
	}
}
?>