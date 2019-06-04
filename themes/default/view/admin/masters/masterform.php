<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
        <section class="content-header" style="text-transform: capitalize;">
            <h1>
              <?= $this->uri->segment(3)?> : 
              <?= $settings->form_title ?>
            </h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
              <li>Crud</li>
              <li class="active"><?= $this->uri->segment(3)?></li>
            </ol>
        </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <?php            
            $hidden = ['table_name'=>$table_name, 'action'=>$action_method];
            if(isset($edit_id) && $edit_id) { $hidden['edit_id']= $edit_id;  } else { $edit_id = ''; }
            $attributes = ['class'=>"form-horizontal", 'method'=>"post"];
        ?>        
        <?= form_open_multipart(base_url("admin/$action_controller/$action_method/$table_name/$edit_id"), $attributes, $hidden)?>
        <div class="box box-widget">            
            <div class="box-header">
             <?php echo validation_errors(); ?>              
            </div>
            <!-- /.box-header -->
            <div class="box-body">                         
                <!-- /.box-header -->
                <!-- form start -->               
                   <div class="box-body">                       
                       <?php echo $crudForm;?>
                   </div>
                   <!-- /.box-body -->               
             </div>
            <!-- /.box-body -->             
            <!-- /.box-footer -->
            <div class="box-footer">
                <button name="submit_form" class="btn btn-primary" >Submit</button>
                <a class="btn btn-default" onclick="history.back(-1)" >Cancel</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <?= form_close()?>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
