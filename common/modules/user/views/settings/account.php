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
 * @var dektrium\user\models\SettingsForm $model
 */

$this->title = Yii::t('user', 'Account settings');
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>
<div class="container">

    <div class="row">
        <div class="col-md-12">
            <?= $this->render('_menu') ?>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="panel-title"><?= Html::encode($this->title) ?></h4>
                </div>
                <div class="card-body">
                    <?php $form = ActiveForm::begin([
                        'id' => 'account-form',
                        'options' => ['class' => 'form-horizontal'],

                        'enableAjaxValidation' => true,
                        'enableClientValidation' => false,
                    ]); ?>

                    <?= $form->field($model, 'email') ?>

                    <?= $form->field($model, 'username') ?>

                    <?= $form->field($model, 'new_password')->passwordInput() ?>
                    <?= $form->field($model, 'confirm_new_password')->passwordInput() ?>

                    <hr/>

                    <?= $form->field($model, 'current_password')->passwordInput() ?>

                    <div class="form-group">
                        <div class="">
                            <?= Html::submitButton(Yii::t('user', 'Save'), ['class' => 'btn btn-block btn-success']) ?><br>
                        </div>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>

            <?php if ($model->module->enableAccountDelete): ?>
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?= Yii::t('user', 'Delete account') ?></h3>
                    </div>
                    <div class="panel-body">
                        <p>
                            <?= Yii::t('user', 'Once you delete your account, there is no going back') ?>.
                            <?= Yii::t('user', 'It will be deleted forever') ?>.
                            <?= Yii::t('user', 'Please be certain') ?>.
                        </p>
                        <?= Html::a(Yii::t('user', 'Delete account'), ['delete'], [
                            'class' => 'btn btn-danger',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure? There is no going back'),
                        ]) ?>
                    </div>
                </div>
            <?php endif ?>
        </div>

    </div>
</div>
