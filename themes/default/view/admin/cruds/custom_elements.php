<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              <small>Custom Form Name: </small>
              <?= $cruds['form_title']?>
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
                  <th>Field_TITLE</th>
                  <th>Field_TYPE</th>                  
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
                  <td><?php echo $table['field_name'];?></td>
                  <td><?php echo $table['field_label'];?></td>
                  <td><?php echo $table['field_type'];?></td>
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
                <?php
                    $hidden = ['short_code'=>$cruds['short_code'], 'am_table_name'=>$cruds['table_name'], 'am_id'=>$cruds['id'], 'is_custom_field'=>'1'];
                ?>
                <?= form_open_multipart( base_url('admin/cruds/submit_custom_elements') , 'id="myform"', $hidden);?>
                    
                    <div class="form-group col-sm-12">
                        <div class="col-sm-3 form-control-label showhide_elements" style="display: none;"><label>Input Field Name</label></div>
                        <div class="col-sm-3 form-control-label showhide_elements" style="display: none;"><label>Field Title</label></div>
                        <div class="col-sm-3 form-control-label showhide_elements" style="display: none;"><label>Field Type</label></div>                        
                        <button type="submit" class="btn btn-success col-sm-1 showhide_elements" style="display: none;"> <i class="fa fa-save"></i> Submit </button>
                        <button type="button" class="btn btn-primary col-sm-1 col-sm-offset-1 pull-right" onclick="addRow()"> Add <i class="fa fa-plus"></i> </button>
                    </div>
                    <div id="custom_elements_form"></div>
                <?= form_close()?>
            </div>
            <!-- /.box-footer -->
          </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 
  <script>
  
  
function addRow() {
    
    var div = document.createElement('div');

    div.className = 'row newele';
    

    div.innerHTML ='<div class="form-group col-sm-3">\
                        <input type="text" name="field_label[]" id="field_label" class="form-control" required="required" placeholder="field_label" />\
                    </div>\
                    <div class="form-group col-sm-3">\
                        <input type="text" name="field_name[]" id="field_name" class="form-control" required="required" placeholder="field_name" />\
                    </div>\
                    <div class="form-group col-sm-3">\
                        <select name="field_type[]" id="field_type" class="form-control" required="required"><option value="">Select One</option><option>text</option><option>hidden</option><option>textarea</option><option>select</option><option>select_multiple</option><option>radio</option><option>checkbox</option><option>password</option><option>email</option><option>file</option><option>date</option><option>timepicker</option><option>datetime</option><option>daterange</option><option>range</option><option>number</option></select>\
                    </div>\
                    <a class="btn btn-danger" onclick="removeRow(this)"><i class="fa fa-trash"></i></a>';
   
    document.getElementById('custom_elements_form').appendChild(div);
    
    countlelements();
 }

function removeRow(div) {
    document.getElementById('custom_elements_form').removeChild(div.parentNode);
    
    countlelements();
}

function countlelements(){

var numItems = $('.row.newele').length
  
    if(numItems){
        $('.showhide_elements').show();
    } else {
         $('.showhide_elements').hide();
    }
}




  </script>
