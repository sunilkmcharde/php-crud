<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Masters_model extends CI_Model
{        
    private $db_table_name;
    private $pry_key;
    private $form_action;
    private $uid;    
    private $masters_setting;
    
    public function __construct($tableInfo = array()) { 
        
        parent::__construct(); 

        $this->uid = isset($tableInfo['uid']) ? $tableInfo['uid'] : '';
    }
    
    public function setMastersDetails($shortcode, $action='') {
        
        if(empty($shortcode)) return false;
        
        $this->form_action = !empty($action) ? $action : 'view';
        
        $result = $this->db->get_where(CRUD_MASTERS, ['short_code' => $shortcode])
                ->result();
         
        
        if(!empty($result[0])){
            
            $this->masters_setting = $result[0];            
             
            $this->db_table_name = $this->masters_setting->table_name;

            $this->pry_key = $this->masters_setting->id_field;
            
            return $this->masters_setting ;
        }
        
        return false;
        
    }  
    
    public function set_table_name($tableName) {
        
        if(empty($tableName)) return false;
        
        $this->db_table_name = $tableName;
    }
    
    public function set_uid($id) {
        
        if(empty($id)) return false;
        
        $this->uid = $id;
    }
    
    public function insert($tablename, array $data) {
        
        $rec =   $this->db->insert($tablename , $data);
       
        return $rec;
    }
    
    public function update($tablename, array $where, array $data) {
        
                $this->db->where($where);
       $rec =   $this->db->update($tablename , $data);
       
       return $rec;
    }
    
    public function delete($tablename, array $where) {
        
                $this->db->where($where);
        $rec =  $this->db->delete($tablename);
        
        return $rec;
    }
    
    public function get_data($tablename, $where=array(), $select_fields='') {
        
        if(!empty($select_fields)) {
            $this->db->select($select_fields);
        }
        if(!empty($where)) {
            $this->db->where($where); 
        }
        
        $records = $this->db->get($tablename)->result();
        
        if(!empty($records)){
            return $records;
        } else {
            return false;
        }        
    }
    
    public function get_records() {
        
        $elementsArr = $this->get_master_elements_setting();
      
        $foreign_key = $static_dropdown = [];
        
        if(is_array($elementsArr) && !empty($elementsArr)){
           
           foreach ($elementsArr as $key => $element) {
               $selects[] = $element['field_name'];
               $data['title'][] = $element['field_label'];
               
                                    
                //Check If Dinamic Dropdown Fields
                 if($element['is_foreign_key']){

                     $foreign_key[]= $element['field_name'];            
                     $foreign_key_info[$element['field_name']]['label'] = $element['foreign_label_field'];
                     $foreign_key_info[$element['field_name']]['value'] = $element['foreign_value_field'];
                     $foreign_key_info[$element['field_name']]['table'] = $element['foreign_table_name'];
                 }

                 //Check If Static Dropdown Fields
                 if(!empty($element['static_dropdown_options']) && is_object(json_decode($element['static_dropdown_options']))){
                     $static_dropdown[] = $element['field_name']; 
                     $static_dropdown_options[$element['field_name']]  = json_decode($element['static_dropdown_options'], TRUE); 

                 }//end if static_dropdown_options
                
                if($element['am_extra'] == 'general') continue;
                $viewAction[$element['field_name']] =  $element['am_extra'];
            
           }
            
           $select_fields = join(',', $selects);
           
           $result = $this->db->select($select_fields)       
                ->get($this->db_table_name)
                ->result_array();
           
            if(is_array($result)) {
                foreach ($result as $key => $dataRow) {
            
                   /*
                    * Check table fields have any foreign_key.
                    */
                    if(!empty($foreign_key) && is_array($foreign_key)) {
            
                        foreach ($foreign_key as $key=>$foreign_key_field) {            
                           
                           //Get foreign_key Value by Id if Id greter than zero.
                            if($dataRow[$foreign_key_field] > 0) {
                                
                               $foreign_key_id = $dataRow[$foreign_key_field]; //Set foreign_key id
                               $foreign_tablename = $foreign_key_info[$foreign_key_field]['table'];  //Set foreign_key table name
                               $foreign_value_field = $foreign_key_info[$foreign_key_field]['value']; //Set foreign_key Id Fields
                               $foreign_label_field = $foreign_key_info[$foreign_key_field]['label']; //Set foreign_key Lable Fields
                               
                               //Get The Value by foreign_key id from foreign_table.
                               $dataRow[$foreign_key_field] = $this->getValueById($foreign_tablename, $foreign_label_field, $foreign_value_field , $foreign_key_id);
                                
                            } else {
                                //Set Blank if $foreign_key_id is zero
                               $dataRow[$foreign_key_field] = ''; 
                            }
                       }//end foreach                       
                    }//end if is foreign_key condition.                    
                    
                    /*
                     * Check if fields have static options (Static Combo Fields)
                     */
                    if(!empty($static_dropdown) && is_array($static_dropdown)) {
                        
                        foreach ($static_dropdown as $key=>$static_dropdown_field) {            
                           
                           //Get foreign_key Value by Id if Id greter than zero.
                            if(!empty($dataRow[$static_dropdown_field])) {
                                 
                                if(isset( $static_dropdown_options[$static_dropdown_field][$dataRow[$static_dropdown_field]])) {
                                    //Set The Value from static Options.
                                    $dataRow[$static_dropdown_field] = $static_dropdown_options[$static_dropdown_field][$dataRow[$static_dropdown_field]];
                                }
                            } else {
                                //Set Blank if $foreign_key_id is zero
                               $dataRow[$static_dropdown_field] = ''; 
                            }
                       }//end foreach  
                    }//end if is static dropdown field.
                    $masterData[] = $dataRow;
                    
                }//end foreach 
            
                return $masterData;
            
            } //end if.  
            
            return false;
            
        }//end if.
            
    }
    
    private function get_master_elements_setting() {
        
        switch ($this->form_action) {
            
            case 'insert':
            
                $whereArr['include_in_insert'] = '1';
                break;
            
             case 'edit':
            
                 $whereArr['include_in_update'] = '1';
                break;

            case 'view':                
            
                $whereArr['display_in_list']= '1';
                break;
            
        }//end switch
        
        $whereArr['am_table_name'] = $this->db_table_name;
        
        $result = $this->db->where($whereArr )                
                ->order_by('form_field_order', 'ASC')
                ->get(CRUD_ELEMENTS)
                ->result_array();
            
        if(is_array($result)) {
            return $result;
        }
        
        return false;
    }
        
    public function getValueById($foreign_tablename, $foreign_label_field, $foreign_value_field , $foreign_key_id) {        
        
        $result = $this->db->select($foreign_label_field)       
                ->get_where( $foreign_tablename, [$foreign_value_field=>$foreign_key_id] )
                ->result_array();            
        
        if(is_array($result[0]) && !empty($result[0])) {
            return $result[0][$foreign_label_field];
        } else {
            return false;
        }
        
    }
    
    public function getMediaElements() {
        
        $result = $this->db->select('field_name')       
                ->get_where( CRUD_ELEMENTS, ['field_type'=>'file', 'am_table_name'=>$this->db_table_name] )
                ->result_array();            
        
        if(is_array($result) && !empty($result)) {
            
            foreach ($result as $key => $arr) {
                $data[] = $arr['field_name'];
            }
            return $data;
        } else {
            return false;
        }
    }
    
     
}
