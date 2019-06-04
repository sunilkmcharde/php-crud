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
              <li><a href="#"><i class="fa fa-dashboard"></i> Admin </a></li>
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
                <!-- /.box-header -->
                <div class="text-center">
                    <div class="btn-group">
                        <a href="<?= base_url('admin/cruds/masterform/'.$table_name)?>"  class="form_view btn <?= $_all?> "><big>All Fields</big></a>
                        <a href="<?= base_url('admin/cruds/masterform/'.$table_name.'/insert')?>" class="form_view btn <?= $_insert?>"><big>Insert Form</big></a>
                        <a href="<?= base_url('admin/cruds/masterform/'.$table_name.'/update')?>" class="form_view btn <?= $_update?>"><big>Edit Form</big></a>
                    </div>
                </div>
                
                <!-- form start -->
               <form class="form-horizontal" method="post">
                   <div class="box-body">
                       <?php
                       if(isset($_GET['submit']) && $_GET['submit']){
                           echo '<div class="alert alert-success">Form submit successfully.</div>';
                       }
                       ?>
                       <?php echo $crudForm;?>
                   </div>
                   <!-- /.box-body -->
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
    <div class="modal-dialog" role="document" style="width: 800px;" >
        <div class="modal-content" id="modal_body">
            <p>Form Loading. Please Wait....</p>
        </div>
    </div>
</div>
<!-- Modal End -->
<?php } ?>