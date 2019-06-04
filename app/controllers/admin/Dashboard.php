<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller
{
    
    function __construct()
    {
        parent::__construct(); 
        
        if(!$this->loggedIn) {
            redirect('admin/login');
        }
        
        $this->data['page_title'] = 'Dashboard';
        
        $this->data['show_sidebar_right'] = True;
        
        $this->load->model('crud_model');
        
        $this->data['db_tables'] = $this->crud_model->get_db_tables();
        
        $this->data['crudCustomForms'] = $this->crud_model->getCrudCustomForm();
        
        $this->data['crudDbMasters'] = $this->crud_model->getMastersList();
    }

    function index()
    {          
         $this->page_construct('admin/dashboard');
        
    }
    
    function dbtables()
    {  
        
       // $db_tables = $this->crud_model->get_db_tables();
        
        $this->page_construct('admin/dbtables');
        
    }

   
}
