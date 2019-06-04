<section>
    <?php
        if($show_sidebar_left) {
    ?>
        <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

       

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="<?= base_url('admin')?>"><i class="fa fa-link"></i> <span>Dashboard</span></a></li>        
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>DB Master Forms</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="<?= base_url('admin/cruds/')?>" style="color:#0000ff;">DB Tables List <i class="fa fa-list"></i></a></li>
            <?php
                $i = 0;
                if(is_array($crudDbMasters)) {
                    foreach ($crudDbMasters as $table) {                       
                        if(!$table['is_active']) { continue; }
                        if($table['is_custom_form']) { continue; }
              ?>
                    <li><a href="<?= base_url('admin/cruds/structure/'.$table['short_code'])?>"><?php echo $table['form_title'];?></a></li>
              <?php
                    }
                } else {
                    echo '<li class="text-red text-center">Masters Form Not Available</li>';
                }
           ?>  
          </ul>
        </li>
        <li class="treeview">
            <a href="#"><i class="fa fa-link"></i> <span>Custom Forms </span>
            <span class="pull-right-container">                
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="<?= base_url('admin/cruds/custom_forms/')?>" style="color:#0000ff;">Custom Form List <i class="fa fa-list"></i></a></li>
              <li><a href="<?= base_url('admin/cruds/create_custom_form/')?>" style="color:#0000ff;">Create Custom Form <i class="fa fa-plus"></i></a></li>
              
            <?php
                 $i = 0;
                 if(is_array($crudCustomForms)) {
                    foreach ($crudCustomForms as $key=>$custform) {
                        if(!$custform['is_active']) { continue; }
           ?>
                 <li><a href="<?= base_url('admin/cruds/structure/'.$key)?>"><?php echo $custform['form_title'];?></a></li>
           <?php
                    }//end foreach
                 }//end if.
           ?>  
          </ul>
        </li>
         <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>Crud Masters</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <?php
                $i = 0;
                if(is_array($crudDbMasters)) {
                    foreach ($crudDbMasters as $table) {                       
                        if(!$table['is_active']) { continue; }
                        $formlink = $table['is_custom_form'] ? 'admin/masters/addnew/'.$table['short_code'] : 'admin/masters/view/'.$table['short_code'] ;
              ?>
                    <li><a href="<?= base_url($formlink)?>"><?php echo $table['form_title'];?></a></li>
              <?php
                    }
                } else {
                    echo '<li class="text-red text-center">Masters Not Available</li>';
                }
           ?>  
          </ul>
        </li>
      </ul>
      
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside> 
         
    <?php
        }
    ?>
    <?php
        if($show_sidebar_right) {
    ?>
         <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
    <?php
        }
    ?>
</section>