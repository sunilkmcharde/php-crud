<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Site extends CI_Model
{
    public function __construct() {
        parent::__construct();
         $this->set_settings();
    }

    public function get_setting() {
        $q = $this->db->get('crud_settings');
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
       
    public function set_settings() {
        
        if(!isset($this->Settings)) {
            $this->Settings = $this->get_setting();
        }        
    }
    
    public function getDateFormat($id) {
        $q = $this->db->get_where('crud_date_format', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
    
    public function getUser($id = NULL) {
        if (!$id) {
            $id = $this->session->userdata('user_id');
        }
             $this->db->select('id, username, nickname, email, phone, user_group');
        $q = $this->db->get_where('crud_users', array('id' => $id), 1);
        
        if ($q->num_rows() > 0) {
            
           $data = $q->row();       
           
           $groupdata = $this->getUserGroup($data['user_group']);
           
           $data['user_type'] = $groupdata['user_type_title'];
           $data['access_level'] = $groupdata['access_level'];
           $data['access_limit'] = $groupdata['access_limit'];
           $data['crud_access'] = $groupdata['crud_access'];
           
           return $data;
        }
        return FALSE;
    }
    
    public function getUserGroup($id = NULL) {
        
        if ($id) {
            $this->db->where('id',$id);
        }
        $q = $this->db->get('crud_users_group');
        if ($q->num_rows() == 1) {
        
            $data = $q->row();            
            return $data;
        }
        if ($q->num_rows() > 1) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }            
            return $data;
        }
        return FALSE;
    }
 
    public function modal_js() {
        return '<script type="text/javascript">' . file_get_contents($this->data['assets'] . 'js/modal.js') . '</script>';
    }
    
}
