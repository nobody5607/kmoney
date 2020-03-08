<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Moneys */

$this->title = 'Create Moneys';
$this->params['breadcrumbs'][] = ['label' => 'Moneys', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="moneys-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
