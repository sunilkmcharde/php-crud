<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?= @$page_title?> | Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?= $assets ?>bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= $assets ?>bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?= $assets ?>bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= $assets ?>dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?= $assets ?>plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>

<body class="hold-transition login-page">
    <noscript>
        <div class="global-site-notice noscript">
            <div class="notice-inner">
                <p>
                    <strong>JavaScript seems to be disabled in your browser.</strong><br>You must have JavaScript enabled in
                    your browser to utilize the functionality of this website.
                </p>
            </div>
        </div>
    </noscript>
    <div class="page-back">
        
        <div class="login-box">
  <div class="login-logo">
    <a href="#"><b>PHP</b> CRUD</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <?php echo form_open("admin/login", 'class="login"'); ?>
      <div class="form-group has-feedback">
          <input type="text" name="identity" value="A2gNq4n7" class="form-control" required="required"  placeholder="Username" />
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password"  value="A2gNq4n7" required="required" class="form-control" name="password" placeholder="Password" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <?php echo form_checkbox('remember', '1', FALSE, 'id="remember"'); ?> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    <?php echo form_close(); ?>    

    <a href="#">I forgot my password</a><br>
    
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
       

        <div id="forgot_password" style="display: none;">
            <div class=" container">
                <div class="login-form-div">
                    <div class="login-content">
                        <?php 
                        if ($error) { 
                            ?>
                            <div class="alert alert-danger">
                                <button data-dismiss="alert" class="close" type="button">×</button>
                                <ul class="list-group"><?= $error; ?></ul>
                            </div>
                            <?php 
                        }
                        if ($message) { 
                            ?>
                            <div class="alert alert-success">
                                <button data-dismiss="alert" class="close" type="button">×</button>
                                <ul class="list-group"><?= $message; ?></ul>
                            </div>
                            <?php 
                        } 
                        ?>
                        <div class="div-title col-sm-12">
                            <h3 class="text-primary"><?= lang('forgot_password') ?></h3>
                        </div>
                        <?php echo form_open("auth/forgot_password", 'class="login" data-toggle="validator"'); ?>
                        <div class="col-sm-12">
                            <p>
                                <?= lang('type_email_to_reset'); ?>
                            </p>
                            <div class="textbox-wrap form-group">
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-envelope"></i></span>
                                    <input type="email" name="forgot_email" class="form-control "
                                    placeholder="<?= lang('email_address') ?>" required="required"/>
                                </div>
                            </div>
                            <div class="form-action">
                                <a class="btn btn-success pull-left login_link" href="#login">
                                    <i class="fa fa-chevron-left"></i> <?= lang('back') ?>
                                </a>
                                <button type="submit" class="btn btn-primary pull-right">
                                    <?= lang('submit') ?> &nbsp;&nbsp; <i class="fa fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                        <?php echo form_close(); ?>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <?php 
        if ($Settings->allow_reg) {
            ?>
            <div id="register">
                <div class="container">
                    <div class="registration-form-div reg-content">
                        <?php echo form_open("auth/register", 'class="login" data-toggle="validator"'); ?>
                        <div class="div-title col-sm-12">
                            <h3 class="text-primary"><?= lang('register_account_heading') ?></h3>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('first_name', 'first_name'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-user"></i></span>
                                    <input type="text" name="first_name" class="form-control " placeholder="<?= lang('first_name') ?>" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('last_name', 'last_name'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-user"></i></span>
                                    <input type="text" name="last_name" class="form-control " placeholder="<?= lang('last_name') ?>" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('company', 'company'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-building"></i></span>
                                    <input type="text" name="company" class="form-control " placeholder="<?= lang('company') ?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('phone', 'phone'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-phone-square"></i></span>
                                    <input type="text" name="phone" class="form-control " placeholder="<?= lang('phone') ?>" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('username', 'username'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-user"></i></span>
                                    <input type="text" name="username" class="form-control " placeholder="<?= lang('username') ?>" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?= lang('email', 'email'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-envelope"></i></span>
                                    <input type="email" name="email" class="form-control " placeholder="<?= lang('email_address') ?>" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?php echo lang('password', 'password1'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-key"></i></span>
                                    <?php echo form_password('password', '', 'class="form-control tip" id="password1" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" data-bv-regexp-message="'.lang('pasword_hint').'"'); ?>
                                </div>
                                <span class="help-block"><?= lang('pasword_hint') ?></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <?php echo lang('confirm_password', 'confirm_password'); ?>
                                <div class="input-group">
                                    <span class="input-group-addon "><i class="fa fa-key"></i></span>
                                    <?php echo form_password('confirm_password', '', 'class="form-control" id="confirm_password" required="required" data-bv-identical="true" data-bv-identical-field="password" data-bv-identical-message="' . lang('pw_not_same') . '"'); ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <a href="#login" class="btn btn-success pull-left login_link">
                                <i class="fa fa-chevron-left"></i> <?= lang('back') ?>
                            </a>
                            <button type="submit" class="btn btn-primary pull-right">
                                <?= lang('register_now') ?> <i class="fa fa-user"></i>
                            </button>
                        </div>

                        <?php echo form_close(); ?>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        <?php
        }
        ?>
    </div>

    <script src="<?= $assets ?>js/jquery.js"></script>
    <script src="<?= $assets ?>js/bootstrap.min.js"></script>
    <script src="<?= $assets ?>js/jquery.cookie.js"></script>
    <script src="<?= $assets ?>js/login.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            localStorage.clear();
            var hash = window.location.hash;
            if (hash && hash != '') {
                $("#login").hide();
                $(hash).show();
            }
        });
    </script>
</body>
</html>
