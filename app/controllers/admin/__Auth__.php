<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends MY_Controller {
	
    public function __construct()
    {
        parent::__construct();
        
        $this->load->model('auth_model');
    }
        
    public function index()
    {
        $this->login();
    }
    
    public function login() 
    {
        $data['page_title'] = 'SIgn In';       
        $this->load_view('admin/login', $data);
    }    
    
    public function submit_login() {
         
        $this->load->library('form_validation');        
        
        $username = $this->input->post('user_name', TRUE);
        $passwd   = $this->input->post('passwd', TRUE);
        
        $this->form_validation->set_rules('user_name', 'Username', 'required',
                array('required' => 'You must provide a %s.'));
        $this->form_validation->set_rules('passwd', 'Password', 'required',
                array('required' => 'You must provide a %s.'));
        
        $this->form_validation->set_error_delimiters('<div class="error">', '</div>');
        
        if ($this->form_validation->run() == FALSE)
        {
            redirect('admin/login?error=1');
        }
        else
        {
            if($this->auth_model->set_authdata(['u'=>$username,'p'=>$passwd])){
                
                $this->auth_model->checkAuthentication();                
                
                //redirect('admin/dashboard');
            }//end if.
            
        }//end else
        
         
    }
    
    
    
    public function forgot_password() {
        $data['page_title'] = 'Forgot Password';
       
        $this->load_view('admin/forgot_password', $data);
    }
    
}
