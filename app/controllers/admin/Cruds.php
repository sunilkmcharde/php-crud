<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cruds extends MY_Controller
{
    private $table_name;
    private $short_code;
    private $cruds;


    public function __construct() {
        
        parent::__construct(); 
        
        if(!$this->loggedIn) {
            redirect('admin/login');
        }
        
        $this->data['page_title'] = 'Cruds';
        
        $this->data['show_sidebar_right'] = True;
        
        $this->load->model('crud_model');
        
        $this->data['db_tables'] = $this->crud_model->get_db_tables();
        
        $this->data['crudCustomForms'] = $this->crud_model->getCrudCustomForm();
        
        $this->data['crudDbMasters'] = $this->crud_model->getMastersList();
                
        $this->short_code = $this->uri->segment(4);
        
        $this->crud_model->setdata($this->short_code);
        
        $this->cruds = $this->crud_model->getdata();
        
        if($this->short_code && !$this->cruds) { redirect(base_url('admin/cruds')); }
        
        $this->data['cruds'] = $this->cruds;
        
        $this->table_name = $this->cruds['table_name'];
        
        if(isset($this->short_code) && !empty($this->short_code)) {
            
            $this->data['short_code'] = $this->short_code;
            if(!$this->cruds['is_custom_form']){
                if($this->db->table_exists($this->table_name)){
                    $this->data['table_name'] = $this->table_name;
                } else {
                    $this->data['error_message'] = 'Database table "'. $this->db->database .'.'.$this->table_name.'" dose not exists.';
                    $this->page_construct('admin/cruds/settings_errors'); 
                }
            }
        }
        
        $this->data['formElementTypeArr'] = ['text','hidden','textarea', 'select', 'select_multiple','radio','checkbox','password','email','file','date','timepicker','datetime','daterange','range','number'];

    }
    
    public function index() {  
        
         $this->dbtables();
        
    }
    
    public function dbtables() {  
        
       if(is_array($this->data['crudDbMasters'])) {     
            foreach ($this->data['crudDbMasters'] as $table) {
                 $this->data['crudMastersList'][$table['short_code']] = $table['table_name'];
            }
        }
        
       $this->page_construct('admin/cruds/dbtables');
        
    }
    
    public function structure() {
            
        if($this->cruds['is_custom_form']) {
            $this->data['table_structure'] = $this->crud_model->getCustomFormElements($this->cruds['short_code']);
            $this->data['isCrudMasterTable'] = 0;
            $this->data['is_custom_form'] = 1;
           
            $this->page_construct('admin/cruds/custom_elements');
        } else {
            $this->data['table_structure'] = $this->crud_model->get_table_structure();
            $this->data['isCrudMasterTable'] = $this->crud_model->isCrudMasterTable();
            
            $this->page_construct('admin/cruds/structure');
        }         
    }
    
    public function generate() {
        
        $this->table_name = $this->uri->segment(4);
        
        if(!$this->table_name) { redirect(base_url('admin/cruds')); }
        
        $this->crud_model->set_table_name($this->table_name);
        
       if( $this->crud_model->createCrudMasterForm()) {
           
           redirect(base_url('admin/cruds/settings/'.$this->table_name));
       }
         
    }
        
    public function datalist() {
        
        $this->data['load_css'] = $this->getActiveCss('datatables');
        $this->data['load_js']  = $this->getActiveJs(['datatables','slimscroll','fastclick']);
        
        $this->data['active_jquery_datatable'] = true; 
        $this->data['datalist'] = $this->crud_model->get_table_records();
        
        $this->page_construct('admin/cruds/datalist');
    }
    
    public function insertdata() {
        
        if(isset($_POST['action'])){
            print_r($_POST);
            exit;
        }
        
        $this->data['load_css'] = $this->getActiveCss(['input_advance']);
        $this->data['load_js']  = $this->getActiveJs(['input_advance', 'custom']);
        
        $this->load->library('crud_elements');
        
        $this->crud_elements->set_table($this->table_name);
        
        $pageData['elementCount'] = $this->crud_model->getFormElementTypeCount();
        
        $objCURD = $this->crud_model->getCURDElements($action='');
        
        $pageData['displayElementSettings'] = false;
        
        $this->crud_elements->display_hidden_elements(true);        
        
        $pageData['crudForm'] = $this->crud_elements->curdForm($objCURD, $pageData['displayElementSettings']); 
        
        $this->page_construct('admin/cruds/insertdata' , $pageData);
            
    }
    
    public function settings() {
            
        $this->data['load_css'] = $this->getActiveCss(['input_advance']);
        $this->data['load_js']  = $this->getActiveJs(['input_advance', 'custom']);
        
        $pageData['crud_elements'] = $this->crud_model->getCrudFormElements();
        
        $this->page_construct('admin/cruds/settings', $pageData);
        
    }
    
    public function masterform() { 
        
        $action = (isset($_GET['act'])) ? $_GET['act'] : $this->uri->segment(5);
                
        $this->load->library('crud_elements');
        
        $this->crud_elements->set_table($this->table_name);
        
        $this->crud_elements->set_short_code($this->short_code);
        
        $pageData['elementCount'] = $this->crud_model->getFormElementTypeCount();
        
        $objCURD = $this->crud_model->getCURDElements($action);
        
        $pageData['displayElementSettings'] = true;
        
        $pageData['_all'] =  $pageData['_insert'] = $pageData['_update'] = 'btn-default';
        $classAction = '_'.$action;
        
        if(empty($action)) {
            $this->crud_elements->display_hidden_elements(true);
            $this->crud_elements->display_form_inline_settings(true);
            $classAction = '_all';
        }
        
        $pageData[$classAction] = 'btn-success';
        
        $pageData['crudForm'] = $this->crud_elements->curdForm($objCURD, $pageData['displayElementSettings']); 
        
        $this->data['elementType'] = $this->crud_elements->get_element_type_counts();
        //Include CSS & Js files in form    
        $this->set_element_type_librery($this->data['elementType']);
        
        $this->page_construct('admin/cruds/masterform' , $pageData);
        
    }
        
    public function manage_element_setting() {       
        
        $pageData['Element']   = $this->crud_model->getCrudFormElements($_POST['id']);
        $pageData['db_tables'] = $this->crud_model->get_db_tables();
        
        $this->load_view('admin/cruds/element_settings' , $pageData);
    }
    
    public function submit_element_setting() {
        
        $table_name = $_POST['am_table_name'];
        
        $this->crud_model->set_table_name($table_name);
        
        $responce = $this->crud_model->updateElements($_POST);

        echo json_encode($responce);
        
    }
   
    public function ajax_request(){
        
        $table_name = $_POST['table'];
        
        $this->crud_model->set_table_name($table_name);
                
        switch ($_POST['action']) 
        {
            case 'getTableFieldsOptions':

                $db_table_structure = $this->crud_model->get_table_structure();
            
                $options = '<option value="">--Please Select--</option>' ;
                if(is_array($db_table_structure)){
                    foreach ($db_table_structure as $key => $tableInfo) {
                        $options .= '<option>'.$tableInfo['Field'].'</option>' ;   
                    }            

                }
                echo $options;
                break;

            default:
                break;
        }
    }
    
    public function custom_forms() {        
           
       $this->page_construct('admin/cruds/custom_forms');
    }
    
    public function create_custom_form() {
        
        if(isset($_POST['action']) && $_POST['action']=='insert') {
            
            $postData = $_POST;  
            
            if(isset($postData['short_code']) && !empty($postData['short_code'])){
            
                $formData['short_code']         = $postData['short_code'];
                $formData['form_title']         = $postData['form_title'];
                $formData['action_controller']  = $postData['action_controller'];
                $formData['insert_method']      = $postData['insert_method'];
                $formData['update_method']      = $postData['update_method'];
                $formData['list_method']        = $postData['list_method'];
               // $formData['table_name']         = $postData['table_name'];
                $formData['is_custom_form']     = 1;
                
                if($this->db->insert('crud_masters', $formData)){
                    
                    $customFormId = $this->db->insert_id();
                    
                    if(is_array($postData['field_name']) && $customFormId){
                        
                        foreach ($postData['field_name'] as $key=>$field_name) {

                            $insertData[$key]['short_code']         = $postData['short_code'];                          
                            $insertData[$key]['am_id']              = $customFormId;
                            $insertData[$key]['is_custom_field']    = $postData['is_custom_field'];

                            $insertData[$key]['field_name']  = $field_name;
                            $insertData[$key]['field_label'] = $postData['field_name'][$key];
                            $insertData[$key]['field_type']  = $postData['field_type'][$key];

                        }//end foreach.
                    }

                    if($this->db->insert_batch('crud_elements', $insertData)){
                        redirect('admin/cruds/masterform/'.$postData['short_code']);
                    }
                }
        }
            
        } else  {
            $this->page_construct('admin/cruds/create_custom_form');
        }
    }
    
    
    public function submit_custom_elements() {
     
        $postData = $_POST;  
          
        if(isset($postData['short_code']) && !empty($postData['short_code'])){
              
            if(is_array($postData['field_name'])){
                foreach ($postData['field_name'] as $key=>$field_name) {
                  
                    $insertData[$key]['short_code']         = $postData['short_code'];
                    $insertData[$key]['am_table_name']      = $postData['am_table_name'];
                    $insertData[$key]['am_id']              = $postData['am_id'];
                    $insertData[$key]['is_custom_field']    = $postData['is_custom_field'];
                    
                    $insertData[$key]['field_name']  = $field_name;
                    $insertData[$key]['field_label'] = $postData['field_name'][$key];
                    $insertData[$key]['field_type']  = $postData['field_type'][$key];
                    
                }//end foreach.
            }
            
            if($this->db->insert_batch('crud_elements', $insertData)){
                redirect('admin/cruds/masterform/'.$postData['short_code']);
            }
        }
        
    }
    
  
}
