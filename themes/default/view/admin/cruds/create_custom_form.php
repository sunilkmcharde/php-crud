<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              <small>Create Custom Form </small>
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
                         
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <?php
                    $hidden = ['is_custom_field'=>'1', 'action'=>'insert'];
                ?>
                <?= form_open_multipart( base_url('admin/cruds/create_custom_form') , 'id="myform"', $hidden);?>
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <div class="col-sm-2 form-control-label showhide_elements"><label>Form Title *</label></div>
                            <div class="col-sm-3 form-group">
                                <input type="text" name="form_title" id="form_title" class="form-control" required="required" placeholder="Form Title" />
                            </div>  
                            <div class="col-sm-5 text-red">(Required: For Label & Links)</div>
                        </div>
                        <div class="form-group col-sm-12">
                            <div class="col-sm-2 form-control-label showhide_elements"><label>Form Unique Code *</label></div>
                            <div class="col-sm-3 form-group">
                                <input type="text" name="short_code" id="short_code" class="form-control" required="required" placeholder="Form Unique Code" />
                            </div>
                            <div class="col-sm-5 text-red">(Required: lowercase without space, can use underscore "_",<br/> don't use database table name)</div>
                        </div>
                        <div class="form-group col-sm-12">
                            <div class="col-sm-2 form-control-label showhide_elements"><label>Custom Controller *</label></div>
                            <div class="col-sm-3 form-group">ROOT\application\controllers\admin\</div>
                            <div class="col-sm-3 form-group">
                                <input type="text" name="action_controller" id="action_controller" class="form-control" required="required" placeholder="Controller" value="custom_form" />
                            </div>                           
                            <div class="col-sm-3 text-red">(Required: To write custom code)</div>
                        </div>
                        <div class="form-group col-sm-12">
                            <div class="col-sm-2 form-control-label showhide_elements"><label>Custom Methods *</label></div>
                            <div class="col-sm-2 form-group">
                                <input type="text" name="insert_method" id="insert_method" class="form-control" required="required" placeholder="Data Insert Method" value="insert" />
                            </div>
                             <div class="col-sm-2 form-group">
                                <input type="text" name="update_method" id="update_method" class="form-control" required="required" placeholder="Data Update Method" value="update" />
                            </div>
                            <div class="col-sm-2 form-group">
                                <input type="text" name="list_method" id="list_method" class="form-control" required="required" placeholder="Data List Methods" value="datalist" />
                            </div>
                            <div class="col-sm-3 text-red">(Required: To write custom code)</div>
                        </div>
<!--                        <div class="form-group col-sm-12">
                            <div class="col-sm-2 form-control-label showhide_elements"><label>DB Table Name </label></div>
                            <div class="col-sm-3 form-group">
                                <input type="text" name="table_name" id="table_name" class="form-control" placeholder="Database Table Name" />
                            </div> 
                            <div class="col-sm-5 text-red">(Optional: To store form data)</div>
                        </div>-->
                    </div>
                <hr/>
                    <div class="form-group col-sm-12">
                        <div class="col-sm-3 form-control-label "><label>Form Field Title</label></div>
                        <div class="col-sm-3 form-control-label "><label>Form Input Field Name</label></div>                        
                        <div class="col-sm-3 form-control-label "><label>Form Field Type</label></div>
                    </div>
                    <div id="custom_elements_form">
                        <div class="row">
                            <div class="form-group col-sm-3">
                                <input type="text" name="field_name[]" id="field_name" class="form-control" required="required" placeholder="field_name" />
                            </div>
                            <div class="form-group col-sm-3">
                                <input type="text" name="field_label[]" id="field_label" class="form-control" required="required" placeholder="field_label" />
                            </div>
                            <div class="form-group col-sm-3">
                                <select name="field_type[]" id="field_type" class="form-control" required="required"><option value="">Select One</option><option>text</option><option>hidden</option><option>textarea</option><option>select</option><option>select_multiple</option><option>radio</option><option>checkbox</option><option>password</option><option>email</option><option>file</option><option>date</option><option>timepicker</option><option>datetime</option><option>daterange</option><option>range</option><option>number</option></select>
                            </div>
                            <div class="form-group col-sm-1">
                                <button type="button" class="btn btn-primary" onclick="addRow()"> Add <i class="fa fa-plus"></i> </button>
                            </div>
                            <div class="form-group col-sm-1">
                                <button type="submit" class="btn btn-success"> <i class="fa fa-save"></i> Submit </button>
                            </div>
                            
                        </div>
                    </div>
                <?= form_close()?>
                            
              
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

$(document).ready(function(){
    alert('###');
    $('#form_title').on('change', function(){
        
        alert($('#form_title').val());
    });
    
});

function addRow() {
    
    var div = document.createElement('div');

    div.className = 'row';
    

    div.innerHTML ='<div class="form-group col-sm-3">\
                        <input type="text" name="field_name[]" id="field_name" class="form-control" required="required" placeholder="field_name" />\
                    </div>\
                    <div class="form-group col-sm-3">\
                        <input type="text" name="field_label[]" id="field_label" class="form-control" required="required" placeholder="field_label" />\
                    </div>\
                    <div class="form-group col-sm-3">\
                        <select name="field_type[]" id="field_type" class="form-control" required="required"><option value="">Select One</option><option>text</option><option>hidden</option><option>textarea</option><option>select</option><option>select_multiple</option><option>radio</option><option>checkbox</option><option>password</option><option>email</option><option>file</option><option>date</option><option>timepicker</option><option>datetime</option><option>daterange</option><option>range</option><option>number</option></select>\
                    </div>\
                    <a class="btn btn-danger" onclick="removeRow(this)"><i class="fa fa-trash"></i></a>';
   
    document.getElementById('custom_elements_form').appendChild(div);
 }

function removeRow(div) {
    document.getElementById('custom_elements_form').removeChild(div.parentNode);
}



  </script>
