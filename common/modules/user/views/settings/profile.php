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
use dektrium\user\helpers\Timezone;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\Profile $model
 */

$this->title = Yii::t('_user', 'Profile settings');
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<div class="container">
    <div class="row">
        <?= $this->render('_menu') ?>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4> <?= Html::encode($this->title) ?></h4>
                </div>
                <div class="card-body">

                    <div class="col-md-12">
                        <div class="">

                            <div class="">
                                <?php $form = ActiveForm::begin([
                                    'id' => 'profile-form',
                                    'options' => ['class' => 'form-horizontal'],

                                    'enableAjaxValidation' => true,
                                    'enableClientValidation' => false,
                                    'validateOnBlur' => false,
                                ]); ?>

                                <?= $form->field($model, 'firstname') ?>
                                <?= $form->field($model, 'lastname') ?>

                                <?= $form->field($model, 'public_email') ?>
                                <?= $form->field($model, 'tel')->textInput();?>

                                <?= $form->field($model, 'bank')
                                    ->dropDownList(\yii\helpers\ArrayHelper::map(\backend\models\Bank::find()->all(),'id','name'),[
                                        'prompt'=>'เลือกธนาคาร...'
                                    ])->label('ธนาคาร') ?>
                                <?= $form->field($model, 'accountNumber')->label('เลขที่บัญชี') ?>
                                <?= $form->field($model, 'accountName')->label('ชื่อบัญชี') ?>
                                <?= $form->field($model, 'lineToken')->hiddenInput()->label(false) ?>


                                <div class="form-group field-profile-bio">
                                    <label class="col-lg-3 control-label" for="profile-bio"><?= Yii::t('appmenu', 'Role') ?></label>
                                    <div class="col-lg-9">
                                        <?php
                                        $user_id = isset(Yii::$app->user->id) ? Yii::$app->user->id : '';
                                        $roles = \cpn\chanpan\classes\CNRoles::getAuthAssign($user_id);
                                        foreach ($roles as $k => $v) {
                                            echo "<div style='margin-top:10px;'>{$v}</div> ";
                                        }
                                        ?>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="">
                                        <?= Html::submitButton(Yii::t('_user', 'Save'), ['class' => 'btn btn-block btn-success btn-lg']) ?>
                                        <br>
                                    </div>
                                </div>

                                <?php ActiveForm::end(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
