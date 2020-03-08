<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Moneys */

$this->title = 'Update Moneys: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Moneys', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="moneys-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
