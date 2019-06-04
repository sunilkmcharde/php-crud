
<div class="content-wrapper">
    <section class="content container-fluid">
        <div class="box box-widget"> 
            <!-- Hover Rows -->
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2>
                                    Custom Forms List
                                </h2>
                                <ul class="header-dropdown m-r--5">
                                    <li class="dropdown">
                                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            <i class="material-icons">more_vert</i>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li><a href="javascript:void(0);">Action</a></li>
                                            <li><a href="javascript:void(0);">Another action</a></li>
                                            <li><a href="javascript:void(0);">Something else here</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="body table-responsive">
                                <table class="table table-hover">
                                <tr>
                                  <th>#</th>
                                  <th>Form Name</th>
                                  <th>List Method</th>
                                  <th>Submit Method</th>
                                  <th>Form Code</th>
                                  <th>DB Table Name</th>
                                  <th>Status</th>
                                  <th colspan="2">ACTION</th>
                                </tr>
                <?php
                $i = 0;
                if(is_array($crudCustomForms)){
                    foreach ($crudCustomForms as $key=>$forms) {
               ?>
                  <tr>
                      <td><?php echo ++$i;?></td>
                      <td><?php echo $forms['form_title'];?></td>
                      <td><?= ($forms['list_controller'].'/'.$forms['list_method'])?></td>
                      <td><?= ($forms['action_controller'].'/'.$forms['action_method'])?></td>
                      <td><?php echo $forms['short_code'];?></td>                  
                      <td><?php echo $forms['table_name'];?></td>
                      <td><?php echo $forms['is_active'] ? 'Active': 'Deactive';?></td>
                      <td><a href="<?= base_url('admin/cruds/settings/'. $key)?>" class="btn btn-success btn-xs">Form Setting</a></td>
                      <td><a href="<?= base_url('admin/cruds/masterform/'. $key)?>" class="btn btn-success btn-xs">View Form</a></td>
                                               
                    </tr> 
               <?php
                    }//end foreach.
                }//end if.
                ?>

                  </table>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Hover Rows -->
        </div>
    </section>
</div>