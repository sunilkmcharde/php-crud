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
                $short_code = $this->uri->segment(4);
                $active_tab = $this->uri->segment(3);

                load_crud_pannel($active_tab,$cruds);
            ?>               
            </div>
            <!-- /.box-header -->
            <div class="box-body">                         
                            <!-- /.box-header -->
                            <!-- form start -->
                           <?php            
                                $hidden = ['table_name'=>$cruds['table_name'], 'action'=>'insert', 'source'=>'crudform'];
                              //  if(isset($edit_id) && $edit_id) { $hidden['edit_id']= $edit_id;  } else { $edit_id = ''; }
                                $attributes = ['class'=>"form-horizontal", 'method'=>"post"];
                                
                                if($cruds['is_custom_form']) {
                                   echo form_open_multipart(base_url("admin/".$cruds['action_controller']."/".$cruds['action_method']."/".$cruds['table_name']), $attributes, $hidden);
                                } else  {
                                   echo form_open_multipart('', $attributes, $hidden);
                                }
                              ?>    
                               <div class="box-body">
                                   <?php
                                   if(isset($_GET['submit']) && $_GET['submit']){
                                       echo '<div class="alert alert-success">Form submit successfully.</div>';
                                   }
                                   ?>
                                   <?php echo $crudForm;?>
                               </div>
                               <!-- /.box-body -->
                               <div class="box-footer">
                                 <button type="button" class="btn btn-default">Cancel</button>
                                 <button type="submit" name="crud_submit" value="insert" class="btn btn-info pull-right">Submit</button>
                               </div>
                               <!-- /.box-footer -->
                           </form>
             

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



<?php
    if($displayElementSettings) {
?>
<!-- Default Size Modal-->
<div class="modal fade" id="myElementModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" id="modal_body">
            <p>Form Loading. Please Wait....</p>
        </div>
    </div>
</div>
<!-- Modal End -->
    <?php } ?>