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
 

$this->title = Yii::t('user', 'Sign up');
$this->params['breadcrumbs'][] = $this->title;

?>
<?php
$form = ActiveForm::begin([
            'id' => $model->formName(),
                //'enableAjaxValidation' => true,
                //'validationUrl'=> yii\helpers\Url::to(['/user/registration/validate-url'])
                //'enableClientValidation' => false,
        ]);
?>
<br>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-4">
            <h3 class="text-center"><?= Html::encode($this->title) ?></h3>
            <div class="card">
                <div class="card-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <?php if (Yii::$app->session->hasFlash('error')): ?>
                                <div class="alert alert-danger alert-dismissable">
                                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i> <?= Yii::$app->session->getFlash('error') ?>
                                </div>
                            <?php endif; ?>



                            <?= $form->field($model, 'email') ?>

                            <?= $form->field($model, 'username') ?>

                            <?php if ($module->enableGeneratingPassword == false): ?>
                                <?= $form->field($model, 'password')->passwordInput() ?>
                                <?= $form->field($model, 'confirm_password')->passwordInput() ?>
                            <?php endif ?>
                            <div class="row">
                                <div class="col-md-12">
                                        <?= $form->field($model, 'firstname') ?>
                                        <?= $form->field($model, 'lastname') ?>
                                </div>
                            </div>

                            <?= $form->field($model, 'telephone')->widget(\yii\widgets\MaskedInput::className(), [
                                'mask' => '9999999999',
                            ]) ?>
                            <?= Html::submitButton(Yii::t('user', 'Sign up'), ['class' => 'btn btn-success btn-block', 'id'=>'btnSubmit']) ?>


                        </div>
                    </div>
                    <p class="text-center">
                        <?= Html::a(Yii::t('user', 'Already registered? Sign in!'), ['/user/security/login']) ?>
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>

<?php ActiveForm::end(); ?>
 