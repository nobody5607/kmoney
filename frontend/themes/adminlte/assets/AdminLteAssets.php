<?php

namespace frontend\themes\adminlte\assets;

use yii\web\AssetBundle;
class AdminLteAssets extends AssetBundle{
    public $sourcePath = '@frontend/themes/adminlte/assets';
     public $css = [
        'plugins/fontawesome-free/css/all.min.css',
        'dist/css/adminlte.min.css',
    ];

    public $js = [
      'plugins/jquery/jquery.min.js',
      'plugins/bootstrap/js/bootstrap.bundle.min.js',
      'dist/js/adminlte.min.js'
    ];

    public $depends = [
      'yii\web\YiiAsset',
      'yii\bootstrap4\BootstrapAsset',
        //'yii\web\YiiAsset',
        //'yii\bootstrap\BootstrapAsset',
    ];
}
