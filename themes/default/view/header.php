<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?= @$page_title?> | <?= $Settings->site_name?></title>
  <!-- Favicon-->
  <link rel="icon" href="<?= $assets?>favicon.ico" type="image/x-icon">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?= $assets?>bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= $assets?>bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?= $assets?>bower_components/Ionicons/css/ionicons.min.css">
  
  
  <?php
  
    if(isset($load_css)) {
         
        if(is_array($load_css)) {
            foreach ($load_css as $key => $reff) {
                if(is_array($reff)) {
                    foreach ($reff as $key1 => $value) {
                        
                        $cssmedia = ($key1 === 'media-print') ? str_replace('-', '=', $key1) : '';

                        echo '<link rel="stylesheet" href="'.$assets. $value.'" />';
                    } 
                } else {
                    
                    $cssmedia = ($key == 'media-print') ? str_replace('-', '="', $key) . '"' : '';

                    echo '<link rel="stylesheet" href="'.$assets . $reff.'"  />';
                }
            }
        }
    }
  ?>
  
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= $assets?>dist/css/AdminLTE.min.css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<?= $assets?>dist/css/_all-skins.min.css" />

  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <!-- Custom CSS -->
  <link rel="stylesheet" href="<?= $assets?>custom/style.css">
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">