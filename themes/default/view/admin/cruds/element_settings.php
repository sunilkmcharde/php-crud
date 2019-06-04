<?php

extract($Element[0]);


$formElementTypeArr       = ['text','hidden','textarea', 'select', 'select_multiple','radio','checkbox','password','email','file','date','timepicker','datetime','daterange','range','number'];

$amExtraArr               = ['created_at','updated_at','deleted_at','is_active','is_delete'];

$noParaValidationRulesArr = ['required','alpha','alpha_numeric','alpha_numeric_spaces','alpha_dash','numeric','integer','decimal','is_natural','is_natural_no_zero','valid_url','valid_email','valid_base64' ];

$is_primary_disabled = ($is_primary_key) ? ' disabled="disabled" ' : '';
$is_primary_readonly = ($is_primary_key) ? ' readonly="readonly" ' : '';
$is_primary_hide     = ($is_primary_key) ? ' style="display:none;" ' : '';
 
                   
?>
<form class="form-horizontal" method="post">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
    <h4 class="modal-title" id="defaultModalLabel">CRUD Setting <small>Table: <?php echo $am_table_name .' | Filed: '.$field_name;?></small> </h4>    
</div>
<div class="modal-body">
    <!-- form start -->

        <input type="hidden" name="pid" id="pid" value="<?php echo $id;?>" />

        <input type="hidden" name="am_id" id="am_id" value="<?php echo $am_id;?>" />

        <input type="hidden" name="am_table_name" id="am_table_name" value="<?php echo $am_table_name;?>" />

        <input type="hidden" name="field_name" id="field_name" value="<?php echo $field_name;?>" />

        <div class="box-body" id="setting_form">

            <div class="form-group">
                <div class="col-sm-6" id="div_field_label">
                    <label for="field_label" class="control-label">Field Label</label>
                    <input  class="form-control" name="field_label" id="field_label" value="<?php echo $field_label;?>" required="required" placeholder="Field Label" type="text" />
                </div>
                <div class="col-sm-6" id="div_field_type">
                    <label for="field_type" class="control-label">Field Input Type</label>
                    <select <?php //echo $is_primary_disabled;?> class="form-control" name="field_type" id="field_type" required="required">
                        <?php
                        echo '<option value="">None</option>';
                        foreach ($formElementTypeArr as $fieldType) {
                            $typeSelected = ($field_type == $fieldType) ? ' selected="selected" ' : '';
                            echo '<option '.$typeSelected.'>'.$fieldType.'</option>';
                        }
                        ?>
                    </select>        
                </div>                 
            </div>
            <div class="form-group">
                 <div class="col-sm-6">
                    <label for="field_type" class="control-label">Field Is Required</label>
                    <?php 
                          $isreq_0 = $isreq_1 = '';
                          $isRequired = 'isreq_'. $is_required;
                          $$isRequired = ' selected="selected" ';
                    ?>
                    <select <?php echo $is_primary_disabled;?> id="is_required" name="is_required" class="form-control">
                        <option value="0" <?php echo $isreq_0; ?> >No</option>
                        <option value="1" <?php echo $isreq_1; ?> >Yes</option>
                    </select>                                 
                </div> 
                <div class="col-sm-6"> 
                    <label for="include_in_insert" class="control-label">Field Display In</label> 
                    <div class="col-sm-12" style="padding-top: 10px; text-align: left;">
                        <label class="col-sm-4" <?php //echo $is_primary_hide; ?> ><input class="" name="include_in_insert" id="include_in_insert" value="1" <?php echo ($include_in_insert && !$is_primary_key)? 'checked="checked"':''; //echo $is_primary_disabled; ?> type="checkbox" />&nbsp;Insert</label> 
                        <label class="col-sm-4" <?php //echo $is_primary_hide; ?> ><input class="" name="include_in_update" id="include_in_update" value="1" <?php echo ($include_in_update && !$is_primary_key)? 'checked="checked"':''; //echo $is_primary_disabled; ?> type="checkbox" />&nbsp;Update</label> 
                        <label class="col-sm-4"><input class="" name="display_in_list" id="display_in_list" value="1" <?php echo ($display_in_list)? 'checked="checked"':'';?> type="checkbox" />&nbsp;List</label>
                    </div>
                </div>
            </div>
            <div class="form-group" id="div_is_foreign_key">                
                <div class="col-sm-6">
                    <label for="is_foreign_key" class="control-label">Is Foreign Key</label>                 
                    <?php 
                        $isfk_0 = $isfk_1 = '';
                        $isForignKey  = 'isfk_'. $is_foreign_key;
                        $$isForignKey = ' selected="selected" ';
                    ?>
                    <select <?php echo $is_primary_disabled;?> id="is_foreign_key" name="is_foreign_key" class="form-control">
                        <option value="0" <?php echo $isfk_0; ?> >No</option>
                        <option value="1" <?php echo $isfk_1; ?> >Yes</option>
                    </select>
                </div>                
            </div>

            <div class="form-group" id="div_foreign_table_info" >
                <div class="col-sm-4">
                    <label for="foreign_table_name" class="control-label">Foreign Key Table</label>
                    <select id="foreign_table_name" name="foreign_table_name" class="form-control">
                        <option value="">--Please Select--</option>
                    <?php                       
                        if(is_array($db_tables)) {
                            foreach ($db_tables as $key => $table) 
                            {
                                if( substr($table['TABLE_NAME'], 0, 3) == 'am_' ) {
                                    continue;
                                }
                                echo '<option>'.$table['TABLE_NAME'].'</option>';  
                            }//end foreach.
                        }//end if.
                    ?>
                    </select>
                </div>
                <div class="col-sm-4">
                    <label for="foreign_value_field" class="control-label">Foreign Key Value Field</label>
                    <select id="foreign_value_field" name="foreign_value_field" class="form-control"></select>
                </div>
                <div class="col-sm-4">
                    <label for="foreign_label_field" class="control-label">Foreign Key Label Field</label>
                    <select id="foreign_label_field" name="foreign_label_field" class="form-control"></select>
                </div>

            </div>

            <div class="form-group " id="div_static_dropdown_options">
                <div class="col-sm-3 pull-left">
                    <label for="static_dropdown_options" class="control-label">Choose Static Options</label> <br/><br/>
                    <label><input type="radio" name="static_dropdown_options_type" value="json" /> Json String</label>
                    <label><input type="radio" checked="checked" name="static_dropdown_options_type" value="array" /> Add Options</label>
                </div>
               
                <div class="col-sm-9 pull-right">
                    <div class="static_dropdown_options_input" id="static_dropdown_options_type_json">
                        <textarea name="static_dropdown_options_json" id="static_dropdown_options_json" class="form-control" rows="5" placeholder='Please enter valid Json format like {"value":"key","value":"key"}'></textarea>
                    </div>
                    <div class="static_dropdown_options_input" id="static_dropdown_options_type_array">
                    <?php
                    $static_options_count = $o = 0;
                    if(!empty($static_dropdown_options)) {
                        $static_options_arr = (array) json_decode($static_dropdown_options);
                        $static_options_count = count($static_options_arr);
                        foreach($static_options_arr as $value=>$key){
                            $staticOptions[++$o] = ['value'=>$value, 'key'=>$key];
                        }
                       // print_r($staticOptions);
                    }
                    
                    for($i=1; $i<=6; $i++) {
                        $checked = $solabel = $sovalue = '';
                        $disabled = ' disabled="disabled" ';
                        if($i <= $static_options_count){
                            $checked = ' checked="checked" ';
                            $disabled = '';
                            $solabel = $staticOptions[$i]['key'];
                            $sovalue = $staticOptions[$i]['value'];
                        }
                    ?>
                        <div class="form-group row">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" class="static_option_input_checkbox" name="static_option_input_checkbox" <?php echo $checked;?> id="soichk_<?php echo $i;?>" value="<?php echo $i;?>" />
                                </span>
                                <input type="text" placeholder="Option Label" value="<?php echo $solabel;?>" name="static_option_label_<?php echo $i;?>" id="static_option_label_<?php echo $i;?>" class="form-control col-lg-5 soichk soichk_<?php echo $i;?>" style="width:45%;" <?php echo $disabled;?>  type="text" />
                                <input type="text" placeholder="Option Value" value="<?php echo $sovalue;?>" name="static_option_value_<?php echo $i;?>" id="static_option_value_<?php echo $i;?>" class="form-control col-lg-5 soichk soichk_<?php echo $i;?>" style="width:45%;" <?php echo $disabled;?> type="text" />
                            </div>
                        </div> 
                    <?php
                    }
                    ?>
                    </div>
                </div>
            </div>

            

            <div class="form-group">
                <div class="col-sm-4" <?php //echo $is_primary_hide; ?> >
                    <?php 
                        $_none = $_active = $_disabled = $_readonly = $_hidden = '';
                        $insertStatus = '_'.$status_in_insert;
                        $$insertStatus = ' selected="selected" ';
                    ?>
                    <label for="status_in_insert">Status In Insert</label>
                    <select <?php //echo $is_primary_readonly;?> class="form-control" name="status_in_insert" id="status_in_insert">
                        <option value="none" <?php echo $_none; ?> >None</option>
                        <option value="active" <?php echo $_active; ?> >Active</option>                        
                        <option value="disabled" <?php echo $_disabled; ?> >Disabled</option>
                        <option value="readonly" <?php echo $_readonly; ?> >Readonly</option>
                        <option value="hidden" <?php echo $_hidden; ?> >Hidden</option>
                    </select>                     
                </div>
                
                <div class="col-sm-4" <?php //echo $is_primary_hide; ?> >
                    <?php
                        $__none = $__active = $__disabled = $__readonly = $__hidden = '';

                           $$insertStatus = '';
                           $updateStatus  = '__'.$status_in_update;
                           $$updateStatus = ' selected="selected" ';                   
                   ?>
                    <label for="status_in_update">Status In Update</label>
                    <select <?php //echo $is_primary_readonly;?> class="form-control" name="status_in_update" id="status_in_update">
                        <option value="none" <?php echo $__none; ?> >None</option>
                        <option value="active" <?php echo $__active; ?> >Active</option>                        
                        <option value="disabled" <?php echo $__disabled; ?> >Disabled</option>
                        <option value="readonly" <?php echo $__readonly; ?> >Readonly</option>
                        <option value="hidden" <?php echo $__hidden; ?> >Hidden</option>                        
                    </select>                     
                </div>
                
                <div class="col-sm-4" <?php echo $is_primary_hide; ?> >
                <?php 
                    $created_at = $updated_at = $deleted_at = $is_active = $is_delete = $id = $general ='';

                    $$am_extra = ' selected="selected" ';
                ?>
                    <label for="am_extra">Extra Status</label>
                    <select <?php echo $is_primary_readonly;?> class="form-control" name="am_extra" id="am_extra">
                        <option value="created_at" <?php echo $created_at; ?> >Created Date Field</option>
                        <option value="updated_at" <?php echo $updated_at; ?> >Updated Date Field</option>
                        <option value="deleted_at" <?php echo $deleted_at; ?> >Deleted Date Field</option>
                        <option value="is_active" <?php echo $is_active; ?> >Active Status Field</option>
                        <option value="is_delete" <?php echo $is_delete; ?> >Delete Status Field</option>
                        <option value="id" <?php echo $id; ?> >Id Field</option>
                        <option value="general" <?php echo $general; ?> >General Field</option>
                    </select>                     
                </div>
            </div>

<!--       <div class="form-group" < ?php echo $is_primary_hide; ?> >
                < ?php 
                     if($can_update) 
                         { $canupdate = ' checked="checked" '; $cantupdate = ''; } 
                     else 
                        { $cantupdate = ' checked="checked" '; $canupdate = ''; }
                ?>
                <label for="can_update" class="col-sm-3 control-label">Can Update</label>
                <div class="col-sm-8">
                    <label class="col-sm-4"> <input < ?php echo $is_primary_readonly ;?> name="can_update"  id="can_update" value="1" type="radio" < ?php echo $canupdate;?> /> Yes</label>
                    <label class="col-sm-4"> <input < ?php echo $is_primary_readonly;?> name="can_update" id="can_update" value="0" type="radio" < ?php echo $cantupdate;?> /> No</label>
                </div>
            </div> -->
            
            <div class="form-group" <?php echo $is_primary_hide; ?>> 
                <div class="col-sm-4">
                    <label>Min Length</label>
                    <input <?php echo $is_primary_disabled;?> class="form-control" max="255" min="1" onkeydown="return false;" maxlength="2" name="minlength" id="minlength" value="<?php echo $minlength;?>" placeholder="Field Minlength" type="number" />
                </div>
                <div class="col-sm-4">
                    <label>Max Length</label>
                    <input <?php echo $is_primary_disabled;?> class="form-control" max="255" min="1" onkeydown="return false;" maxlength="2" name="maxlength" id="maxlength" value="<?php echo $maxlength;?>" placeholder="Field Maxlength" type="number" />
                </div> 
                <div class="col-sm-4">
                    <label>Field Order</label>
                    <input class="form-control" max="99" min="1" onkeydown="return false;" maxlength="2" name="form_field_order" id="form_field_order" value="<?php echo $form_field_order;?>" placeholder="Form Field Order" type="number" />
                </div> 
            </div> 
            <div class="form-group" <?php echo $is_primary_hide; ?>>
                <div class="col-sm-4">
                    <label for="default_value">Default Value</label>
                    <input <?php echo $is_primary_disabled;?> class="form-control" name="default_value" id="default_value" value="<?php echo $default_value;?>" placeholder="Default Value" type="text" />
                </div>
                <div class="col-sm-4">
                     <label for="placeholder">Field Placeholder</label>
                     <input <?php echo $placeholder;?> class="form-control" name="placeholder" id="placeholder" value="<?php echo $placeholder;?>" placeholder="Placeholder"  type="text" />
                </div>
                <div class="col-sm-4">
                    <label for="is_search_option" class="control-label">Field Involved In</label>
                    <div class="col-sm-12" style="padding-top:10px;">                    
                        <label class=""><input class="" name="is_search_option"  id="is_search_option" value="1" <?php echo ($is_search_option && !$is_primary_key)? 'checked="checked"':''; echo $is_primary_disabled; ?> type="checkbox" />&nbsp;Search </label> &nbsp;  
                        <label class=""><input class="" name="is_filters_option" id="is_filters_option" value="1" <?php echo ($is_filters_option && !$is_primary_key)? 'checked="checked"':''; echo $is_primary_disabled; ?> type="checkbox" />&nbsp;Filters </label> &nbsp; 
                        <label class=""><input class="" name="is_sorting_option" id="is_sorting_option" value="1" <?php echo ($is_sorting_option && !$is_primary_key)? 'checked="checked"':''; echo $is_primary_disabled; ?> type="checkbox" />&nbsp;Sorting </label> &nbsp; 
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <label for="other_attributes">Add Extra Attributes</label>
                    <input class="form-control" name="other_attributes" id="other_attributes" value="<?php echo $other_attributes?>" placeholder="Other Attributes" type="text" />
                </div> 
            </div>            
            <div class="form-group">
                <label for="validation_rules" class="col-sm-4 control-label">Set Validation Rules</label>
                <div class="col-sm-8">
                    <?php 
                      $isvrul_0 = $isvrul_1 = '';
                      $isValidation = 'isvrul_'. $validation_rules;
                      $$isValidation = ' selected="selected" ';
                    ?>
                    <select <?php echo $is_primary_disabled;?> id="validation_rules" name="validation_rules" class="form-control">
                        <option value="0" <?php echo $isvrul_0; ?> >No Validation</option>
                        <option value="1" <?php echo $isvrul_1; ?> >Set Validation Rules</option>
                    </select>
                </div>                
            </div>
            <div class="form-group" id="div_validation_rules">
                <label for="validation_rules_details" class="col-sm-4 control-label">Select Validation Rules </label>
                <div class="col-sm-8">                    
                    <select <?php echo $is_primary_disabled;?> class="form-control" name="validation_rules_details[]" id="validation_rules_details" multiple="multiple">
                    <?php
                     echo '<option value="" selected  > No Vadidation </option>';
                    $setRuleArr = explode('|', $validation_rules);
                    
                    foreach ($noParaValidationRulesArr as $key=>$rules) {
                        
                        $ruleSelected = (in_array($rules, $setRuleArr)) ? ' selected="selected" ' : '';
                        echo '<option value="'.$key.'" '.$ruleSelected.' >'.$rules.'</option>';
                    }
                    ?>
                    </select>
                </div>
            </div>
        </div>       
        
        <div id="formResultMessage"></div>
</div>
<div class="modal-footer">
    <a class="btn bg-blue waves-effect waves-light" id="btn_save_form_element_settings" >SAVE CHANGES</a>
    <a class="btn bg-red waves-effect waves-light" data-dismiss="modal">CLOSE</a>
    
</div>
</form>
 


<script>
    $(document).ready(function(){
    
        setFieldTypeOptions('<?php echo $field_type;?>');
        
        showhideValidationDiv($('#validation_rules').val());

<?php if($foreign_table_name) { ?>
        setForeignKeyValueCombo('<?php echo $foreign_table_name;?>'); 
<?php } ?> 
    
        setvaluesonload();
        
        $('#field_type').change(function() {
        
            var filedType = $(this).val();
           
            setFieldTypeOptions(filedType);

        });
    
        $('#is_foreign_key').change(function(){        
            setForeignKeyOption();        
        });
        
        $('#foreign_table_name').change(function(){ 
        
            var tableName = $(this).val();

            setForeignKeyValueCombo(tableName);

        }); //#foreign_table_name change event end.

    
    $('#unique_in_table').change(function(){ 
        
        var tableName = $(this).val();
        
        setUniqueInFieldCombo(tableName);
        
    });
    
       
    
    $('input[name=static_dropdown_options_type]').click(function(){        
        setStaticOptions();             
    });
    
    $('.static_option_input_checkbox').click(function(){
        
        var inputClass = $(this).attr('id');
        
        if($(this).is(':checked')){
            $('.'+inputClass).removeAttr('disabled');
        } else {
            $('.'+inputClass).attr('disabled','disabled');
        }
        
    });
    
    $('#include_in_insert').click(function(){
        setFieldStatusCombo();
    });
    $('#include_in_update').click(function(){
        setFieldStatusCombo();
    });
    
    
    $('#btn_save_form_element_settings').click(function(){
         
        var isValidate = true;
        var error_msg = '<ul>';
        var postData = 'action=saveFormElementSettings'; 
        
            postData = postData + '&id=' + $('#pid').val();
            postData = postData + '&am_id=' + $('#am_id').val();
            postData = postData + '&am_table_name=' + $('#am_table_name').val();
            postData = postData + '&field_name=' + $('#field_name').val();
            postData = postData + '&is_required=' + $('#is_required').val();            
            postData = postData + '&placeholder=' + $('#placeholder').val();            
            postData = postData + '&other_attributes=' + $('#other_attributes').val();            
              
        var field_label      = $('#field_label').val();
        var field_type       = $('#field_type').val();       
        var is_foreign_key   = $('#is_foreign_key').val();
        
        
        var validation_rules = [];
        var validation_rulesvalue = [];
        var i=0;
        $('.chk_simple_vrule:checked').each(function () {
            i++;
            validation_rules[i] = $(this).val();
        });
        
        var vrulekey = '';
        var vrulevalue = '';
        $('.chk_conditional_vrule:checked').each(function () {
            i++;
            vrulekey = $(this).val();
            if(vrulekey =='is_unique') {
                 vrulevalue = $('#unique_in_table').val() +'.'+  $('#unique_in_field').val() ;
            } else {
                vrulevalue = $('#vrule_'+vrulekey).val();                
            }
            validation_rules[i] =  vrulekey +'['+vrulevalue+']';
            
        }); 
       
          
        
        if(field_label == '') {
            error_msg = error_msg +'<li>Please select field label.</li>';
            $('#foreign_label_field').focus();
            isValidate = false;
        }
       if(field_type == '') {
            error_msg = error_msg +'<li>Please select field type.</li>';
            $('#foreign_label_field').focus();
            isValidate = false;
        }
        
        postData = postData + '&field_label=' + field_label;
        postData = postData + '&field_type=' + field_type; 
        postData = postData + '&validation_rules=' + JSON.stringify(validation_rules);
        postData = postData + '&is_foreign_key=' + is_foreign_key;
         
        if(is_foreign_key == '1') {
            var foreign_table_name = $('#foreign_table_name').val();
            var foreign_value_field = $('#foreign_value_field').val();
            var foreign_label_field = $('#foreign_label_field').val();
            
            if(foreign_table_name == '') {
                error_msg = error_msg +'<li>Please select foreign key table.</li>';
                $('#foreign_table_name').focus();
                isValidate = false;
            }
            if(foreign_value_field == '') {
                error_msg = error_msg +'<li>Please select foreign key value field</li>';
                $('#foreign_value_field').focus();
                isValidate = false;
            }
            if(foreign_label_field == '') {
                error_msg = error_msg +'<li>Please select foreign key label field.</li>';
                $('#foreign_label_field').focus();
                isValidate = false;
            }
            
            postData = postData + '&foreign_table_name=' + foreign_table_name;
            postData = postData + '&foreign_value_field=' + foreign_value_field;
            postData = postData + '&foreign_label_field=' + foreign_label_field;
        }        
         
        var static_dropdown_options_type = $('input[name="static_dropdown_options_type"]:checked').val();
            postData = postData + '&static_dropdown_options_type=' + static_dropdown_options_type;
        
        if(static_dropdown_options_type == 'json') {
            var static_dropdown_options_json = $('#static_dropdown_options_json').val();
            postData = postData + '&static_dropdown_options_json=' + static_dropdown_options_json;
        }
         
        if(static_dropdown_options_type == 'array') {
            var staticOptions = [];
            var chkid = '';
            var solabel = '';
            var sovalue = '';
            var soids = '';
            
            $(".static_option_input_checkbox:checked").each(function() {
                chkid = this.value;
                
                solabel = $('#static_option_label_'+chkid).val();
                sovalue = $('#static_option_value_'+chkid).val();
                
               staticOptions[solabel] = sovalue;
               
                if(solabel != '' && sovalue != '') {
                    soids = ((soids == '') ? '' : soids + ',' ) + chkid;
                    postData = postData + '&static_option_label_'+chkid+'=' + solabel;
                    postData = postData + '&static_option_value_'+chkid+'=' + sovalue;
                }               
            });
            postData = postData + '&staticOptions=' + JSON.stringify(staticOptions);
            postData = postData + '&soids=' + soids;
        }
         
        var include_in_insert = ($('input[name="include_in_insert"]').is(":checked")) ? 1 : 0;
        var include_in_update = ($('input[name="include_in_update"]').is(":checked")) ? 1 : 0;
        var display_in_list   = ($('input[name="display_in_list"]').is(":checked"))   ? 1 : 0;
        
        postData = postData + '&include_in_insert=' +  include_in_insert;
        postData = postData + '&include_in_update=' +  include_in_update;
        postData = postData + '&display_in_list='   +  display_in_list;
        
        var status_in_insert = (include_in_insert == 1) ? $('#status_in_insert').val() : 'none';
        var status_in_update = (include_in_update == 1) ? $('#status_in_update').val() : 'none';
        
        postData = postData + '&default_value='     + $('#default_value').val();
        postData = postData + '&status_in_insert='  + status_in_insert;        
        postData = postData + '&status_in_update='  + status_in_update;
       // postData = postData + '&can_update='        + $('#can_update').val();
        postData = postData + '&am_extra='          + $('#am_extra').val();
        postData = postData + '&form_field_order='  + $('#form_field_order').val();
        
        if(include_in_insert == 0 && include_in_update == 0) {
            postData = postData + '&minlength=' + '0';
            postData = postData + '&maxlength=' + '0';
        } else {
            postData = postData + '&minlength=' + $('#minlength').val();
            postData = postData + '&maxlength=' + $('#maxlength').val();
        }
        
        var is_search_option  = ($('input[name="is_search_option"]').is(":checked"))  ? 1 : 0;
        var is_filters_option = ($('input[name="is_filters_option"]').is(":checked")) ? 1 : 0;
        var is_sorting_option = ($('input[name="is_sorting_option"]').is(":checked")) ? 1 : 0;
        
        postData = postData + '&is_search_option='  + is_search_option;
        postData = postData + '&is_filters_option=' + is_filters_option;
        postData = postData + '&is_sorting_option=' + is_sorting_option; 
        
        if(isValidate === false)
        {
            error_msg = error_msg +'</ul>';
            
             $('#formResultMessage').html('<div class="alert alert-danger">'+error_msg+'</div>');
        } else {
            
            $('#formResultMessage').html('<div class="alert alert-info">Please wait! Data submitting...</div>')
            
            var PageName = localStorage.getItem('base_url') + 'admin/cruds/submit_element_setting';            
            
            $.ajax({
                type: "POST",
                url: PageName,
                data: postData,
                success: function(jsonData){
                     
                    var objResult = jQuery.parseJSON( jsonData );
                    
                    if(objResult.status=='ERROR'){
                        $('#formResultMessage').html('<div class="alert alert-danger">'+objResult.msg+'</div>');
                    }
                    if(objResult.status=='SUCCESS'){
                        $('#formResultMessage').html('<div class="alert alert-success">'+objResult.msg+'</div>');
                        $('#setting_form').hide();
                        $('#btn_save_form_element_settings').hide();
                        
                        setTimeout(function(){ 
                            location.reload();
                        }, 2000);
                    }
                }
            });
        }
        
    });
    
    $('#validation_rules').change(function(){
        
        showhideValidationDiv($(this).val());
         
    });
    
    $('.chk_conditional_vrule').click(function(){
        
      var vrule =  $(this).val();      
     
      if($(this).prop('checked')){          
          $('.vrule_condition_'+vrule).removeAttr('disabled');
          $('.parent_'+vrule).removeClass('bg-gray');
          $('.parent_'+vrule).addClass('bg-green-active');
      } else {
         $('.vrule_condition_'+vrule).attr('disabled', 'disabled'); 
         $('.parent_'+vrule).removeClass('bg-green-active');
         $('.parent_'+vrule).addClass('bg-gray');
      }      
      
    });
    
    $('.chk_simple_vrule').click(function(){
        
      var vrule =  $(this).val();     
     
      if($(this).prop('checked')){          
           
          $('.parent_'+vrule).removeClass('bg-gray');
          $('.parent_'+vrule).addClass('bg-green-active');
      } else {
          
         $('.parent_'+vrule).removeClass('bg-green-active');
         $('.parent_'+vrule).addClass('bg-gray');
      }    
    });
 
 });
    
    
    function setvaluesonload(){
        
        setTimeout(function(){
           
            $('#foreign_table_name').val('<?php echo $foreign_table_name;?>');
            $('#foreign_value_field').val('<?php echo $foreign_value_field;?>');
            $('#foreign_label_field').val('<?php echo $foreign_label_field;?>');
           
        }, 1000);
        
    }
    
</script>


