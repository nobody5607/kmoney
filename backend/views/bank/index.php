<?php

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\helpers\Url;
use appxq\sdii\widgets\GridView;
use appxq\sdii\widgets\ModalForm;
use appxq\sdii\helpers\SDNoty;
use appxq\sdii\helpers\SDHtml;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\BankSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ธนาคาร';
$this->params['breadcrumbs'][] = $this->title;

?>
    <div class="box box-primary">
        <div class="box-header">
            <?= Html::encode($this->title) ?>
            <div class="pull-right">
                <?= Html::button(SDHtml::getBtnAdd(), ['data-url' => Url::to(['bank/create']), 'class' => 'btn btn-success btn-sm', 'id' => 'modal-addbtn-bank']) . ' ' .
                Html::button(SDHtml::getBtnDelete(), ['data-url' => Url::to(['bank/deletes']), 'class' => 'btn btn-danger btn-sm', 'id' => 'modal-delbtn-bank', 'disabled' => false])
                ?>
            </div>
        </div>
        <div class="box-body">
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?php Pjax::begin(['id' => 'bank-grid-pjax']); ?>
            <?= GridView::widget([
                'id' => 'bank-grid',
                /*	'panelBtn' => Html::button(SDHtml::getBtnAdd(), ['data-url'=>Url::to(['bank/create']), 'class' => 'btn btn-success btn-sm', 'id'=>'modal-addbtn-bank']). ' ' .
                              Html::button(SDHtml::getBtnDelete(), ['data-url'=>Url::to(['bank/deletes']), 'class' => 'btn btn-danger btn-sm', 'id'=>'modal-delbtn-bank', 'disabled'=>true]),*/
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    [
                        'class' => 'yii\grid\CheckboxColumn',
                        'checkboxOptions' => [
                            'class' => 'selectionBankIds'
                        ],
                        'headerOptions' => ['style' => 'text-align: center;'],
                        'contentOptions' => ['style' => 'width:40px;text-align: center;'],
                    ],

                    [
                        'format'=>'raw',
                        'label'=>'ชื่อธนาคาร',
                        'contentOptions'=>['style'=>'width:200px;text-align:left'],
                        'attribute'=>'name',
                        'value'=>function($model){
                            $img = "";
                            $storageUrl = Yii::getAlias("@storageUrl");
                            //\appxq\sdii\utils\VarDumper::dump($storageUrl);
                            if($model->name){
                                $img = "<img style='width:30px;border-radius:3px;' src='{$storageUrl}/uploads/{$model->image}'>";
                            }
                            if($model->name){
                                return "{$img} ".$model->name;
                            }else{
                                return '';
                            }
                        },
                        'filter'=>\yii\helpers\ArrayHelper::map(\backend\models\Bank::find()->groupBy(['name'])->all(),'name','name'),
                    ],

                    //'image',
                    [
                        'class' => 'appxq\sdii\widgets\ActionColumn',
                        'contentOptions' => ['style' => 'width:80px;text-align: center;'],
                        'template' => '{update} {delete}',
                        'buttons' => [
                            'update' => function ($url, $model) {
                                return Html::a('<span class="fa fa-edit"></span> ' . Yii::t('app', 'แก้ไข'),
                                    yii\helpers\Url::to(['bank/update/' . $model->id]), [
                                        'title' => Yii::t('app', 'แก้ไข'),
                                        'class' => 'btn btn-primary btn-xs',
                                        'data-action' => 'update',
                                        'data-pjax' => 0
                                    ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<span class="fa fa-trash"></span> ' . Yii::t('app', 'ลบ'),
                                    yii\helpers\Url::to(['bank/delete/' . $model->id]), [
                                        'title' => Yii::t('app', 'ลบ'),
                                        'class' => 'btn btn-danger btn-xs',
                                        'data-confirm' => Yii::t('chanpan', 'Are you sure you want to delete this item?'),
                                        'data-method' => 'post',
                                        'data-action' => 'delete',
                                        'data-pjax' => 0
                                    ]);


                            },
                        ]
                    ],
                ],
            ]); ?>
            <?php Pjax::end(); ?>

        </div>
    </div>
<?= ModalForm::widget([
    'id' => 'modal-bank',
    //'size'=>'modal-lg',
]);
?>

<?php \richardfan\widget\JSRegister::begin([
    //'key' => 'bootstrap-modal',
    'position' => \yii\web\View::POS_READY
]); ?>
    <script>
        // JS script
        $('#modal-addbtn-bank').on('click', function () {
            modalBank($(this).attr('data-url'));
        });

        $('#modal-delbtn-bank').on('click', function () {
            selectionBankGrid($(this).attr('data-url'));
        });

        $('#bank-grid-pjax').on('click', '.select-on-check-all', function () {
            window.setTimeout(function () {
                var key = $('#bank-grid').yiiGridView('getSelectedRows');
                disabledBankBtn(key.length);
            }, 100);
        });

        $('.selectionCoreOptionIds').on('click', function () {
            var key = $('input:checked[class=\"' + $(this).attr('class') + '\"]');
            disabledBankBtn(key.length);
        });

        $('#bank-grid-pjax').on('dblclick', 'tbody tr', function () {
            var id = $(this).attr('data-key');
            modalBank('<?= Url::to(['bank/update', 'id' => ''])?>' + id);
        });

        $('#bank-grid-pjax').on('click', 'tbody tr td a', function () {
            var url = $(this).attr('href');
            var action = $(this).attr('data-action');

            if (action === 'update' || action === 'view') {
                modalBank(url);
            } else if (action === 'delete') {
                yii.confirm('<?= Yii::t('chanpan', 'Are you sure you want to delete this item?')?>', function () {
                    $.post(
                        url
                    ).done(function (result) {
                        if (result.status == 'success') {
                            <?= SDNoty::show('result.message', 'result.status')?>
                            $.pjax.reload({container: '#bank-grid-pjax'});
                        } else {
                            <?= SDNoty::show('result.message', 'result.status')?>
                        }
                    }).fail(function () {
                        <?= SDNoty::show("'" . SDHtml::getMsgError() . "Server Error'", '"error"')?>
                        console.log('server error');
                    });
                });
            }
            return false;
        });

        function disabledBankBtn(num) {
            if (num > 0) {
                $('#modal-delbtn-bank').attr('disabled', false);
            } else {
                $('#modal-delbtn-bank').attr('disabled', true);
            }
        }

        function selectionBankGrid(url) {
            yii.confirm('<?= Yii::t('chanpan', 'Are you sure you want to delete these items?')?>', function () {
                $.ajax({
                    method: 'POST',
                    url: url,
                    data: $('.selectionBankIds:checked[name=\"selection[]\"]').serialize(),
                    dataType: 'JSON',
                    success: function (result, textStatus) {
                        if (result.status == 'success') {
                            <?= SDNoty::show('result.message', 'result.status')?>
                            $.pjax.reload({container: '#bank-grid-pjax'});
                        } else {
                            <?= SDNoty::show('result.message', 'result.status')?>
                        }
                    }
                });
            });
        }

        function modalBank(url) {
            $('#modal-bank .modal-content').html('<div class=\"sdloader \"><i class=\"sdloader-icon\"></i></div>');
            $('#modal-bank').modal('show')
                .find('.modal-content')
                .load(url);
        }
    </script>
<?php \richardfan\widget\JSRegister::end(); ?>