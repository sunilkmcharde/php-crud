<section class="content">
    <div class="container-fluid">
        <!-- Tabs With Icon Title -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Sorry ! But you have in trouble.
                            </h2>
                            
                        </div>
                        <div class="body">
                            <!-- Nav tabs -->
                            <div class="alert alert-danger"><?= $error_message?></div> 
                            <!-- Tab panes -->
                            <div class="box">
                                <a class="btn btn-primary" onclick="history.back(-1);" >Go Back</a>
                                <a class="btn btn-info" href="<?= base_url('admin/dashboard')?>" >Go Home</a>                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Tabs With Icon Title -->
    </div>
</section>