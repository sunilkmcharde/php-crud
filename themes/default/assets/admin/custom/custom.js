$(document).ready(function(){
     
        
    //Initialize Select2 Elements
    $('.select2').select2();
	
	
    $('[data-toggle="tooltip"]').tooltip(); 

    resetOptions();
    
     
    
});

function showhideValidationDiv(status){
    
    if(status == 1){            
        $('#div_validation_rules').show();
        $('#div_validation_rules_title').show();
    } else {            
        $('#div_validation_rules').hide();
        $('#div_validation_rules_title').hide();
    }
}

function setForeignKeyValueCombo(tableName) {
    
    var postData = 'action=getTableFieldsOptions';

        postData = postData + '&table=' + tableName ;
        
        var PageName = localStorage.getItem('base_url') + 'admin/cruds/ajax_request';
        
        $.ajax({
            type: "POST",
            url: PageName,
            data: postData,
            success: function (Data) {
                $('#foreign_value_field').html(Data);
                $('#foreign_label_field').html(Data);                 
            }
        });
}

function setUniqueInFieldCombo(tableName) {
    
    var postData = 'action=getTableFieldsOptions';

        postData = postData + '&table=' + tableName ;
        
    var PageName = localStorage.getItem('base_url') + 'admin/cruds/ajax_request';
    
        $.ajax({
            type: "POST",
            url: PageName,
            data: postData,
            success: function (Data) {
                $('#unique_in_field').html(Data);                               
            }

        });
}

function setFieldTypeOptions(filedType){
    
    switch(filedType){           
        
            case 'select':
            case 'select_multiple':
                $('#div_is_foreign_key').show();                 
                setForeignKeyOption();                
               break;
           
            case 'radio':
            case 'checkbox':                  
                  $('#div_static_dropdown_options').show();                  
                  setStaticOptions();
                break;
               
            default:
                resetOptions();
            
        }//end switch.
}

function resetOptions(){
    
    $('#div_is_foreign_key').hide();
    $('#div_foreign_table_info').hide();
    $('#div_static_dropdown_options').hide();
    $('.static_dropdown_options_input').hide();
    
     setFieldStatusCombo();
}

function setFieldStatusCombo(){
  /*  
   var field_type = $('#field_type').val();
   var statusInsertVal = 'active';
   var statusUpdateVal = 'active';
   $('#include_in_insert').removeAttr('readonly');
   $('#include_in_update').removeAttr('readonly');
   $('#include_in_insert').prop('checked' , true);
   $('#include_in_update').prop('checked' , true);
   
   switch(field_type){
       
        case 'hidden':            
             
            $('#include_in_insert').attr('readonly', 'readonly');
            $('#include_in_update').attr('readonly', 'readonly');
            statusInsertVal = 'hidden';
            statusUpdateVal = 'hidden';
            
            break;
            
        case '':
            
            $('#include_in_insert').prop('checked' , false);
            $('#include_in_update').prop('checked' , false);
            $('#include_in_insert').attr('readonly', 'readonly');
            $('#include_in_update').attr('readonly', 'readonly');
            statusInsertVal = 'none';
            statusUpdateVal = 'none';
            break;
            
        default:
           
            
            break;
   }
    
    
    if($('input[name="include_in_insert"]').is(":checked"))
    {
        $('#status_in_insert').removeAttr('disabled');
        $('#default_value').removeAttr('disabled');
         
        $('#status_in_insert').val(statusInsertVal);
        
         
    } else {
        $('#status_in_insert').attr('disabled', 'disabled');
        $('#default_value').attr('disabled', 'disabled');
        $('#status_in_insert').val('none');
    }
    
    if($('input[name="include_in_update"]').is(":checked"))
    {
        $('#status_in_update').removeAttr('disabled');
         
        $('#status_in_update').val(statusUpdateVal);
        
    } else {
        $('#status_in_update').attr('disabled', 'disabled');  
        $('#status_in_update').val('none');
    }
    
    $('#status_in_insert option[selected="selected"]').removeAttr('selected');
    $('#status_in_insert option[value="'+statusInsertVal+'"]').attr('selected' , 'selected');
    $('#status_in_update option[selected="selected"]').removeAttr('selected');
    $('#status_in_update option[value="'+statusUpdateVal+'"]').attr('selected' , 'selected');
    
    if(!$('input[name="include_in_update"]').is(":checked") && !$('input[name="include_in_insert"]').is(":checked")) {
        $('#minlength').attr('disabled', 'disabled');  
        $('#maxlength').attr('disabled', 'disabled');
        $('#minlength').val('');
        $('#maxlength').val('');
    } else {
        $('#minlength').removeAttr('disabled');
        $('#maxlength').removeAttr('disabled');
        $('#minlength').val('1');
        $('#maxlength').val('255');
    }
   */ 
    
    
}

function setForeignKeyOption(){
    
    if($('#is_foreign_key').val() == 1){
        $('#div_static_dropdown_options').hide();
        $('.static_dropdown_options_input').hide();
        $('#div_foreign_table_info').show();                    
    } else {
        $('#div_foreign_table_info').hide();
        $('#div_static_dropdown_options').show(); 
        setStaticOptions();
    }
}

function setStaticOptions(){
    
    if($('#field_type').val()!='select' && $('#field_type').val()!='select_multiple') {
        $('#is_foreign_key').val(0);
        $('#div_is_foreign_key').hide();
        $('#div_foreign_table_info').hide();
    } 
    
    $('.static_dropdown_options_input').hide('slow');
    var staticOptionInputType = $('input[name=static_dropdown_options_type]:checked').val();    
    $('#static_dropdown_options_type_'+staticOptionInputType).show('slow');
} 

function setForm(ID, Table) {
    
    var postData = 'action=elementForm';

    postData = postData + '&id=' + ID;

    postData = postData + '&table=' + Table;
    
   var PageName = localStorage.getItem('base_url') + 'admin/cruds/manage_element_setting';
    
    $.ajax({
        type: "POST",
        url: PageName,
        data: postData,

        beforeSend: function () {
            $('#modal_body').html('<i class="fa fa-refresh fa-spin text-info" ></i>');
        },
        success: function (jsonData) {
          
            $('#modal_body').html(jsonData);
         
          /*  var obj = $.parseJSON(jsonData);

            if (obj.status == 'ERROR') {
                $('#modal_body').html(obj.msg);
            }

            if (obj.status == 'SUCCESS')
            {
                $('#modal_body').html(obj.result);
            }*/
        }

    });

}


