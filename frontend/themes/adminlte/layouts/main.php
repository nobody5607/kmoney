<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use yii\helpers\Url;
\frontend\themes\adminlte\assets\AdminLteAssets::register($this);
\cpn\chanpan\assets\SweetAlertAsset::register($this);
$baseUrl = $this->theme->baseUrl;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <?php Yii::$app->meta->displaySeo() ?>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>

        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <?php $this->head() ?>
        <link href="<?= $baseUrl; ?>/css/site.css" rel="stylesheet">
    </head>
    <body class="hold-transition layout-top-nav">
        <?php $this->beginBody() ?>
        <div class="wrapper">
            <?php if(!Yii::$app->user->isGuest):?>
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand-md navbar-dark navbar-lightblue">
                <div class="container">
                    <a href="<?= Url::to(['/myaccount/summary'])?>" class="navbar-brand">

                        <span class="brand-text font-weight-light">AdminLTE 3</span>
                    </a>

                    <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse order-3" id="navbarCollapse">
                        <!-- Left navbar links -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a href="<?= Url::to(['/myaccount/summary'])?>" class="nav-link">สรุป</a>
                            </li>
                            <li class="nav-item">
                                <a href="<?= Url::to(['/myaccount/transactions'])?>" class="nav-link">กิจกรรม</a>
                            </li>

                            <li class="nav-item">
                                <a href="<?= Url::to(['/myaccount/help'])?>" class="nav-link">ความช่วยเหลือ</a>
                            </li>

                        </ul>


                    </div>

                    <!-- Right navbar links -->
                    <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                        <!-- Messages Dropdown Menu -->
                        <!-- Notifications Dropdown Menu -->
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" href="#">
                                <i class="far fa-bell"></i>
                                <span class="badge badge-warning navbar-badge">15</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                                <span class="dropdown-header">15 Notifications</span>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-envelope mr-2"></i> 4 new messages
                                    <span class="float-right text-muted text-sm">3 mins</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-users mr-2"></i> 8 friend requests
                                    <span class="float-right text-muted text-sm">12 hours</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-file mr-2"></i> 3 new reports
                                    <span class="float-right text-muted text-sm">2 days</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<?= Url::to(['user/settings/profile'])?>"><i
                                        class="fas fa-cog"></i></a>
                        </li>

                        <li class="nav-item">
                            <a href="<?= Url::to(['/user/logout'])?>" data-method="post" class="nav-link">ออกจากระบบ</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <?php endif; ?>
            <!-- /.navbar -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->

                <!-- /.content-header -->

                <!-- Main content -->
                <div class="content">
                    <?= $content; ?>
                </div>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->



            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="float-right d-none d-sm-inline">
                    Anything you want
                </div>
                <!-- Default to the left -->
                <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
            </footer>
        </div>
        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
