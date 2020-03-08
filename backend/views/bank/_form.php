<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use appxq\sdii\helpers\SDNoty;
use appxq\sdii\helpers\SDHtml;

/* @var $this yii\web\View */
/* @var $model backend\models\Bank */
/* @var $form yii\bootstrap\ActiveForm */
?>

<div class="bank-form">

    <?php $form = ActiveForm::begin([
        'options' => ['enctype' => 'multipart/form-data'],
        'id'=>$model->formName(),
    ]); ?>


    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="itemModalLabel"><i class="fa fa-bank"></i> จัดการธนาคาร</h4>
    </div>

    <div class="modal-body">
	<?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
	<?= $form->field($model, 'image')->fileInput() ?>
	<?= $form->field($model, 'order')->textInput(['type' => 'number']) ?>

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

<?php  \richardfan\widget\JSRegister::begin([
    //'key' => 'bootstrap-modal',
    'position' => \yii\web\View::POS_READY
]); ?>
<script>
// JS script


$('form#<?= $model->formName()?>').on('beforeSubmit', function(e) {
    var $form = $(this);
    var formData = new FormData($(this)[0]);

    $.ajax({
        url:$form.attr('action'),
        type:'POST',
        data:formData,
        processData: false,
        contentType: false,
        cache: false,
        enctype: 'multipart/form-data',
        success:function(result){
            if(result.status == 'success') {
                <?= SDNoty::show('result.message', 'result.status')?>
                if(result.action == 'create') {
                    $(document).find('#modal-bank').modal('hide');
                    $.pjax.reload({container:'#bank-grid-pjax'});
                } else if(result.action == 'update') {
                    $(document).find('#modal-bank').modal('hide');
                    $.pjax.reload({container:'#bank-grid-pjax'});
                }
            } else {
                <?= SDNoty::show('result.message', 'result.status')?>
            }
        }
    }).fail(function( jqXHR, textStatus ) {
        <?= SDNoty::show('result.message', 'result.status')?>
    });

    return false;
});

</script>
<?php  \richardfan\widget\JSRegister::end(); ?>