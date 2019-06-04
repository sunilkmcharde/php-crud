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
                    if(!$cruds['is_custom_form']) {
                    ?>
                        <div class="box-header with-border">
                            <span class=" pull-right">                                             
                                <a class="btn btn-info btn-sm" href="<?= base_url('admin/cruds/generate/'.$table_name.'/generate_master') ?>" >Recheck Structure</a>
                                
                            </span>
                        </div>
                    <?php
                    }
                        if(is_array($crud_elements)) {
                    ?>
                        <table class="table table-bordered">

                            <tr>

                                <th>#</th>

                                <th>Field Label, Name & Type</th>

                                <th>Field Type & Validations</th>

                                <th>Display in</th>

                                <th>Form Status</th>

                                <th>Extra Info</th>

                                <th>Action</th>

                            </tr>

                            <?php
                            $i = 0;

                            foreach ($crud_elements as $element) {
                                ?>

                                <tr>
                                    <td><?php echo ++$i; ?></td>
                                    <td>
                                        <strong><?php echo $element['field_label']; ?></strong><?php echo ($element['is_required'])?'<i class="text-danger pull-right">(Required)</i>':''; ?><br/>
                                        <i class="text-info"><?php echo $element['field_name']; ?></i> 
                                        <i class="text-warning">(<?php echo $element['data_type']; ?>)</i>

                                    </td>
                                    <td>
                                        <div class="table-structure width-12 no-border">
                                            <div class="table-row">
                                                <div class="table-cell-title width-6">Field Type:</div>
                                                <div class="table-cell text-capitalize"><?php echo $element['field_type']; ?></div>
                                            </div>
                                            <div class="table-row">
                                                <div class="table-cell-title">Default:</div>
                                                <div class="table-cell"> <?php echo ($element['default_value']=='')?'<i>Null':'<i class="text-info">'.$element['default_value'];?></i></div>
                                            </div>
                                            <div class="table-row">
                                                <div class="table-cell-title">Validation:</div>
                                                <div class="table-cell"><a data-toggle="tooltip" title="<?php echo $element['validation_rules']; ?>"><i class="text-info" ><?php echo ($element['validation_rules'] != '')?'Yes':'No'; ?></i></a></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                    <?php 

                                        $in_insert = ($element['include_in_insert']) ? 'Yes' : 'No';
                                        $in_update = ($element['include_in_update']) ? 'Yes' : 'No';
                                        $in_list = ($element['display_in_list']) ? 'Yes' : 'No';  

                                        echo '<b>Insert :</b> <span class="pull-right"><i>'.$in_insert.'</i></span>';
                                        echo '<br/><b>Update :</b> <span class="pull-right"><i>'.$in_update.'</i></span>'; 
                                        echo '<br/><b>List :</b> <span class="pull-right"><i>'.$in_list.'</i></span>'; 
                                    ?> 
                                    </td> 
                                    <td>
                                        <?php
                                            $status_insert = ($element['status_in_insert']);
                                            $status_update = ($element['status_in_update']);
                                            $can_update = ($element['can_update']) ? 'Yes' : 'No'; 

                                            echo '<b>In Insert :</b> <span class="pull-right text-capitalize"><i>'.$status_insert.'</i></span>';
                                            echo '<br/><b>In Update :</b> <span class="pull-right text-capitalize"><i>'.$status_update.'</i></span>'; 
                                            echo '<br/><b>Can Update :</b> <span class="pull-right text-capitalize"><i>'.$can_update.'</i></span>'; 
                                        ?>                                                    
                                    </td>

                                    <td class=" text-capitalize">
                                        <?php 
                                            echo ($element['is_primary_key']) ? '<span class="text-info">Primary Key</span>' : $element['am_extra'];  

                                            if($element['is_foreign_key']) {                                                                
                                                echo '<br/><span class="text-info">Foreign Key</span>' ;
                                                if($element['foreign_table_name']){
                                                    echo "<br/>(<i>".$element['foreign_table_name'].'.'.$element['foreign_value_field']."</i>)";
                                                }                                                                
                                            } 
                                        ?>
                                    </td>
                                    <td>
                                        <?php //if(!$element['is_primary_key']) { ?>
                                        <button class="btn btn-primary btn-xs" onclick="setForm('<?php echo $element['id']; ?>', '<?php echo $table_name; ?>')" data-toggle="modal" data-target="#myElementModal">Edit</button>
                                        <?php //} ?>
                                    </td>

                                </tr>  

                                <?php
                            }
                            ?>



                        </table>
                     <?php 
                        } else {
                     ?>       
                        <div class="text-center"><a href="<?= base_url('admin/cruds/generate/'.$table_name.'/generate_master') ?>" class="btn btn-success btn-xs">Generate Masters</a></div>
                     <?php
                        }
                        ?>
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





<!-- Default Size Modal-->
<div class="modal fade" id="myElementModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 800px;" >
        <div class="modal-content" id="modal_body">
            <p>Form Loading. Please Wait....</p>
        </div>
    </div>
</div>
<!-- Modal End -->