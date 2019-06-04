<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Crud_model extends CI_Model
{
    public $db_table_structure;
    public $db_table_name;
    public $is_custom_form;
    public $short_code;
    public $cruds;
    public $pry_key;
    public $is_active_field;
    public $is_delete_field;
    
   public function __construct($short_code = '') { 
        
        parent::__construct(); 
        
        if(!empty($short_code)) {
            $this->cruds = $this->getCrudMastersDataByShortCode($short_code);
        }

        $this->db_table_structure = array();

        $this->pry_key = 'id';

        $this->is_active_field = 'is_active';

        $this->is_delete_field = 'is_delete';
    }
    
    public function set_table_name($table_name) {
        $this->db_table_name = !empty($table_name) ? $table_name : $this->cruds['table_name'];
    }
    
    public function setdata($short_code) {
        $this->cruds = $this->getCrudMastersDataByShortCode($short_code);
        $this->db_table_name = $this->cruds['table_name'];
        $this->is_custom_form = $this->cruds['is_custom_form'];
        $this->short_code = $short_code;
    }
    
    public function getdata() {
        return $this->cruds;
    }
    
    public function get_db_tables() {

        $db_tables = $this->db->query("SELECT * FROM INFORMATION_SCHEMA.TABLES "
                . "WHERE TABLE_SCHEMA = '".$this->db->database."' AND TABLE_NAME NOT LIKE('crud_%') AND TABLE_NAME NOT LIKE('am_%') ")
                ->result_array();    
        
        if(is_array($db_tables)){
            foreach ($db_tables as $key => $tableInfo) {
                $dbtables[$tableInfo['TABLE_NAME']] = $tableInfo;
            }
        }
        return $dbtables;
    }
    
    
    public function get_table_structure() {

        if (empty($this->db_table_name))
            return false;
        
        $result = $this->db->query('DESCRIBE ' . $this->db_table_name)
                ->result_array(); 
        
        return ($result) ? $result : FALSE;
    }
    
    public function get_table_records() {
        
        $result = $this->db->get($this->db_table_name)->result_array();
                
        return $result;
    }
    
    //Generate Crud Master Form
    public function createCrudMasterForm($db_table_name='') {
        
        $this->db_table_name = $db_table_name ? $db_table_name : $this->db_table_name;
        
        $this->db_table_structure = $this->get_table_structure();
        
        if (is_array($this->db_table_structure)) {

            $am_form['table_name'] = $this->db_table_name;
            $am_form['short_code'] = $this->db_table_name;
            $am_form['form_title'] = $this->crud->_to_label($this->db_table_name);
            
            //If Table Name Exist In `crud_masters` Record List.
            $am_id = $this->_exists_crud_form($this->db_table_name);
           
            if($am_id){
                
                return $this->insertElements($am_id);
                
            } else {
            
                $search_fields = '';

                foreach($this->db_table_structure as $table) { 

                    if (isset($table['key']) && $table['key'] == 'PRI') {

                        $am_form['id_field'] = $this->db_table_name;
                    }

                    if (isset($table['Field'])) { 

                        $am_extra = $this->_set_am_extra($table['Field']);

                        if ($am_extra != 'general') {

                            $am_form[$am_extra . '_field'] = $am_extra;
                        }

                        if (in_array(substr($table['Type'], 0, 4), ['varc', 'text', 'char'])) {

                            $search_fields[] = $table['Field'];
                        }
                    }
                }//end foreach

                if (is_array($search_fields)) {

                    $am_form['search_fields'] = join(',', $search_fields);
                } 

                $this->db->insert(CRUD_MASTERS, $am_form); 
                $am_id = $this->db->insert_id();
                return $this->insertElements($am_id);
                
            }//endelse.
            
        }//end if       
    }

    public function insertElements($am_id) { 

        $am_elements['am_id'] = $am_id;

        $am_elements['am_table_name'] = $this->db_table_name;
        
        $am_elements['short_code'] = $this->db_table_name;
        
        $am_elements['is_custom_field'] = 0;

        $elements = $index = 0;
        
        $defineField = ['char'=>'text', 'varchar'=>'text', 'text'=>'editor', 'int'=>'text', 'tinyint'=>'text', 'time'=>'timepicker', 'date'=>'date', 'datetime'=>'datetime', 'enum'=>'radio' ];
        
        
        foreach ($this->db_table_structure as $table) {

            $am_elements['field_name'] = $table['Field'];

            $am_elements['field_label'] = $this->crud->_to_label($table['Field']);
            
            
            //Check Elements is exists or not.
            if($this->_crud_element_exists($am_elements['field_name'])){
                //If Elements Exists In Element Table then ignore this element.
                $elements++;
                continue;
            }
            
            $TypeArr = explode('(', $table['Type']);
            
            if(is_array($TypeArr)) {
                
                $am_elements['data_type']       =  $TypeArr[0];
                
                $am_elements['data_type_size']  = (isset($TypeArr[1]))  ? addslashes( str_replace(["(",")"," ","unsigned" ], '',  $TypeArr[1])) : '';
                 
                if($am_elements['data_type']=='enum') {
                    
                    $static_options_arr = [];
                    $enumOptions = str_replace(["(",")","'"], '', stripslashes($am_elements['data_type_size']));
                    $enumOptionsArr = explode(',', $enumOptions);
                    
                    foreach($enumOptionsArr as $key => $value) {
                        
                        $valueKey = $value;
                        if($value=='1') $valueKey = 'Yes';
                        if($value=='0') $valueKey = 'No'; 
            
                        $static_options_arr[$valueKey] = ucfirst($value);
                    }//end foreach.
                    
                    $am_elements['static_dropdown_options'] = addslashes(json_encode($static_options_arr));
                } else {
                    $am_elements['static_dropdown_options'] = null;
                }                
            } else {
                $am_elements['data_type'] =  $table['Type'];
            }
            
            $am_elements['placeholder'] = $this->crud->_to_label($table['Field']);
            
            if(in_array( $am_elements['data_type'], ['char', 'varchar', 'int', 'float', 'text'] )) {
                $am_elements['maxlength'] = $am_elements['data_type_size'];
                
            } else {
                $am_elements['maxlength'] = '';
            }
            
            $field_type  = ( in_array($am_elements['data_type'], $defineField) ) ? $defineField[$am_elements['data_type']] : 'text';
           
            $am_elements['field_type'] = ($table['Key'] == 'PRI') ? 'hidden' : $field_type;
            
            $am_elements['validation_rules'] = '';

            $is_primary_key  = ($table['Key'] == 'PRI') ? 1 : 0;
            $am_elements['is_primary_key']  = $is_primary_key;

            $am_elements['default_value']   = $table['Default'];
            
            $include_in_insert = ($table['Key'] == 'PRI') ? 0 : 1;
            
            $am_elements['include_in_insert'] = $include_in_insert;

            $am_elements['include_in_update'] = 1;
            
            $am_elements['display_in_list']  = 1;

            $can_update = ($table['Key'] == 'PRI') ? 0 : 1;
            $am_elements['can_update']       = $can_update;

            $status_in_insert = ($table['Key'] == 'PRI') ? 'none' : 'active';
            $am_elements['status_in_insert'] = $status_in_insert;

            $status_in_update = ($table['Key'] == 'PRI') ? 'hidden' : 'active';
            $am_elements['status_in_update'] = $status_in_update;

            $am_extra    = ($table['Key'] == 'PRI') ? 'id' : $this->_set_am_extra($table['Field']);
            $am_elements['am_extra']         = $am_extra;

            $am_elements['form_field_order'] = ++$index;

            if (in_array(substr($table['Type'], 0, 4), ['varc', 'text', 'char'])) {
                $am_elements['is_search_option'] = 1;
            } else {
                $am_elements['is_search_option'] = 0;
            }
            
            $am_elements['is_foreign_key']  = 0;
            
            $this->db->insert(CRUD_ELEMENTS, $am_elements);
            
            if ($this->db->insert_id()) 
            {
                $elements++;
            } else {
                echo $this->sql_error;
            }
            
        }//end foreach 
           
        return $elements;
    }
    
    private function _exists_crud_form($short_code) {
        
        $result = $this->db->select('id, short_code')
                ->get_where(CRUD_MASTERS, ['short_code' => $short_code])
                ->result_array();
         
        if(empty($result)) return false;
      
        if(is_array($result[0])){
            
            return $result[0]['id'];
        }
        
        return false;
    }    
    
    private function _crud_element_exists($fieldName){
        
        if(empty($fieldName)) return false;
        
        $result = $this->db->select('id')
                    ->where( ['am_table_name'=>$this->db_table_name , 'field_name' => $fieldName] ) 
                    ->get(CRUD_ELEMENTS);
        
        return $result->num_rows();
        
    }
    
    
    public function isCrudMasterTable() {

        return $this->_exists_crud_form($this->db_table_name);
       
    }

    public function updateElements($requestData) {
        
            extract($requestData);  
            //print_r($requestData);
            $result['status'] = 'SUCCESS';
        
            $am_elements['field_label']         = $field_label;

            $am_elements['field_type']          = $field_type;

            $am_elements['validation_rules']    = $validation_rules;
            
            $am_elements['is_required']         = $is_required;

            $am_elements['is_foreign_key']      = $is_foreign_key;
            
            
            $am_elements['foreign_table_name']  = $am_elements['foreign_value_field']  =  $am_elements['foreign_label_field']  = '';
            
            if($is_foreign_key){
                $am_elements['foreign_table_name']      = $foreign_table_name;  
                $am_elements['foreign_value_field']     = $foreign_value_field; 
                $am_elements['foreign_label_field']     = $foreign_label_field;
            }
            
            if(in_array($field_type, ['select','radio','checkbox']) && $is_foreign_key == 0){
                
                if($static_dropdown_options_type == 'array') {                    
                    if(!empty($soids)){
                        $soidsArr = explode(',', $soids);
                        foreach($soidsArr as $soid){
                            if($soid == 0) continue;
                             
                            $so_label[$soid] = trim($requestData['static_option_label_' . $soid]); 
                            $so_value[$soid] = trim($requestData['static_option_value_' . $soid]); 

                            if( $so_label[$soid]=='' ||  $so_value[$soid]=='')
                            {
                                $result['status'] = 'ERROR';
                                $result['msg'].= '<li>Please fill the static options '.$soid.' row.</li>';
                            } else {
                               $soArray[$so_value[$soid]] = $so_label[$soid];
                            }                            
                        }//end foreach.
                        
                        $am_elements['static_dropdown_options'] = json_encode($soArray);
                        
                    } else {
                        $result['status'] = 'ERROR';
                        $result['msg']   .= '<li>Please enter the static options.</li>';
                    }                    
                }
                if($static_dropdown_options_type == 'json') {
                    
                    if($static_dropdown_options_json == ''){
                        $result['status'] = 'ERROR';
                        $result['msg']  .= '<li>Please enter the static options json format.</li>';
                    }
                    elseif(!is_object(json_decode($static_dropdown_options_json))){
                        $result['status'] = 'ERROR';
                        $result['msg'] .= '<li>Static options json is invalid.</li>';
                    } else {
                        $am_elements['static_dropdown_options'] = $static_dropdown_options_json;
                    }//end else
                }//end if.
            }

            $am_elements['default_value']       = $default_value;

            $am_elements['include_in_insert']   = $include_in_insert;

            $am_elements['include_in_update']   = $include_in_update;

            $am_elements['display_in_list']     = $display_in_list;

            //$am_elements['can_update']        = $can_update;

            $am_elements['status_in_insert']  = $status_in_insert;

            $am_elements['status_in_update']  = $status_in_update;

            $am_elements['am_extra']          = $am_extra;

            $am_elements['form_field_order']  = $form_field_order;

            $am_elements['is_search_option']  = $is_search_option;
            
            $am_elements['is_filters_option'] = $is_filters_option;
            
            $am_elements['is_sorting_option'] = $is_sorting_option;
            
            $am_elements['maxlength'] = $maxlength;
            
            $am_elements['minlength'] = $minlength;
            
            $am_elements['placeholder']   = $placeholder;
            
            $am_elements['other_attributes'] = $other_attributes;
            
            
            if($result['status'] === 'SUCCESS') { 
            
            
               $update = $this->db->update(CRUD_ELEMENTS, $am_elements, ['id' => $id]);
               
                if(!$update) {
                    
                    $result['status'] = 'ERROR'; 
                    $result['msg'] = $this->db->_error_message();
                } else {
                    $result['msg'] = "Submit successfully!";
                }
            }
           
            return $result;
    }
     
    public function getAdminMasterElements($id = '') {
        $this->getCrudFormElements($id);
    }
    
    public function getCrudFormElements($id = '') {

        $whereArr = (!empty($id)) ? ['id' => $id] : ['short_code' => $this->short_code];
        
        $result = $this->db->get_where(CRUD_ELEMENTS, $whereArr )
                //->order_by('form_field_order', 'ASC')
                ->result_array();
            
        if(empty($result)) return false;
      
        if(is_array($result)){
            
            return $result;
        }
        
        return false;
    }
    
    public function getAdminMastersFormList() {
        
        $result = $this->db->select('id', 'table_name')
                ->get_where(CRUD_MASTERS,  ['is_active' => 1] )
                ->order_by('table_name', 'ASC')
                ->result_array();

        if(empty($result)) return false;
        
        if(is_array($result)){
            foreach ($result as $key => $tablename) {
                $tableArr[$tablename['id']] = $tablename['table_name'];
            }
            
            return $tableArr;
        }
    } 
    
    public function getCrudMastersDataByShortCode($short_code) {
        
        $result = $this->db->select('id, table_name, short_code, form_title, action_controller, insert_method, update_method, list_method, is_custom_form, is_active')               
                ->get_where(CRUD_MASTERS, ['short_code' => $short_code] )
                ->result_array();
        
       if(is_array($result) && !empty($result)){
            
            return $result[0];
        }
        
        return false;
    } 
    
    public function getCrudCustomForm() {
        
        $result = $this->db->select('id, table_name, short_code, form_title, action_controller, insert_method, update_method, list_method, is_custom_form, is_active')               
                ->get_where(CRUD_MASTERS, ['is_custom_form' => 1] )
                ->result_array();
        
       if(is_array($result) && !empty($result)){
            foreach ($result as $key => $row) {
                $tableArr[$row['short_code']] = $row;
            }
            
            return $tableArr;
        }
        
        return false;
    } 
    
    public function getCustomFormElements($short_code) {
        
        $short_code = !empty($short_code) ? $short_code : $this->cruds['short_code'];
        
        $whereArr = ['short_code' => $short_code];
        
        $result = $this->db->get_where(CRUD_ELEMENTS, $whereArr )
                //->order_by('form_field_order', 'ASC')
                ->result_array();
            
        if(empty($result)) return false;
      
        if(is_array($result)){
            
            return $result;
        }
        
        return false;
    }
    
    public function getMastersList() {
        
        $result = $this->db->select('id, table_name, short_code, form_title, is_custom_form, action_controller, insert_method, update_method, list_method, is_custom_form, is_active')               
                ->order_by('table_name', 'ASC')
                ->get(CRUD_MASTERS)
                ->result_array();
        
       if(is_array($result) && !empty($result)){
            foreach ($result as $key => $tablename) {
                $tableArr[$tablename['id']] = $tablename;
            }
            
            return $tableArr;
        }
        
        return false;
    } 
    
    public function getElementInfo($fieldName='', $selects=''){
        
        if(empty($selects)) {
            $selects = 'id, data_type, validation_rules, default_value, field_name';
        }
        
        $where['short_code'] = $this->short_code;
        
        if(!empty($fieldName)){
            $where['field_name'] = $fieldName;
        }
        
        $result = $this->db->select($selects)                                   
                    ->limit(1)  
                    ->get_where( CRUD_ELEMENTS, $where ) 
                    ->result_array();
        
        if(is_array($result) && !empty($result[0])){
            
           return $result[0];
        }
        
        return false;
    }
   
    public function getFormElementTypeCount() {
        
        $result = $this->db->select('field_type, COUNT(id) as num')
                            ->group_by('field_type')
                            ->order_by('field_type', 'asc')
                            ->get_where(CRUD_ELEMENTS,  ['short_code' => $this->short_code])
                            ->result_array();
        
            
        if(empty($result)) return false;
        
        if(is_array($result)){
            $curdElements = [];
            foreach ($result as  $arr) {
                
                if($arr['field_type']=='') continue;
                
                $curdElements[$arr['field_type']] = $arr['num'];
            }
        }
       
        return $curdElements;
    }
    
    public function getCURDElements($curd_type) {

        switch ($curd_type) {

            case 'insert':

                $whereCondition = ['short_code' => $this->short_code, 'include_in_insert' => '1'];

                break;

            case 'update':

                $whereCondition = ['short_code' => $this->short_code, 'include_in_update' => '1'];

                break;

            case 'display':

                $whereCondition = ['short_code' => $this->short_code, 'display_in_list' => '1'];

                break;

            default:

                $whereCondition = ['short_code' => $this->short_code];

                break;
        }//end switch.

        $result = $this->db->order_by('form_field_order', 'asc') 
                                ->get_where(CRUD_ELEMENTS, $whereCondition )
                                ->result_array();
        
         
        if(is_array($result)){
            
            $resultArr = [];
            
            foreach ($result as $key => $arr) {
                
                $resultArr[$arr['field_name']]=$arr;
                
            }
            
            return  $resultArr;
        }
            
        
        return false;
       
    }

    
    
 /* 
    public function getValidationRules($string = '') {
  
        if (empty($string))
            return false;
        return '';
    }
    
    public function crudFormSubmit( $postData) {
            
        $crudSubmit = $postData['crud_submit'];
        unset($postData['crud_submit']);
        
        switch ($crudSubmit) {
            case 'insert':

                $this->crudFormInsert($postData);
                break;
            case 'update':

               // $this->crudFormUpdate($postData);
                break;

            default:
                break;
            
        }//end switch. 
        
    }
      
    public function crudFormInsert(array $postData) {
        
        foreach ($postData as $fieldName => $fieldValue) {
           if($fieldValue=='') {
              $fieldValue = $this->haveDefaultValue($fieldName);
              if($fieldValue === false) continue;
           }
            $insertData[$fieldName] = $fieldValue;
            
        }//end foreach.
        
       
        if($insert_id = $this->db->insert($this->db_table_name, $insertData)) 
        {
            return $insert_id;
        } else {
            echo $this->sql_error;
            return false;
        }
    }
     
    
    
    

   
*/
    
    
    /**
     * 
     * @param string $string
     * @return string
     */
    public function _set_am_extra($string) {

        return (in_array($string, $this->get_am_extra())) ? $string : 'general';
    }
    
    /**
     *       
     * @return array
     */
    public function get_am_extra() {

        return ['is_active', 'is_delete', 'created_at', 'updated_at', 'deleted_at'];
    }


}
