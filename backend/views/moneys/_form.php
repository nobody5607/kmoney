<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use appxq\sdii\helpers\SDNoty;
use appxq\sdii\helpers\SDHtml;

/* @var $this yii\web\View */
/* @var $model backend\models\Moneys */
/* @var $form yii\bootstrap\ActiveForm */
?>

    <div class="moneys-form">

        <?php $form = ActiveForm::begin([
            'id' => $model->formName(),
        ]); ?>

        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="itemModalLabel">รายการฝากถอน
            </h4>
        </div>

        <div class="modal-body">
            <?= $form->field($model, 'amount')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'item_type')->textInput(['maxlength' => true]) ?>

            <?php
                $approve = \backend\classes\CNInstance::$approve;
                echo $form->field($model, 'approved')->radioList($approve)->inline(true);
            ?>

            <div class="form-group field-moneys-create_by">
                <label class="control-label" for="moneys-create_by"><i class="fa fa-user"> </i> ทำรายการโดย</label>
                 <label> <?= \backend\classes\CNUser::getFullNameById($model->create_by)?></label>
                <p class="help-block help-block-error"></p>
            </div>

        </div>
        <div class="modal-footer">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success btn-lg btn-block' : 'btn btn-primary btn-lg btn-block']) ?>

                </div>
            </div>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

<?php \richardfan\widget\JSRegister::begin([
    //'key' => 'bootstrap-modal',
    'position' => \yii\web\View::POS_READY
]); ?>
    <script>
        // JS script
        $('form#<?= $model->formName()?>').on('beforeSubmit', function (e) {
            var $form = $(this);
            $.post(
                $form.attr('action'), //serialize Yii2 form
                $form.serialize()
            ).done(function (result) {
                if (result.status == 'success') {
                    <?= SDNoty::show('result.message', 'result.status')?>
                    if (result.action == 'create') {
                        //$(\$form).trigger('reset');
                        $(document).find('#modal-moneys').modal('hide');
                        $.pjax.reload({container: '#moneys-grid-pjax'});
                    } else if (result.action == 'update') {
                        $(document).find('#modal-moneys').modal('hide');
                        $.pjax.reload({container: '#moneys-grid-pjax'});
                    }
                } else {
                    <?= SDNoty::show('result.message', 'result.status')?>
                }
            }).fail(function () {
                <?= SDNoty::show("'" . SDHtml::getMsgError() . "Server Error'", '"error"')?>
                console.log('server error');
            });
            return false;
        });
    </script>
<?php \richardfan\widget\JSRegister::end(); ?>