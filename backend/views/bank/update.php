<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bank */

$this->title = 'Update Bank: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Banks', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bank-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
