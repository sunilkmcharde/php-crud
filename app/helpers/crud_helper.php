<?php

function crud_define_tables(){

    define('AM_ELEMENTS'                , 'am_elements');
    define('AM_ELEMENTS_TYPE'           , 'am_elements_type');
    define('AM_VALIDATION_RULES'        , 'am_elements_validation_rules');
    define('AM_FORMS'                   , 'am_forms');

    define('CRUD_ADMIN_USERS'           , 'am_admin_users');
    define('CRUD_ADMIN_USERS_GROUP'     , 'am_admin_users_group');

    define('CRUD_ELEMENTS'          , 'crud_elements');    
    define('CRUD_MASTERS'           , 'crud_masters');
    
}


  
function load_crud_pannel($active_tab='',$cruds) {
        
        $$active_tab = isset($active_tab)? 'active' :'';
        $short_code = $cruds['short_code'];
    ?>
        <!-- Nav tabs -->
        <ul  class="nav nav-tabs" >
            <li class="<?= @$structure?>">
                <a href="<?= base_url('admin/cruds/structure/'.$short_code);?>">
                    <i class="fa fa-list"></i> Structure
                </a>
            </li>
        <?php if(!$cruds['is_custom_form']) { ?>
            <li class="<?= @$datalist?>">
                <a href="<?= base_url('admin/cruds/datalist/'.$short_code);?>">
                    <i class="fa fa-list"></i> List
                </a>
            </li>            
            <li class="<?= @$insertdata?>">
                <a href="<?= base_url('admin/cruds/insertdata/'.$short_code);?>">
                    <i class="fa fa-plus"></i> Insert
                </a>
            </li>
       <?php } else { ?>
            <li class="<?= @$customform?>">
                <a href="<?= base_url('admin/cruds/create_custom_form/');?>">
                    <i class="fa fa-plus"></i> New Custom Form
                </a>
            </li>            
        <?php } ?>
            <li  class="<?= @$settings?>">
                <a href="<?= base_url('admin/cruds/settings/'.$short_code);?>">
                    <i class="fa fa-gear"></i> Form Settings
                </a>
            </li>
            <li  class="<?= @$masterform?>">
                <a href="<?= base_url('admin/cruds/masterform/'.$short_code);?>/insert">
                    <i class="fa fa-list"></i> Form View
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
    <?php
    }
    
    
?>