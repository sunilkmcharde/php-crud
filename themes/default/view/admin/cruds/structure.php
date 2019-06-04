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
                  if(is_array($table_structure)) {
                  ?>    
                    
            <table class="table table-bordered">
                <thead>
                <tr>
                  <th>#</th>
                  <th>Field_NAME</th>
                  <th>Type</th>
                  <th>Null</th>
                  <th>Key</th>
                  <th>Default</th>
                  <th>Extra</th>
                  <th>ACTION</th>
                </tr>
                </thead>
                <tbody>
            <?php
            $i = 0;
            foreach ($table_structure as $table) {
           ?>
              <tr>
                  <td><?php echo ++$i;?></td>
                  <td><?php echo $table['Field'];?></td>
                  <td><?php echo $table['Type'];?></td>
                  <td><?php echo $table['Null'];?></td>                  
                  <td><?php echo $table['Key'];?></td>
                  <td><?php echo $table['Default'];?></td>
                  <td><?php echo $table['Extra'];?></td>
                  <td></td>
                </tr>  
           <?php
            }
            ?> 
                </tbody>
            </table>
             <?php }  ?>
                            
              
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



