<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Custom Method Error | <?= $Settings->site_name?></title>
    <!-- Favicon-->
    <link rel="icon" href="<?= $assets?>favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="<?= $assets?>plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Custom Css -->
    <link href="<?= $assets?>css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="<?= $assets?>css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-red">    

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2 class="alert alert-info"><?=$method_error?></h2>
                <br/>
                
                <div style="text-align: center;" ><button class="button button-primary" onclick="history.back(-1)">Go Back</button></div>
            </div>
        </div>
    </section>

   
</body>

</html>