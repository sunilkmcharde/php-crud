<?php defined('BASEPATH') or exit('No direct script access allowed');


class Crud
{    
    public function __construct(){
        $ci = get_instance();
        $config = $ci->config;
        $this->_merchant_phone = isset($config->config['merchant_phone'])?$config->config['merchant_phone']:'';
        $this->apiKey = isset($config->config['apiKey'])?$config->config['apiKey']:'';
        $this->pos_api_endpoint = isset($config->config['pos_api_endpoint'])?$config->config['pos_api_endpoint']:'https://simplypos.in/api';
        $this->pos_api_url = rtrim( $this->pos_api_endpoint,'/');
    }

    public function __get($var){
        return get_instance()->$var;
    }
  

    public function formatMoney($number)
    {
        if ($this->Settings->sac) {
            return ($this->Settings->display_symbol == 1 ? $this->Settings->symbol : '') .
            $this->formatSAC($this->formatDecimal($number)) .
            ($this->Settings->display_symbol == 2 ? $this->Settings->symbol : '');
        }
        $decimals = $this->Settings->decimals;
        $ts = $this->Settings->thousands_sep == '0' ? ' ' : $this->Settings->thousands_sep;
        $ds = $this->Settings->decimals_sep;
        return ($this->Settings->display_symbol == 1 ? $this->Settings->symbol : '') .
        number_format($number, $decimals, $ds, $ts) .
        ($this->Settings->display_symbol == 2 ? $this->Settings->symbol : '');
    }

    public function formatNumber($number, $decimals = null)
    {
        if (!$decimals) {
            $decimals = $this->Settings->decimals;
        }
        if ($this->Settings->sac) {
            return $this->formatSAC($this->formatDecimal($number, $decimals));
        }
        $ts = $this->Settings->thousands_sep == '0' ? ' ' : $this->Settings->thousands_sep;
        $ds = $this->Settings->decimals_sep;
        return number_format($number, $decimals, $ds, $ts);
    }

    public function formatDecimal($number, $decimals = null)
    {
        if (!is_numeric($number)) {
            return null;
        }
        if (!$decimals) {
            $decimals = $this->Settings->decimals;
        }
        return number_format($number, $decimals, '.', '');
    }

    public function clear_tags($str)
    {
        return htmlentities(
            strip_tags($str,
                '<span><div><a><br><p><b><i><u><img><blockquote><small><ul><ol><li><hr><big><pre><code><strong><em><table><tr><td><th><tbody><thead><tfoot><h3><h4><h5><h6>'
            ),
            ENT_QUOTES | ENT_XHTML | ENT_HTML5,
            'UTF-8'
        );
    }

    public function decode_html($str)
    {
        return html_entity_decode($str, ENT_QUOTES | ENT_XHTML | ENT_HTML5, 'UTF-8');
    }

    public function roundMoney($num, $nearest = 0.05)
    {
        return round($num * (1 / $nearest)) * $nearest;
    }

    public function roundNumber($number, $toref = null)
    {
        switch ($toref) {
            case 1:
                $rn = round($number * 20) / 20;
                break;
            case 2:
                $rn = round($number * 2) / 2;
                break;
            case 3:
                $rn = round($number);
                break;
            case 4:
                $rn = ceil($number);
                break;
            default:
                $rn = $number;
        }
        return $rn;
    }
    
    private function _randomString($length = 8) 
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $string = '';

        for ($i = 0; $i < $length; $i++) {
            $string .= $characters[mt_rand(0, strlen($characters) - 1)];
        }

        return $string;
    }
    
    public function unset_data($ud)
    {
        if ($this->session->userdata($ud)) {
            $this->session->unset_userdata($ud);
            return true;
        }
        return false;
    }

    public function hrsd($sdate)
    {
        if ($sdate) {
            if($sdate=='0000-00-00'){
            	return false;
            }	
            return date($this->dateFormats['php_sdate'], strtotime($sdate));
        } else {
            return '0000-00-00';
        }
    }

    public function hrld($ldate)
    {
        if ($ldate) {
            return date($this->dateFormats['php_ldate'], strtotime($ldate));
        } else {
            return '0000-00-00 00:00:00';
        }
    }

    public function fsd($inv_date)
    {
        if ($inv_date) {
            $jsd = $this->dateFormats['js_sdate'];
            if ($jsd == 'dd-mm-yyyy' || $jsd == 'dd/mm/yyyy' || $jsd == 'dd.mm.yyyy') {
                $date = substr($inv_date, -4) . "-" . substr($inv_date, 3, 2) . "-" . substr($inv_date, 0, 2);
            } elseif ($jsd == 'mm-dd-yyyy' || $jsd == 'mm/dd/yyyy' || $jsd == 'mm.dd.yyyy') {
                $date = substr($inv_date, -4) . "-" . substr($inv_date, 0, 2) . "-" . substr($inv_date, 3, 2);
            } else {
                $date = $inv_date;
            }
            return $date;
        } else {
            return '0000-00-00';
        }
    }

    public function fld($ldate)
    {
        if ($ldate) {
            $date = explode(' ', $ldate);
            $jsd = $this->dateFormats['js_sdate'];
            $inv_date = $date[0];
            $time = $date[1];
            if ($jsd == 'dd-mm-yyyy' || $jsd == 'dd/mm/yyyy' || $jsd == 'dd.mm.yyyy') {
                $date = substr($inv_date, -4) . "-" . substr($inv_date, 3, 2) . "-" . substr($inv_date, 0, 2) . " " . $time;
            } elseif ($jsd == 'mm-dd-yyyy' || $jsd == 'mm/dd/yyyy' || $jsd == 'mm.dd.yyyy') {
                $date = substr($inv_date, -4) . "-" . substr($inv_date, 0, 2) . "-" . substr($inv_date, 3, 2) . " " . $time;
            } else {
                $date = $inv_date;
            }
            return $date;
        } else {
            return '0000-00-00 00:00:00';
        }
    }

    public function send_email($to, $subject, $message, $from = null, $from_name = null, $attachment = null, $cc = null, $bcc = null)
    {
        $this->load->library('email');
        $config['useragent'] = "Stock Manager Advance";
        $config['protocol'] = $this->Settings->protocol;
        $config['mailtype'] = "html";
        $config['crlf'] = "\r\n";
        $config['newline'] = "\r\n";
        if ($this->Settings->protocol == 'sendmail') {
            $config['mailpath'] = $this->Settings->mailpath;
        } elseif ($this->Settings->protocol == 'smtp') {
            $this->load->library('encrypt');
            $config['smtp_host'] = $this->Settings->smtp_host;
            $config['smtp_user'] = $this->Settings->smtp_user;
            $config['smtp_pass'] = $this->encrypt->decode($this->Settings->smtp_pass);
            $config['smtp_port'] = $this->Settings->smtp_port;
            if (!empty($this->Settings->smtp_crypto)) {
                $config['smtp_crypto'] = $this->Settings->smtp_crypto;
            }
        }

        $this->email->initialize($config);

        if ($from && $from_name) {
            $this->email->from($from, $from_name);
        } elseif ($from) {
            $this->email->from($from, $this->Settings->site_name);
        } else {
            $this->email->from($this->Settings->default_email, $this->Settings->site_name);
        }

        $this->email->to($to);
        if ($cc) {
            $this->email->cc($cc);
        }
        if ($bcc) {
            $this->email->bcc($bcc);
        }
        $this->email->subject($subject);
        $this->email->message($message);
        if ($attachment) {
            if (is_array($attachment)) {
                foreach ($attachment as $file) {
                    $this->email->attach($file);
                }
            } else {
                $this->email->attach($attachment);
            }
        }

        if ($this->email->send()) {
            //echo $this->email->print_debugger(); die();
            return true;
        } else {
            //echo $this->email->print_debugger(); die();
            return false;
        }
    }

    public function generate_pdf($content, $name = 'download.pdf', $output_type = null, $footer = null, $margin_bottom = null, $header = null, $margin_top = null, $orientation = 'P')
    {
        if (!$output_type) {
            $output_type = 'D';
        }
        if (!$margin_bottom) {
            $margin_bottom = 10;
        }
        if (!$margin_top) {
            $margin_top = 20;
        }
        $this->load->library('pdf');
        $pdf = new mPDF('utf-8', 'A4-' . $orientation, '13', '', 10, 10, $margin_top, $margin_bottom, 9, 9);
        $pdf->debug = false;
        $pdf->autoScriptToLang = true;
        $pdf->autoLangToFont = true;
        // if you need to add protection to pdf files, please uncomment the line below or modify as you need.
        // $pdf->SetProtection(array('print')); // You pass 2nd arg for user password (open) and 3rd for owner password (edit)
        // $pdf->SetProtection(array('print', 'copy')); // Comment above line and uncomment this to allow copying of content
        $pdf->SetTitle($this->Settings->site_name);
        $pdf->SetAuthor($this->Settings->site_name);
        $pdf->SetCreator($this->Settings->site_name);
        $pdf->SetDisplayMode('fullpage');
        $stylesheet = file_get_contents('assets/bs/bootstrap.min.css');
        $pdf->WriteHTML($stylesheet, 1);
        // $pdf->SetFooter($this->Settings->site_name.'||{PAGENO}/{nbpg}', '', TRUE); // For simple text footer

        if (is_array($content)) {
            $pdf->SetHeader($this->Settings->site_name.'||{PAGENO}/{nbpg}', '', TRUE); // For simple text header
            $as = sizeof($content);
            $r = 1;
            foreach ($content as $page) {
                $pdf->WriteHTML($page['content']);
                if (!empty($page['footer'])) {
                    $pdf->SetHTMLFooter('<p class="text-center">' . $page['footer'] . '</p>', '', true);
                }
                if ($as != $r) {
                    $pdf->AddPage();
                }
                $r++;
            }

        } else {

            $pdf->WriteHTML($content);
            if ($header != '') {
                $pdf->SetHTMLHeader('<p class="text-center">' . $header . '</p>', '', true);
            }
            if ($footer != '') {
                $pdf->SetHTMLFooter('<p class="text-center">' . $footer . '</p>', '', true);
            }
        }

        if ($output_type == 'S') {
            $file_content = $pdf->Output('', 'S');
            write_file('assets/uploads/' . $name, $file_content);
            return 'assets/uploads/' . $name;
        } else {
            $pdf->Output($name, $output_type);
        }
    }

    public function print_arrays()
    {
        $args = func_get_args();
        echo "<pre>";
        foreach ($args as $arg) {
            print_r($arg);
        }
        echo "</pre>";
        die();
    }

    public function logged_in()
    {
        return (bool) $this->session->userdata('identity');
    }

    public function in_group($check_group, $id = false)
    {
        if ( ! $this->logged_in()) {
            return false;
        }
        $id || $id = $this->session->userdata('user_id');
        $group = $this->site->getUserGroup($id);
        if ($group->name === $check_group) {
            return true;
        }
        return false;
    }

    public function makecomma($input)
    {
        if (strlen($input) <= 2) {return $input;}
        $length = substr($input, 0, strlen($input) - 2);
        $formatted_input = $this->makecomma($length) . "," . substr($input, -2);
        return $formatted_input;
    }

    public function formatSAC($num)
    {
        $pos = strpos((string) $num, ".");
        if ($pos === false) {$decimalpart = "00";} else {
            $decimalpart = substr($num, $pos + 1, 2);
            $num = substr($num, 0, $pos);}

        if (strlen($num) > 3 & strlen($num) <= 12) {
            $last3digits = substr($num, -3);
            $numexceptlastdigits = substr($num, 0, -3);
            $formatted = $this->makecomma($numexceptlastdigits);
            $stringtoreturn = $formatted . "," . $last3digits . "." . $decimalpart;
        } elseif (strlen($num) <= 3) {
            $stringtoreturn = $num . "." . $decimalpart;
        } elseif (strlen($num) > 12) {
            $stringtoreturn = number_format($num, 2);
        }

        if (substr($stringtoreturn, 0, 2) == "-,") {$stringtoreturn = "-" . substr($stringtoreturn, 2);}

        return $stringtoreturn;
    }

    public function md($page = FALSE)
    {
    	if($page=='login'){
            $page = base_url('login');
        } 
        die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . ($page ? $page : (isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : 'welcome')) . "'; }, 10);</script>");
    }

    public function send_json($data)
    {
        header('Content-Type: application/json');
        die(json_encode($data));
        exit;
    }
    
    public function logout(){
        $this->session->sess_destroy();
    }

    /**
     * 
     * @param string $string
     * @return string
     */
    public function _to_label($string) {

        $search = ['_', '-'];

        $replace = ' ';

        $string = str_replace($search, $replace, $string);

        return ucwords($string);
    }
    
    
    
}