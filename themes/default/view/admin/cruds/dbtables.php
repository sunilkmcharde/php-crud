
<div class="content-wrapper">
    <section class="content container-fluid">
        <div class="box box-widget"> 
            <!-- Hover Rows -->
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="header">
                                <h2>
                                    Database Tables
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
                                  <th>TABLE NAME</th>
                                  <th>ENGINE</th>
                                  <th>AUTO INCREMENT</th>
                                  <th>TABLE ROWS</th>
                                  <th>CRUD STATUS</th>
                                  <th>ACTION</th>
                                </tr>
                <?php
                $i = 0;
                if(is_array($db_tables)){
                    foreach ($db_tables as $table) {

                        if( substr($table['TABLE_NAME'], 0, 3) == 'am_' ) {  continue;  }
               ?>
                  <tr>
                      <td><?php echo ++$i;?></td>
                      <td><?php echo $table['TABLE_NAME'];?></td>
                      <td><?php echo $table['ENGINE'];?></td>
                      <td><?php echo $table['AUTO_INCREMENT'];?></td>                  
                      <td><?php echo $table['TABLE_ROWS'];?></td>
                      
                        <?php
                          if(in_array($table['TABLE_NAME'], $crudMastersList)) {
                        ?>
                        <td><a href="<?= base_url('admin/cruds/settings/'. $table['TABLE_NAME'])?>" class="btn btn-success btn-xs">Form Setting</a></td>
                        <td><a href="<?= base_url('admin/cruds/masterform/'. $table['TABLE_NAME'])?>" class="btn btn-success btn-xs">View Form</a></td>
                        <?php } else  { ?>
                        <td colspan="2"><a href="<?= base_url('admin/cruds/generate/'. $table['TABLE_NAME'].'/generate_master/')?>" class="btn btn-primary btn-xs">Generate CRUD</a></td>
                        <?php }//end else?>                      
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