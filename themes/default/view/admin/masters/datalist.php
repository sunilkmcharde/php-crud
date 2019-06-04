<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              <small>Master Data: </small>
              <?= $settings->form_title?>
            </h1>
            <a href="<?= base_url('admin/masters/addnew/'.$settings->table_name)?>">Add New</a>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
              <li>Masters</li>
              <li class="active"><?= $settings->form_title?></li>
            </ol>
        </section>
 <!-- Main content -->
    <section class="content container-fluid"> 
        <?php echo $this->session->flashdata('view_action_message'); ?>
        <div class="box box-widget">
            <!-- /.box-header -->
            <div class="box-body">
                <?php
                
                if(is_array($datalist) && count($datalist))
                {
                    $i=0;
                    $th =  $tdrow = '';
                    foreach ($datalist as $key => $row) {
                        
                        $id = $datalist[$key][$settings->id_field];
                        
                        $i++;
                        $tdrowClass = $td = '';
                        
                         $IsActive = '<i class="fa fa-check-circle text-green"></i>';
                         $IsDelete = '<a href="#"><i class="fa fa-trash"></i></a>';
                    
                        foreach ($row as $key => $value) {
                                                        
                            if($settings->is_active_field === $key) {
                                
                                    if($value) {
                                        $tdrowClass .= ' row_active';
                                        $IsActive = '<a href="'.base_url("admin/masters/view_actions/".$settings->short_code."/deactivated/$id").'"><i class="fa fa-check-circle text-success"></i></a>';
                                    } else {
                                        $tdrowClass .= ' row_deactive'; 
                                        $IsActive = '<a href="'.base_url("admin/masters/view_actions/".$settings->short_code."/activated/$id").'"><i class="fa fa-ban text-danger"></i></a>';
                                    }
                                
                                continue;
                            }
                            
                            $Edit = '<a href="'.base_url("admin/masters/edit/".$settings->short_code."/$id").'"><i class="fa fa-edit"></i></a>';
                            
                            if($settings->is_delete_field === $key) {
                               
                                if($value) {
                                    $Edit = '<a href="'.base_url("admin/masters/view_actions/".$settings->short_code."/deleted/$id").'" title="Delete" onclick="return confirmdelete();"><i class="fa fa-remove text-danger"></i></a>';
                                
                                    $tdrowClass .= ' row_delete';
                                    $IsDelete = '<a href="'.base_url("admin/masters/view_actions/".$settings->short_code."/untrashed/$id").'" title="Untrash"><i class="fa fa-recycle text-success "></i></a>';
                                } else {
                                     $IsDelete = '<a href="'.base_url("admin/masters/view_actions/".$settings->short_code."/trashed/$id").'" title="Send to trash" onclick="return confirmtrash();"><i class="fa fa-trash text-danger"></i></a>';
                                }
                                
                                continue;
                            }
                            
                            if($i==1) {
                                $th .= '<th>'.$key.'</th>';
                            }
                            $x = '';
                            if( is_array($media_elements) && in_array( $key, $media_elements )){
                                
                                $ext = pathinfo($file_access_path . $value, PATHINFO_EXTENSION);
                                
                                switch ($ext) {
                                    case 'jpg':
                                    case 'jpeg':
                                    case 'png':
                                    case 'gif':
                                        $media = '<img src="'.$file_access_path . $value.'" height="30px" />';
                                        break;
                                    case 'pdf':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'pdf.png" height="30px" /></a>';
                                        break;
                                    case 'txt':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'txt.png" height="30px" /></a>';
                                        break;
                                    case 'xls':
                                    case 'xlsx':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'xls.png" height="30px" /></a>';
                                    case 'doc':
                                    case 'docx':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'doc.png" height="30px" /></a>';
                                        break;
                                    case '3gp':
                                    case 'mp3':
                                    case 'oga':
                                    case 'au':
                                    case 'wav':
                                    case 'wma':
                                    case 'webm':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'audio.png" height="30px" /></a>';
                                        break;
                                    case 'mp4':
                                        $media = '<a href="'.$file_access_path . $value.'" target="_blank"><img src="'.$icons_access_path .'vidio.png" height="30px" /></a>';
                                        break;
                                    default:
                                        $media = $value;
                                        break;
                                }
                                
                                $td .= '<td>'. $media .'</td>';
                            } else {                            
                                $td .= '<td>'.substr($value, 0, 40).'</td>';
                            }
                           
                        }//end foreach inner
                        
                        $td .= "<td>$IsActive</td>";                        
                        $td .= "<td>$IsDelete</td>";
                        $td .= "<td>$Edit</td>";
                        
                    $tdrow .= '<tr class="'.$tdrowClass.'">'.$td.'</tr>';
                    }//end foreach outer
                }
                ?>
                <div class="table-responsive">    
                    <table id="datatables" class="table table-bordered table-hover">                        
                        <thead>
                            <tr>
                                <?= $th?>
                                <th>E</th>
                                <th>D</th>
                                <th>A</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <?= $th?>
                                <th>E</th>
                                <th>D</th>
                                <th>A</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <?= $tdrow?>                            
                        </tbody>
                    </table>
                </div>     
            </div>
            <!-- /.box-body -->             
            <!-- /.box-footer -->
            <div class="box-footer">
               
            </div>
            <!-- /.box-footer -->
          </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
  
  <script>
    function confirmdelete(){ 
      
      return confirm('Are you sure that you want to delete this record?');
    } 
  
  
    function confirmtrash(){ 
      return confirm('Are you sure that you want to trash this record?');
    }
  
  
  </script>