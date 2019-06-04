   
 <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want <b>Version</b> 1.0.0
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2019 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

 
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<script>

    localStorage.setItem('base_url', '<?php echo base_url(); ?>');

</script> 

<!-- jQuery 3 -->
<script src="<?= $assets?>bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<?= $assets?>bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 3.3.7 -->
<script src="<?= $assets?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->


 
<?php

    if(isset($load_js)) {
        $custom = ''; 
        if(is_array($load_js)) {
            foreach ($load_js as $key => $reff) {
                if(is_array($reff)) {
                    foreach ($reff as $key1 => $value) {
                        if($key1 === 'custom') {
                            $custom .= '<script src="'.$assets . $value.'" ></script>';
                        } else {
                            echo '<script src="'.$assets. $value.'" ></script>';
                        }                        
                    } 
                } else {
                    if($key === 'custom') {
                        $custom .= '<script src="'.$assets . $reff.'" ></script>';
                    } else {
                    echo '<script src="'.$assets . $reff.'" ></script>';
                    }
                }
            }
        }
    }
  ?>
 
<script src="<?= $assets?>dist/js/adminlte.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
<script src="<?= $assets?>dist/js/demo.js"></script>
<!-- page script -->

<?php echo (isset($custom)) ? $custom : '';?>
 
<script>
<?php

if(isset($elementType) && is_array($elementType)){
    $css = ['input_advance'];
    $js = ['input_advance', 'custom'];
   foreach ($elementType as $element => $count) {

       if($count == 0) continue;

       switch($element) {
           case 'date':
               for($d=1; $d<=$elementCount['date']; $d++){
           ?>            
                   $('#datepicker_<?php echo $d;?>').datepicker({
                       autoclose: true,
                       format: 'yyyy-mm-dd',
                   });
           <?php
                } //end for
               break; 
           case 'datetime':
               for($dt=1; $dt<=$elementCount['datetime']; $dt++){
            ?>            
                    $('#datetimepicker_<?php echo $dt;?>').datetimepicker({
                        format: 'YYYY-MM-DD H:m:s',
                        sideBySide: true
                    });
            <?php
                } //end for
               break;                    
           case 'daterange':                        
               
               break;
           case 'time':
           case 'timepicker':
             
               if($elementCount['timepicker']){
           ?>   
                $('.timepicker').timepicker({
                   showInputs: false,
                    defaultTime: 'value',
                    minuteStep: 5,
                    disableFocus: true,
                    template: 'dropdown',
                    showMeridian:false,
                })
           <?php
               } //end if           
               
               break;
           case 'colorpicker':                        
               
               break;
           case 'editor':                        
               
               break;
           case 'input_mask':
               
               break;                   
       }//end switch.
   }//end foreach.
}//end if.
?>
    $('.bootstrap-timepicker-widget').addClass('bg-gray');
    $('.datepicker').addClass('bg-gray');
</script>

</body>
</html>