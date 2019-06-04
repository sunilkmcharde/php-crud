<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Masters extends MY_Controller
{
    private $table_name;
    private $short_code;
    private $cruds;
    
    public function __construct()
    {
        parent::__construct(); 
        
        if(!$this->loggedIn) {
            redirect('admin/login');
        }
        
        $this->short_code = $this->uri->segment(4);
        
        if(!$this->short_code){
             redirect('admin/dashboard');
        }
        
        $this->data['page_title'] = 'Masters';
        
        $this->data['show_sidebar_right'] = True;
        
        $this->load->model('crud_model');
        
        $this->data['db_tables'] = $this->crud_model->get_db_tables();
        
        $this->data['crudCustomForms'] = $this->crud_model->getCrudCustomForm();
        
        $this->data['crudDbMasters'] = $this->crud_model->getMastersList();
        
        
        $this->load->model('masters_model'); 
        
        $this->crud_model->setdata($this->short_code);
        
        $this->cruds = $this->crud_model->getdata();
        
        $this->data['cruds'] = $this->cruds;
        
        $this->data['settings'] = $this->settings = $this->masters_model->setMastersDetails($this->short_code , 'view'); 
        
        if(!$this->settings) {
            redirect('admin/dashboard');
        }

    }        
    
    public function view() {
        
//         $this->page = $this->uri->segment(5);
//         $this->start = $this->uri->segment(6);
//         $this->offset = $this->uri->segment(7);
        
                   
        $this->data['load_css'] = $this->getActiveCss('datatables');
        $this->data['load_js']  = $this->getActiveJs(['datatables', 'slimscroll', 'fastclick']);        
        $this->data['file_access_path'] = $this->data['crud_file_access_path'] .  $this->short_code . '/';   
        //Media elements which filed type is file
        $this->data['media_elements']   = $this->masters_model->getMediaElements();
        //Fetch Records
        $this->data['datalist']         = $this->masters_model->get_records();
//        echo "<pre>";
//        print_r($mastersData);
//        print_r($this->data['media_elements']);
//        echo "</pre>"; 
        
         $this->page_construct('admin/masters/datalist');
    }
    
    public function view_actions() {  
        
        $action = $this->uri->segment(5);
        $id     = $this->uri->segment(6);
        $action_msg = '';
        $tablename = $this->settings->table_name;
        $where[$this->settings->id_field]   = $id;
        
        switch ($action) {
            case 'activated':              
                $data[$this->settings->is_active_field] = 1;
                $action_msg = ($this->update($tablename, $where, $data)) ? '<div class="alert alert-success">Record has been activated successfully.</div>' :'<div class="alert alert-danger">Action activate record has been failed</div>';
                break;
            
            case 'trashed':
                $data[$this->settings->is_delete_field] = 1;
                $action_msg = ($this->update($tablename, $where, $data)) ? '<div class="alert alert-success">Record has been trashed successfully.</div>' :'<div class="alert alert-danger">Action trash record has been failed</div>';
            
            case 'deactivated':                
                $data[$this->settings->is_active_field] = 0;
                $action_msg = ($this->update($tablename, $where, $data)) ? '<div class="alert alert-success">Record has been deactivated successfully.</div>' :'<div class="alert alert-danger">Action deactivate record has been failed</div>';
                break;
            
            case 'untrashed':                
                $data[$this->settings->is_delete_field] = 0;
                $action_msg = ($this->update($tablename, $where, $data)) ? '<div class="alert alert-success">Record has been untrashed successfully.</div>' :'<div class="alert alert-danger">Action untrash record has been failed</div>';
                break;
            
            case 'deleted':
                
                $action_msg = ($this->delete($tablename, $where, $data)) ? '<div class="alert alert-success">Record has been deleted permanantly.</div>' :'<div class="alert alert-danger">Action delete record has been failed.</div>';
                break;

            
        }//end switch
        if(!empty($action_msg)) {
            $this->session->set_flashdata('view_action_message', $action_msg);
        }
        redirect("admin/masters/view/".$this->settings->short_code);
    }
    
    public function edit() {  
        
        $id = $pageData['edit_id'] = $this->uri->segment(5);
        
        if(!$id){
            redirect(base_url("admin/masters/view/".$this->uri->segment(4)));
        }
        
        //action is a flag for get edit form
        $action = $pageData['form_action'] = 'edit';
        $pageData['action_controller'] = !empty($this->settings->action_controller) ? $this->settings->action_controller : 'masters';
        $pageData['action_method'] = !empty($this->settings->action_method) ? $this->settings->action_method : $action;
        
        $action_msg = '';
        $tablename = $this->settings->table_name;
        $where[$this->settings->id_field] = $id;
                
        $this->load->library('crud_elements');
        
        $this->crud_elements->set_table($tablename);
        $pageData['table_name']   = $tablename;
        $pageData['elementCount'] = $this->crud_model->getFormElementTypeCount();
        
        $objCURD = $this->crud_model->getCURDElements($action);
        
        $pageData['displayElementSettings'] = FALSE;
        
        if(empty($action)) {
            $this->crud_elements->display_hidden_elements(FALSE);
            $this->crud_elements->display_form_inline_settings(FALSE);            
        } 
        
        //Get Edit Data to make edit form fill
        $form_data = $this->masters_model->get_data($tablename, $where);
        $formData = $form_data[0];        
        
        if(!empty($_POST['action'])){
            $form_update_data = [];
            $this->load->library('form_validation');
            
            foreach ($_POST as $key => $value) {
                if(in_array($key, ['table_name','edit_id','action','submit_form'])) continue;
                $form_update_data[$key] = $value;                
            }//end foreach.
           
            if(!empty($_FILES)){
                
                foreach ($_FILES as $key => $fileData) {
                    
                    if(!empty($fileData['tmp_name'])){
                        
                        $filenameArr = explode('.', $fileData['name']);
                        $extention = end($filenameArr);
                        $newfilename = md5(time() . $fileData['name']) . '.' . $extention;                       
                        if($this->path_exists($this->data['crud_file_upload_path'].$this->short_code)) {
                            if( copy($fileData['tmp_name'] , $this->data['crud_file_upload_path'].$this->short_code.'/'.$newfilename) ){
                                $form_update_data[$key] = $newfilename;
                            }
                        }
                    }
                }//end foreach.
            }
            
            if($this->update($tablename, $where, $form_update_data)){
                $this->session->set_flashdata('view_action_message', '<div class="alert alert-success">Record updated successfully.</div>');
                redirect(base_url("admin/masters/view/".$tablename));
            }
           
        }
            
        //Fill the form with record
        $this->crud_elements->set_form_data($formData);
        //Generate Form Elements
        $pageData['crudForm'] = $this->crud_elements->curdForm($objCURD, $pageData['displayElementSettings']); 
        
        $this->data['elementType'] = $this->crud_elements->get_element_type_counts();
        
        //Method from my_controller
        $this->set_element_type_librery($this->data['elementType']);
            
        $this->page_construct('admin/masters/masterform', $pageData);
  
    }
    
    public function addnew() {  
        //action is a flag for get edit form
        $action = 'insert';
            
        $action_msg = '';
        $tablename = $this->settings->table_name ? $this->settings->table_name : $this->settings->short_code ;
        
        $pageData['action_controller'] = !empty($this->settings->action_controller) ? $this->settings->action_controller : 'masters';
        $pageData['action_method'] = !empty($this->settings->action_method) ? $this->settings->action_method : $action;
              
        $this->load->library('crud_elements');
        
        $this->crud_elements->set_table($tablename);
        $pageData['table_name'] = $tablename;
        $pageData['elementCount'] = $this->crud_model->getFormElementTypeCount();
        
        $objCURD = $this->crud_model->getCURDElements($action);
            
        $pageData['displayElementSettings'] = FALSE;
        
        if(empty($action)) {
            $this->crud_elements->display_hidden_elements(FALSE);
            $this->crud_elements->display_form_inline_settings(FALSE);            
        }     
        
        //Generate Form Elements
        $pageData['crudForm'] = $this->crud_elements->curdForm($objCURD, $pageData['displayElementSettings']); 
        
        $this->data['elementType'] = $this->crud_elements->get_element_type_counts();
        
        //Method from my_controller
        $this->set_element_type_librery($this->data['elementType']);
        
        $this->page_construct('admin/masters/masterform', $pageData);
  
    }
    
    public function insert() {  
            
        if(!empty($_POST['action'])){
            $formData = (object)[];
            $this->load->library('form_validation');
            $tablename = $_POST['table_name'];
            
            foreach ($_POST as $key => $value) {
                if(in_array($key, ['table_name','edit_id','action','submit_form'])) continue;
                $formData->$key = $value;                
            }//end foreach.
            
            if(!empty($_FILES)){
                foreach ($_FILES as $key => $fileData) {
                    
                    if(!empty($fileData['tmp_name'])){
                        
                        $filenameArr = explode('.', $fileData['name']);
                        $extention = end($filenameArr);
                        $newfilename = md5(time() . $fileData['name']) . '.' . $extention;                       
                        if($this->path_exists($this->data['crud_file_upload_path'].$this->short_code)) {
                            if( copy($fileData['tmp_name'] , $this->data['crud_file_upload_path'].$this->short_code.'/'.$newfilename) ){
                                $formData->$key = $newfilename;
                            } 
                        }
                    }
                }//end foreach.
            }
            
            if($this->masters_model->insert($tablename, $formData)){
                $this->session->set_flashdata('view_action_message', '<div class="alert alert-success">New record inserted successfully.</div>');
                redirect(base_url("admin/masters/view/".$tablename));
            }
           
        } else {
             redirect(base_url("admin/masters/addnew/".$tablename));
        }
            
    }
    
    public function update($tablename, array $where, array $data) {  
    
      $result = $this->masters_model->update($tablename, $where, $data);
            
       return ($result)? true : false;
    }
    
    public function delete($tablename, array $where) { 
        
        $result = $this->masters_model->delete($tablename, $where);
        
        return ($result)? true : false;
    }
        
    public function activated() {
       
        $tablename = $this->uri->segment(4);
        $tablefieldname = $this->uri->segment(5);
        $tablename = $this->uri->segment(6);
  
    }
    
    public function deactivated() {  
    
        
    }
    
    
    
    
}
