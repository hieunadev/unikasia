<?php
class DbBasic{
	var $pkey 			= 	"";
	var $tbl 			= 	"";	
	var $arrCond 		= 	array();
	var $arrOperator 	=	array();
	var $arrError 		= 	array();
	var $hasError 		= 	0;
	var $objName		=	"ObjTable";
	var $arrQuery		= 	array();
	var $arrResult		= 	array();
	function __construct(){
		// Some code
	}
	function updateDataPosition($pvalTable,$direct,$_dataload){
		$one = $this->getOne($pvalTable);
		$pkeyTable = $this->pkey;
		$order_no = $one['order_no'];
		$where = "is_trash=0";
		if($_dataload!=''){
			$where .= " and ".$_dataload;
		}
		if($direct=='up'){
			$lst = $this->getAll($where." and order_no < $order_no order by order_no desc limit 0,1");
			if($lst[0][$pkeyTable]!=''){
				$this->updateOne($pvalTable,"order_no='".$lst[0]['order_no']."'");
				$this->updateOne($lst[0][$this->pkey],"order_no='".$order_no."'");
			}
		}
		if($direct=='down'){
			$lst = $this->getAll($where." and order_no > $order_no order by order_no asc limit 0,1");
			if($lst[0][$pkeyTable]!=''){
				$this->updateOne($pvalTable,"order_no='".$lst[0]['order_no']."'");
				$this->updateOne($lst[0][$this->pkey],"order_no='".$order_no."'");
			}
		}
		if($direct=='bottom'){
			$lst = $this->getAll($where." and order_no > $order_no order by order_no desc LIMIT 0,1");
			if($lst[0][$pkeyTable]!=''){
				$this->updateOne($pvalTable,"order_no='".$lst[0]['order_no']."'");
				$lst = $this->getAll($where." and $pkeyTable <> '$pvalTable' and order_no > $order_no order by order_no DESC");
				for($i=0;$i<count($lst);$i++) {
					$this->updateOne($lst[$i][$this->pkey],"order_no='".($lst[$i]['order_no']-1)."'");	
				}
			}
		}
		if($direct=='top'){
			$lst = $this->getAll($where." and order_no < $order_no order by order_no ASC LIMIT 0,1");
			if($lst[0][$pkeyTable]!=''){
				$this->updateOne($pvalTable,"order_no='".$lst[0]['order_no']."'");
				$lst = $this->getAll($where." and $pkeyTable <> '$pvalTable' and order_no < $order_no order by order_no asc");
				for($i=0;$i<count($lst);$i++) {
					$this->updateOne($lst[$i][$this->pkey],"order_no='".($lst[$i]['order_no']+1)."'");	
				}
			}
		}
		return 1;
	}
	function createTableDB($sqlCreate,$sqlInit_f,$sqlInit_v){
		global $dbconn;
		$sqlExist="SELECT * FROM ".$this->tbl;
		$result =  $dbconn->Execute($sqlExist);
		$tblName = str_replace(DB_PREFIX,'',$this->tbl);
		#
		if (!$result){
			$sqlCreate = "CREATE TABLE ".DB_PREFIX.$tblName."(						
						".$sqlCreate.",PRIMARY KEY(".$this->pkey.")) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8";
			$dbconn->Execute($sqlCreate);
			/*Create Init Row*/
			if($sqlInit_f!=''&&$sqlInit_v!='')
				$this->insertOne($sqlInit_f,$sqlInit_v);
			return 1;
		} else{								
			return 2;
		}		
		return 0;
	}	
	function getMaxId(){
		global $dbconn;
		$sql = "SELECT distinct ".$this->pkey." FROM ".$this->tbl." where 1=1 order by ".$this->pkey." desc LIMIT 0,1";
		$this->arrResult = $dbconn->GetAll($sql);
		return intval($this->arrResult[0][$this->pkey])+1;
	}
	function getMaxOrderNo(){
		global $dbconn;
		$stime = array_sum(explode(' ',microtime()));
		$sql = "SELECT distinct order_no FROM ".$this->tbl." where 1=1 order by order_no desc LIMIT 0,1";
		$this->arrResult = $dbconn->GetAll($sql);
		#Time execute
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,'time'	=> $time
		));
		return !empty($this->arrResult) ? intval($this->arrResult[0]['order_no'])+1 : 1;
	}
	function getOneField($field,$item_id){
		global $dbconn;
		$stime = array_sum(explode(' ',microtime()));
		$sql = "SELECT distinct ".$field." FROM ".$this->tbl." where ".$this->pkey."=".$item_id." LIMIT 0,1";
		$this->arrResult = $dbconn->GetAll($sql);
		#Time execute
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,
			'time'	=> $time
		));
		return !empty($this->arrResult) 
			? $this->arrResult[0][$field] 
			: false;
	}
	function getImageUrl($_pval){
		return $this->getOneField('image',$_pval);
	}
	//Set debug mode On/Off
	function SetDebug($debug=true){
		global $dbconn;
		$dbconn->debug = $debug;
	}
	//set condition $cond + $operator(AND, OR)
	function SetCond($cond, $operator=""){
		array_push($this->arrCond, $cond);
		array_push($this->arrOperator, $operator);
	}
	//get contition string
	function GetCond(){
		$condStr = "";
		if (is_array($this->arrCond)){
			foreach ($this->arrCond as $key => $val){
				$condStr.= " $val ".$this->arrOperator[$key];
			}
		}
		return $condStr;
	}
	//empty condition
	function EmptyCond(){
		$this->arrCond = array();
	}
	//Select One
	function SelectOne($_pkey=""){
		global $dbconn;		
		//get condition
		$cond = $this->getCond();
		if ($cond==""){
			$pkey = $this->pkey;
			$pkeyvalue = $_pkey;
			$cond = ($pkeyvalue!="")? "".$pkey."='".$pkeyvalue."'" : "";
		}
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$sql = "SELECT * FROM ".$this->tbl." $where";
		$dbconn->debug =true;
		$rs = $dbconn->Execute($sql); 
		$obj = new $this->objName;
		if ($rs){
			$arr = $rs->FetchRow();//get a row
			if (is_array($arr)){
				foreach ($arr as $key => $val){
					$obj->set($key, $val);
				}  		
			}
		}
		return $obj;		
	}
	//Select All
	function SelectAll($orderby="", $start=0, $limit=0){
		global $dbconn;
		//get condition
		$cond = $this->getCond();
		$where = ($cond!="")? " WHERE $cond" : "";
		$orderby = ($orderby!="")? "ORDER BY $orderby" : "";
		$limit = ($limit!="")? "LIMIT $start, $limit" : "";
		$sql = "SELECT * FROM ".$this->tbl." $where $orderby $limit";
		$rs = $dbconn->Execute($sql); 
		$arrObj = array();
		if ($rs){
			while ($arr = $rs->FetchRow()) { 
				$obj = new $this->objName; 
				foreach ($arr as $key => $val){
					$obj->set($key, $val);
				}  	
				array_push($arrObj, $obj);	
			} 
		}
		return $arrObj;				
	}
	//Insert obj
	function insert_query($objTable){
		global $dbconn;
		$class_vars = get_class_vars(get_class($objTable));
		$fields = $values = array();
		foreach ($class_vars as $name => $value) {
			array_push($fields, $name);
			array_push($values, $objTable->$name);
		}
		$sql  = "INSERT INTO ".$this->tbl."($fields) VALUES($values)";
		if (!$dbconn->Execute($sql)){
			trigger_error("Cannot run SQL: `$sql`", E_USER_ERROR);
			return 0;
		}		
		return 1;
	}
	//Update obj
	function update_query($objTable){
		global $dbconn;
		$class_vars = get_class_vars(get_class($objTable));
		$set = "";
		foreach ($class_vars as $name => $value) {
			$set = ($set=="")? "$name = '".$this->$name."'" : ", $name = '".$objTable->$name."'";
		}
		//get condition
		$cond = $obj->getCond();
		if ($cond==""){
			$pkey = $this->pkey;
			$pkeyvalue = $this->$pkey;
			$cond = ($pkeyvalue!="")? "".$pkey."='".$pkeyvalue."'" : "";
		}
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$sql = "UPDATE ".$this->tbl." SET $set $where";
		if (!$dbconn->Execute($sql)){
			trigger_error("Cannot run SQL: `$sql`", E_USER_ERROR);
			return 0;
		}
		return 1;				
	}
	//Delete obj
	function delete_query(){
		global $dbconn;
		//get condition
		$cond = $this->getCond();
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$sql = "DELETE FROM ".$this->tbl." $where";
		if (!$dbconn->Execute($sql)){
			trigger_error("Cannot run SQL: `$sql", E_USER_ERROR);
			return 0;
		}
		return 1;		
	}
	function Count($cond=""){
		global $dbconn;
		$sql = "SELECT COUNT(1) AS total FROM ".$this->tbl;
		//get condition
		$cond = $this->getCond();
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$res = $dbconn->GetRow($sql);
		if ($res['total']=="" || $res['total']==null)
			return 0;
		return $res['total'];
	}
	function Max($field, $cond=""){
		global $dbconn;
		$sql = "SELECT MAX($field) AS total FROM ".$this->tbl;
		//get condition
		$cond = $this->getCond();
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$res = $dbconn->GetRow($sql);
		if ($res['total']=="" || $res['total']==null)
			return 1;
		return ($res['total']+1);
	}
	function Sum($field, $cond=""){
		global $dbconn;
		$sql = "SELECT SUM($field) AS total FROM ".$this->tbl;
		//get condition
		$cond = $this->getCond();
		if ($cond!=""){
			$where .= " WHERE $cond";
		}
		$res = $dbconn->GetRow($sql);
		if ($res['total']=="" || $res['total']==null)
			return 0;
		return $res['total'];
	}
	//Execute a sql
	function ExecSql($sql){
		global $dbconn;
		return $dbconn->Execute($sql);
	}
	function checkColumnInTable($column_name){
		global $dbconn;
		$sql = "SHOW COLUMNS FROM `{$this->tbl}` LIKE '$column_name'";
		$lstTbl = $dbconn->GetAll($sql);
		return !empty($lstTbl) && $lstTbl[0][0]==$column_name ? 1: 0;
	}
	function getAll($cond="", $field="*"){
		global $dbconn,$_LANG_ID;
		
		$where = "";
		$stime = array_sum(explode(' ',microtime(true)));
		if(MULTIPLE_LANG){
			if($this->checkColumnInTable('lang_id')){
				$clsConfiguration = new Configuration();
				$SiteDefaultLanguage = $clsConfiguration->getValue('SiteDefaultLanguage',LANG_DEFAULT);
				if(!empty($_LANG_ID) && $_LANG_ID!=$SiteDefaultLanguage){
					$where .= " WHERE lang_id='{$_LANG_ID}' ";
				}else{
					$where .= " WHERE lang_id='' ";
				}
			}
		}
		if (!empty($cond)){
			if ($where!=""){
				$where .= " and {$cond}";
			}else{
				$where .= " WHERE {$cond}";
			}
		}
		#
		$sql = "SELECT  ".$field." FROM ".$this->tbl." {$where}";
		$this->arrResult = $dbconn->GetAll($sql);
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,
			'time'	=> $time
		));
		return !empty($this->arrResult) 
			? $this->arrResult 
			: false;
	}
	function getAllOptimize($cond="", $innerjoin="", $field="*", $debug=false){
		global $dbconn,$_LANG_ID;
		
		$hasCond = false;
		if(MULTIPLE_LANG){
			if($this->checkColumnInTable('lang_id')){
				$hasCond = true;
				$clsConfiguration = new Configuration();
				$SiteDefaultLanguage = $clsConfiguration->getValue('SiteDefaultLanguage',LANG_DEFAULT);
				if($_LANG_ID != $SiteDefaultLanguage){
					$this->condStr = "{$this->tbl}.lang_id='{$_LANG_ID}'";
				}else{
					$this->condStr = "{$this->tbl}.lang_id=''";
				}
			}
		}
		if(!empty($cond)){
			$this->condStr .= ($hasCond ? " and " : "") . $cond;
			$hasCond = true;
		}
		
		$where = "";
		if($hasCond == true){
			$where .= " WHERE {$this->condStr}";
		}
		$sql = "SELECT {$field} FROM {$this->tbl}";
		if($innerjoin) $sql .= " INNER JOIN {$innerjoin}";
		if($where) $sql .= $where;
		$this->arrResult = $dbconn->GetAll($sql, $debug);
		return !empty($this->arrResult) 
			? $this->arrResult : false;
	}
	function tokenizeOrderby($input, $default_ordering = "ASC"){
		$field_separator = ",";
		$field_begin = "`";
		$field_end = "`";
		$seg_qualifier = ".";
		$qualifier = $field_end . $seg_qualifier . $field_begin;
		$order_up_rev = "CSA ";
		$order_down_rev = "CSED ";
		if ($default_ordering) {
			$default_ordering = trim($default_ordering);
		} else {
			$default_ordering = "ASC";
		}
		$default_ordering_rev = strrev(" " . $default_ordering);
		if ($default_ordering_rev != $order_up_rev && $default_ordering_rev != $order_down_rev) {
			$default_ordering_rev = $order_up_rev;
		}
		$tokenizedFields = array();
		$i = 0;
		for ($field = strtok($input, $field_separator); $i < 30 && $field !== false; $i++) {
			$field = trim($field);
			if (!$field) {
				continue;
			}
			while (strpos($field, $field_begin) === 0) {
				$field = substr($field, 1);
			}
			$rev_field = strrev($field);
			$ordering_field_rev = "";
			if (strpos($rev_field, $order_up_rev) === 0) {
				$ordering_field_rev .= $order_up_rev;
				$rev_field = substr($rev_field, strlen($order_up_rev));
			} else {
				if (strpos($rev_field, $order_down_rev) === 0) {
					$ordering_field_rev .= $order_down_rev;
					$rev_field = substr($rev_field, strlen($order_down_rev));
				} else {
					$ordering_field_rev .= $default_ordering_rev;
				}
			}
			while (strpos($rev_field, $field_end) === 0) {
				$rev_field = substr($rev_field, 1);
			}
			$field = strrev($rev_field);
			$field_parts = explode($qualifier, $field, 2);
			$safe_field_parts = array();
			foreach ($field_parts as $key => $part) {
				$safe_field_parts[] = $part;
			}
			if (1 < count($safe_field_parts)) {
				$field = implode($qualifier, $safe_field_parts);
			} else {
				$field = array_shift($safe_field_parts);
			}
			if ($field) {
				$tokenizedFields[] = $field_begin . $field . $field_end . strrev($ordering_field_rev);
			}
			$field = strtok($field_separator);
		}
		return $tokenizedFields;
	}
	function getOne($_pkey="", $field="*"){
		global $dbconn;
		$stime = array_sum(explode(' ',microtime(true)));
		$sql = "SELECT ".$field." FROM {$this->tbl} WHERE {$this->pkey}='{$_pkey}'";
		$this->arrResult = $dbconn->GetRow($sql);
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,
			'time'	=> $time
		));
		#
		return !empty($this->arrResult) 
			? $this->arrResult 
			: false;
	}
	function getByCond($cond="", $field="*"){
		global $dbconn,$_LANG_ID;
		$where = "";
		$stime = array_sum(explode(' ',microtime(true)));
		#multiple language
		if(MULTIPLE_LANG){
			if($this->checkColumnInTable('lang_id')){
				$clsConfiguration = new Configuration();
				$SiteDefaultLanguage = $clsConfiguration->getValue('SiteDefaultLanguage',LANG_DEFAULT);
				if($_LANG_ID!=$SiteDefaultLanguage && $_LANG_ID!=''){
					$where .= " WHERE lang_id='{$_LANG_ID}' ";
				}else{
					$where .= " WHERE lang_id='' ";
				}
			} 
		}
		#end multiple language
		if(!empty($cond)){
			if ($where!=""){
				$where .= " and {$cond}";
			}else{
				$where .= " WHERE {$cond}";
			}
		}
		$sql = "SELECT ".$field." FROM ".$this->tbl." {$where}";
		$this->arrResult = $dbconn->GetRow($sql);
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,
			'time'	=> $time
		));
		#
		return !empty($this->arrResult) ? $this->arrResult : false;
	}
	function _array_to_string($datastore, $paid=','){
		global $dbconn, $core;
		$x = 0; $set = "";
		foreach($datastore as $key => $value) {
			$set .= ($x==0 ? "" : (strpos($key, 'OR')===FALSE ? $paid : "")) . sprintf("%s=%s", $key, $dbconn->qstr($value));
			++$x;
		}
		return $set;
	}
	//Insert
	function insert($datastore=array()){
		global $dbconn, $_LANG_ID;
		if(empty($datastore)) 
			return false;
			
		$fields = implode(", ",array_keys($datastore));
		$x = 1;
		$values = "";
		foreach($datastore as $key=>$value){
			$values .= $dbconn->qstr($value);
			if($x < count($datastore)){
				$values .= ', ';
			}
			$x++;
		}
		#multiple language
		if(MULTIPLE_LANG){
			if($this->checkColumnInTable('lang_id')){
				$clsConfiguration = new Configuration();
				$SiteDefaultLanguage = $clsConfiguration->getValue('SiteDefaultLanguage',LANG_DEFAULT);
				if($_LANG_ID!=$SiteDefaultLanguage && $_LANG_ID!=''){
					$fields .= ",lang_id";
					$values .= ",'{$_LANG_ID}'";
				}
			} 
		}
		#end multiple language
		$sql = "INSERT INTO ".$this->tbl." ({$fields}) VALUES({$values})";
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	function insertOne($fields="", $values=""){
		global $dbconn,$_LANG_ID;
		#multiple language
		if(MULTIPLE_LANG){
			if($this->checkColumnInTable('lang_id')){
				$clsConfiguration = new Configuration();
				$SiteDefaultLanguage = $clsConfiguration->getValue('SiteDefaultLanguage',LANG_DEFAULT);
				if($_LANG_ID!=$SiteDefaultLanguage && $_LANG_ID!=''){
					$fields .= ",lang_id";
					$values .= ",'{$_LANG_ID}'";
				}else{
					$fields .= ",lang_id";
					$values .= ",''";
				}
			} 
		}
		#end multiple language
		$sql  = "INSERT INTO ".$this->tbl." ({$fields}) VALUES ({$values})"; //die($sql);

		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	//Update
	function update($_pkey, $datastore=array()){
		global $_CONFIG, $dbconn;
		if((int) $_pkey == 0 || empty($datastore)) 
			return false;
		
		$ADODB_QUOTE_FIELDNAMES = 'NATIVE';
		if($dbconn->autoExecute($this->tbl, $datastore, 'UPDATE', "{$this->pkey}='{$_pkey}'"))
			return true;
		return false;
	}
	function updateOne($_pkey="", $set="", $debug=false){
		global $dbconn;
		if($_pkey==0 || empty($set)) return;
		if(is_array($set)){
			$sql = "UPDATE {$this->tbl} SET ".$this->_array_to_string($set)." WHERE {$this->pkey}='{$_pkey}'";
		}else{
			$sql = "UPDATE ".$this->tbl." SET {$set} WHERE {$this->pkey}='{$_pkey}'";
		}
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	//Update by condition
	function updateByCond($cond="", $set=""){
		global $dbconn;
		
		$where = "";
		if(!empty($cond)){
			$where .= " WHERE $cond";
		}
		$sql = "UPDATE ".$this->tbl." SET {$set} {$where}";
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	//Delete
	function delete($datastore=array()){
		global $dbconn;
		if(empty($datastore)) return;
		
		$x = 0;
		$where = "";
		foreach($datastore as $key=>$value){
			$where .= ($x==(count($datastore)-1)?'':" and ")."$key=".$dbconn->qstr($value)."";
			++$x;
		}
		$sql = "DELETE FROM ".$this->tbl." WHERE {$where}";
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(), E_USER_ERROR);
		}
	}
	function deleteOne($_pkey=""){
		global $dbconn;
		#check vaidate parameter
		if($_pkey==0) return;
		
		$sql = "DELETE FROM ".$this->tbl." WHERE {$this->pkey}='{$_pkey}'";
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	function deleteByCond($cond=""){
		global $dbconn;
		#
		$where = "";
		if ($cond!=""){
			$where .= " WHERE {$cond}";
		}
		$sql = "DELETE FROM ".$this->tbl." {$where}";
		try{
			if($dbconn->Execute($sql))
				return 1;
			return 0;
		}catch(Exception $e){
			trigger_error('Error: '.$e->getMessage(),E_USER_ERROR);
		}
	}
	function countItem($cond=""){
		global $dbconn;
		$stime = array_sum(explode(" ",microtime()));
		
		$sql = "SELECT COUNT(*) AS totalitem FROM ".$this->tbl;
		if ($cond!=""){
			$sql.= "  WHERE {$cond}";
		}
		$this->arrResult = $dbconn->GetRow($sql);
		$time = array_sum(explode(" ",microtime())) - $stime;
		ObjQuery::addQuery(array(
			'query'	=> $sql,
			'time'	=> $time
		));
		return !empty($this->arrResult) 
			? $this->arrResult['totalitem'] 
			: 0;
	}
	function maxItem($field, $cond=""){
		global $dbconn;
		$sql = "SELECT MAX($field) AS total FROM ".$this->tbl;
		if ($cond!=""){
			$sql.= " WHERE $cond";
		}
		$res = $dbconn->GetRow($sql);
		if ($res['total']=="" || $res['total']==null)
			return 1;
		return ($res['total']+1);
	}
	function sumItem($field, $cond=""){
		global $dbconn;
		$sql = "SELECT SUM($field) AS total FROM ".$this->tbl;
		if ($cond!=""){
			$sql.= " WHERE {$cond}";
		}
		$res = $dbconn->GetRow($sql);
		if ($res['total']=="" || $res['total']==null)
			return 0;
		return $res['total'];
	}
	function getByField($pkey, $field){
		$res = $this->getOne($pkey);
		return $res[$field];
	}
}
class ObjTable{
	function __construct(){
	}
	function set($field, $value){
		$this->$field = $value;
	}
	function get($field){
		return $this->$field;
	}
}
class ObjQuery{
	public static $arrQuery	= array();
	
	public static function addQuery($query){
		self::$arrQuery[] = $query;
	}
	public function renderHTML(){
		$html = '';
		if(!empty(self::$arrQuery)){
			$html .= '<table class="tbl-grid table_ObjQuery hidden" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #DDD;">';
			for($i=0; $i<count(self::$arrQuery); $i++){
				$html .= '<tr>
					<td style="border:1px solid #DDD; padding:2px;">'.($i+1).'</td>
					<td style="border:1px solid #DDD; padding:2px;">'.(self::$arrQuery[$i]['query']).'</td>
					<td style="border:1px solid #DDD; padding:2px;">'.(self::$arrQuery[$i]['time']).'</td>
				</tr>';
			}
			$html .= '</table>';
		}
		return $html;
	}
}
class Query_Results {
	private static $arrQuery	 = 	array();
	private static $arrResult	 = 	array();
	public static function countItem($query, $field){
		global $dbconn;
		self::$arrResult = $dbconn->GetAll($query);
		return !empty(self::$arrResult) ? self::$arrResult[0][$field] : 0;
	}
}
?>
