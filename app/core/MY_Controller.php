<?php defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {
    
    public $Settings;
    public $data;
    public $theme;
    public $dateFormats;
    public $loggedIn;
    
    function __construct()
    {
        parent::__construct();
        
        global $db;
        
        $this->Settings = $this->site->get_setting();
        
        $this->data['view'] = base_url() . 'themes/default/view/admin/'; 
        $this->data['assets'] = base_url() . 'themes/default/assets/admin/'; 
        
        $this->data['Settings'] = $this->Settings;
        $this->Settings->theme = 'default';
        $this->theme = $this->Settings->theme . '/view/';
        $this->theme_admin = $this->Settings->theme . '/view/admin/';
        if(is_dir(VIEWPATH.$this->Settings->theme.DIRECTORY_SEPARATOR.'assets'.DIRECTORY_SEPARATOR)) {
            $this->data['assets'] = base_url() . 'themes/' . $this->Settings->theme . '/assets/admin/';
        } else {
            $this->data['assets'] = base_url() . 'themes/default/assets/admin/';
        }
        $assets_uploads_cruds = rtrim(BASEPATH, '//\system').DIRECTORY_SEPARATOR.'assets\uploads\cruds';
        if(is_dir($assets_uploads_cruds.DIRECTORY_SEPARATOR)) {
            $this->data['crud_file_upload_path'] = $assets_uploads_cruds . DIRECTORY_SEPARATOR;
            $this->data['crud_file_access_path'] = base_url() . 'assets/uploads/cruds/';
            $this->data['icons_access_path']     = base_url() . 'assets/uploads/icons/';
        } else {
            mkdir($assets_uploads_cruds);
        }

        $this->data['Settings'] = $this->Settings;
       
        $this->loggedIn = $this->crud->logged_in();
    
        if($this->loggedIn) {
                	   
            if($sd = $this->site->getDateFormat($this->Settings->dateformat)) {
                $dateFormats = array(
                    'js_sdate' => $sd->js,
                    'php_sdate' => $sd->php,
                    'mysq_sdate' => $sd->sql,
                    'js_ldate' => $sd->js . ' hh:ii',
                    'php_ldate' => $sd->php . ' H:i',
                    'mysql_ldate' => $sd->sql . ' %H:%i'
                    );
            } else {
                $dateFormats = array(
                    'js_sdate' => 'mm-dd-yyyy',
                    'php_sdate' => 'm-d-Y',
                    'mysq_sdate' => '%m-%d-%Y',
                    'js_ldate' => 'mm-dd-yyyy hh:ii:ss',
                    'php_ldate' => 'm-d-Y H:i:s',
                    'mysql_ldate' => '%m-%d-%Y %T'
                    );
            }
                        
            $this->dateFormats = $dateFormats;
            $this->data['dateFormats'] = $dateFormats; 
                       
        }
        
        $db = $this->db;
        
        //Load Define DB Table Names
        crud_define_tables();
    }

    public function page_construct($page, $data = array(), $meta = array()) {
        
         //$this->print_array($this->data);
        
        $meta['message'] = isset($data['message']) ? $data['message'] : $this->session->flashdata('message');
        $meta['error']   = isset($data['error']) ? $data['error']     : $this->session->flashdata('error');
        $meta['warning'] = isset($data['warning']) ? $data['warning'] : $this->session->flashdata('warning');
               
        $meta['Settings']   = isset($data['Settings']) ? $data['Settings'] : $this->Settings;
        $meta['dateFormats']= isset($data['dateFormats']) ? $data['dateFormats'] : $this->dateFormats;
        $meta['assets']     = isset($data['assets']) ? $data['assets'] : $this->data['assets'];
        $meta['page_title'] = isset($this->data['page_title']) ? $this->data['page_title'] : 'PHP CRUD';
        
        $meta['show_sidebar_left']  = true;
        $meta['show_sidebar_right'] = isset($this->data['show_sidebar_right']) ? $this->data['show_sidebar_right'] : true;
                
        $data = array_merge($this->data, $data);
        $pagedata = array_merge($meta, $data);
       
        //$this->print_array($pagedata);
        
        $this->load->view($this->theme . 'header', $pagedata);
        $this->load->view($this->theme . 'page_header', $pagedata);
        
        //Display Sidebar if set true
        //if(($meta['show_sidebar_left']) || ($meta['show_sidebar_right'])) {
            $this->load->view($this->theme . 'sidebar', $pagedata);
        // }
        
        $this->load->view($this->theme . $page,     $pagedata);
        $this->load->view($this->theme . 'footer',  $pagedata);
    }
    
    public function load_view($page, $data = array()) {
        
        $meta['message'] = isset($data['message']) ? $data['message'] : $this->session->flashdata('message');
        $meta['error']   = isset($data['error']) ? $data['error']     : $this->session->flashdata('error');
        $meta['warning'] = isset($data['warning']) ? $data['warning'] : $this->session->flashdata('warning');
               
        $meta['Settings'] = isset($data['Settings']) ? $data['Settings'] : $this->Settings;
        $meta['dateFormats'] = isset($data['dateFormats']) ? $data['dateFormats'] : $this->dateFormats;
        $meta['assets'] = isset($data['assets']) ? $data['assets'] : $this->data['assets'];
        
        //$data = array_merge($this->data, $data);
        $pagedata = array_merge($meta, $data);
         
        
        $this->load->view($this->theme . $page, $pagedata);
       
    }
   
    public function sessionTimeout() 
    {
        if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > 900)) {
            //last request was more than 30 minutes ago
            $this->session->sess_destroy();
            return true;
        }
        $_SESSION['LAST_ACTIVITY'] = time(); //update last activity time stamp
        return false;
    }
    
    public function print_array()
    {
        $args = func_get_args();
        echo "<pre>";
        foreach ($args as $arg) {
            print_r($arg);
        }
        echo "</pre>";
        die();
    }
    
    public function lang($str) {
        return $str;
    }
    
    public function getActiveCss($type='') { 
        
        $loadCss['input_datepicker'][] = 'bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css';
        $loadCss['input_daterangepicker'][] = 'bower_components/bootstrap-daterangepicker/daterangepicker.css';        
        $loadCss['input_colorpicker'][] = 'bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css';
        $loadCss['input_timepicker'][] = 'plugins/timepicker/bootstrap-timepicker.min.css';
        $loadCss['input_datetimepicker'][] = 'plugins/timepicker/bootstrap-datetimepicker.css';
        
        $loadCss['input_advance'][] = 'plugins/iCheck/all.css';
        $loadCss['input_advance'][] = 'bower_components/select2/dist/css/select2.min.css';
        
        $loadCss['text_editor'][] = 'plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css';
        
        $loadCss['datatables'][] = 'bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css';
        
        $loadCss['bootstrap_slider'][] = 'plugins/bootstrap-slider/slider.css';
        
        $loadCss['fullcalendar'][] = 'bower_components/fullcalendar/dist/fullcalendar.min.css';
        $loadCss['fullcalendar']['media-print'] = 'bower_components/fullcalendar/dist/fullcalendar.print.min.css';
        
        if(empty($type)) {
            return $loadCss;
        } else {
            if(is_array($type)) {
                foreach ($type as $value) {
                   $rd[$value] = $loadCss[$value];
                }
                return $rd;
            }
            
            if(is_string($type)) {
                return $loadCss[$type];
            }
        }
    }
    
    public function getActiveJs($type = '') {
        
        $loadJs['custom'][] = 'custom/custom.js';
        
        $loadJs['fastclick'][] = 'bower_components/fastclick/lib/fastclick.js';
        $loadJs['slimscroll'][] = 'bower_components/jquery-slimscroll/jquery.slimscroll.min.js';
        
        $loadJs['chartjs'][] = 'bower_components/Chart.js/Chart.js';
        $loadJs['chartjs']['custom'] = 'custom/chart_js.js';
        
        $loadJs['flotchart'][] = 'bower_components/Flot/jquery.flot.js';
        $loadJs['flotchart'][] = 'bower_components/Flot/jquery.flot.resize.js';
        $loadJs['flotchart'][] = 'bower_components/Flot/jquery.flot.pie.js';
        $loadJs['flotchart'][] = 'bower_components/Flot/jquery.flot.categories.js';
        $loadJs['flotchart']['custom'] = 'custom/chart_flot.js';
        
        $loadJs['knobchart'][] = 'bower_components/jquery-knob/js/jquery.knob.js';
        $loadJs['knobchart']['custom'] = 'custom/chart_knob.js';
        
        $loadJs['sparkline'][] = 'bower_components/jquery-sparkline/dist/jquery.sparkline.min.js';
        $loadJs['sparkline']['custom'] = 'custom/chart_sparkline.js';
        
        $loadJs['input_advance'][] = 'plugins/iCheck/icheck.min.js';
        $loadJs['input_advance'][] = 'bower_components/select2/dist/js/select2.full.min.js';
        $loadJs['input_advance'][] = 'plugins/iCheck/icheck.min.js';
        
        $loadJs['input_mask'][] = 'plugins/input-mask/jquery.inputmask.js';
        $loadJs['input_mask'][] = 'plugins/input-mask/jquery.inputmask.date.extensions.js';
        $loadJs['input_mask'][] = 'plugins/input-mask/jquery.inputmask.extensions.js';
        
        $loadJs['input_datepicker'][] = 'bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js';
        
        $loadJs['input_daterangepicker'][] = 'bower_components/moment/min/moment.min.js';        
        $loadJs['input_daterangepicker'][] = 'bower_components/bootstrap-daterangepicker/daterangepicker.js'; 
        
        $loadJs['input_colorpicker'][] = 'bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js';
        $loadJs['input_timepicker'][] = 'plugins/timepicker/bootstrap-timepicker.min.js';
        $loadJs['input_datetimepicker'][] = 'plugins/timepicker/bootstrap-datetimepicker.js';
        
        $loadJs['text_editor'][] = 'bower_components/ckeditor/ckeditor.js';
        $loadJs['text_editor'][] = 'plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js';
        
        $loadJs['datatables'][] = 'bower_components/datatables.net/js/jquery.dataTables.min.js';
        $loadJs['datatables'][] = 'bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js';
        $loadJs['datatables']['custom'] = 'custom/datatables.js';
        
        $loadJs['bootstrap_slider'][] = 'plugins/bootstrap-slider/bootstrap-slider.js';
        
        $loadJs['fullcalendar'][] = 'bower_components/moment/moment.js';
        $loadJs['fullcalendar'][] = 'bower_components/fullcalendar/dist/fullcalendar.min.js';
        $loadJs['fullcalendar']['custom'] = 'custom/fullcalendar.js';
        
        
        
        if(empty($type)) {
            return $loadJs;
        } else {
            if(is_array($type)) {
                foreach ($type as $value) {
                   $rd[$value] = $loadJs[$value];
                }
                return $rd;
            }
            
            if(is_string($type)) {
                return $loadJs[$type];
            }
        }
    }
    
    
    public function set_element_type_librery($elementType) { 
       
        if(is_array($elementType)){
             $css = ['input_advance'];
             $js = ['input_advance', 'custom'];
            foreach ($elementType as $element => $count) {
               
                if($count == 0) continue;
                
                switch($element) {
                    case 'date':
                        $css[] = 'input_datepicker';
                        $js[] = 'input_datepicker';                        
                        break;                        
                    case 'datetime':
                        $css[] = 'input_datetimepicker';
                        $js[] = 'input_datetimepicker';                        
                        break;                    
                    case 'daterange':                        
                        $css[] = 'input_daterangepicker';
                        $js[] = 'input_daterangepicker';
                        break;
                    case 'time':                        
                    case 'timepicker':                        
                        $css[] = 'input_timepicker';
                        $js[] = 'input_timepicker';
                        break;
                    case 'colorpicker':                        
                        $css[] = 'input_colorpicker';
                        $js[] = 'input_colorpicker';
                        break;
                    case 'editor':                        
                        $css[] = 'text_editor';
                        $js[] = 'text_editor';
                        break;
                    case 'input_mask':
                        $js[] = 'input_mask';
                        break;                   
                }//end switch.
                
                    
                
            }//end foreach.
                    
            if(!empty($css)) {
                $this->data['load_css'] = $this->getActiveCss(array_unique($css));
            }
            if(!empty($js)) {
                $this->data['load_js']  = $this->getActiveJs(array_unique($js));
            }   
        }//end if.
    }
    
    public function path_exists($path) {
        
        if (is_dir($path.DIRECTORY_SEPARATOR)) {
            return true;
        } else {
            return mkdir($path);
        }
    }
    
    
}


