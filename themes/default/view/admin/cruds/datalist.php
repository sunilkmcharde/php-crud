<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1><?php if($cruds['is_custom_form']) {
              echo "<small>Custom Form Name: </small> " .$cruds['form_title'];  
            } else {
              echo "<small>DB Table Name: </small> " .$this->uri->segment(4);  
            }
            ?>
            </h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
              <li>Crud</li>
              <li class="active"><?= $this->uri->segment(3)?></li>
            </ol>
        </section>
 <!-- Main content -->
    <section class="content container-fluid">        
        <div class="box box-widget">
            
            <div class="box-header">
                <?php
                        $table_name = $this->uri->segment(4);
                        $active_tab = $this->uri->segment(3);

                        load_crud_pannel($active_tab,$cruds);
                ?>
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php
                $i=0;
                $th = $td ='';
                if(is_array($datalist) && count($datalist))
                {
                    foreach ($datalist as $id => $row) {
                    
                    $i++;
                   
                    $td .= '<tr>';
                        foreach ($row as $key => $value) {
                            
                            if($i==1) {
                                $th .= '<th>'.$key.'</th>';
                            }
                            $td .= '<td>'.substr($value, 0, 40).'</td>';
                        }//end foreach inner                    
                    $td .= '</tr>';
                    }//end foreach outer
                }
                ?>
                <div class="table-responsive">     
                    <table id="datatables" class="table table-bordered table-hover">                        
                        <thead>
                            <tr><?= $th?></tr>
                        </thead>
                        <tfoot>
                            <tr><?= $th?></tr>
                        </tfoot>
                        <tbody>
                            <?= $td?>       
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
 