<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\RecoveryForm $model
 */

$this->title = Yii::t('user', 'Reset your password');
$this->params['breadcrumbs'][] = $this->title;
?>



<br>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-4">

            <div class="">
                <div style="margin-bottom:30px;">

                </div>
                <div class="">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><?= Html::encode($this->title) ?></h3>
                        </div>
                        <div class="panel-body">
                            <?php $form = ActiveForm::begin([
                                'id' => 'password-recovery-form',
                                'enableAjaxValidation' => true,
                                'enableClientValidation' => false,
                            ]); ?>

                            <?= $form->field($model, 'password')->passwordInput()->label('รหัสผ่านใหม่') ?>

                            <?= Html::submitButton(Yii::t('user', 'Finish'), ['class' => 'btn btn-success btn-block']) ?><br>

                            <?php ActiveForm::end(); ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


