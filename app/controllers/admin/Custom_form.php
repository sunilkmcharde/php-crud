<?php defined('BASEPATH') OR exit('No direct script access allowed');

class custom_form extends MY_Controller
{
    private $short_code;
    
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
        
        $this->data['page_title'] = 'Custom Forms';
        
        $this->data['show_sidebar_right'] = True;
        
        $this->load->model('crud_model');
        
        $this->data['db_tables']        = $this->crud_model->get_db_tables();
        
        $this->data['crudCustomForms']  = $this->crud_model->getCrudCustomForm();
        
        $this->data['crudDbMasters']    = $this->crud_model->getMastersList();
                
        $this->load->model('custom_model'); 

    } 
    
    
    public function index(){
        
        
    }
    
    public function insert(){
        
        switch ($this->short_code) {
            
            default:
                $methodName = $this->short_code.'_insert';
                
                if(!method_exists($this,$methodName)) {
                    $data['method_error'] = 'Custom method "'.$methodName.'" not found for form code "'.$this->short_code.'" ';
                    $this->load_view('admin/custom_method_error', $data);
                } else {
                    
                    $this->$methodName(); 
                }
            break;
        }
        
    }
    
    public function update(){
        
        
    }
    
    public function datalist(){
        
        
    }
    
    
    public function mycusttable_insert(array $parram ){
        
        echo "<h1>In My Custom Form Insert Method</h1>";
    }
    
    public function mycusttable_edit(array $parram ){
        
        echo "<h1>In My Custom Form Insert Method</h1>";
    }
    
    
    
    
    
    
    
}
