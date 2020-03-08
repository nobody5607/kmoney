<?php

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\helpers\Url;
use appxq\sdii\widgets\GridView;
use appxq\sdii\widgets\ModalForm;
use appxq\sdii\helpers\SDNoty;
use appxq\sdii\helpers\SDHtml;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\MoneysSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'รายการฝากถอน';
$this->params['breadcrumbs'][] = $this->title;

?>
    <div class="box box-primary">
        <div class="box-header">
            <?= Html::encode($this->title) ?>
            <div class="pull-right">
                <?=
                Html::button(SDHtml::getBtnDelete(), ['data-url' => Url::to(['moneys/deletes']), 'class' => 'btn btn-danger btn-sm', 'id' => 'modal-delbtn-moneys', 'disabled' => false])
                ?>
            </div>
        </div>
        <div class="box-body">
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?php Pjax::begin(['id' => 'moneys-grid-pjax']); ?>
            <?= \kartik\grid\GridView::widget([
                'id' => 'moneys-grid',
                /*	'panelBtn' => Html::button(SDHtml::getBtnAdd(), ['data-url'=>Url::to(['moneys/create']), 'class' => 'btn btn-success btn-sm', 'id'=>'modal-addbtn-moneys']). ' ' .
                              Html::button(SDHtml::getBtnDelete(), ['data-url'=>Url::to(['moneys/deletes']), 'class' => 'btn btn-danger btn-sm', 'id'=>'modal-delbtn-moneys', 'disabled'=>true]),*/
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    [
                        'class' => 'yii\grid\CheckboxColumn',
                        'checkboxOptions' => [
                            'class' => 'selectionMoneyIds'
                        ],
                        'headerOptions' => ['style' => 'text-align: center;'],
                        'contentOptions' => ['style' => 'width:40px;text-align: center;'],
                    ],
                    [
                        'class' => 'yii\grid\SerialColumn',
                        'headerOptions' => ['style' => 'text-align: center;'],
                        'contentOptions' => ['style' => 'width:60px;text-align: center;'],
                    ],
                    [
                        'label'=>'จำนวนเงิน',
                        'contentOptions'=>['style'=>'width:150px;text-align:right'],
                        'attribute'=>'amount',
                        'value'=>function($model){
                            if($model->amount){
                                return $model->amount;
                            }else{
                                return '0';
                            }
                        }
                    ],
                    [
                        'label'=>'รายการ',
                        'contentOptions'=>['style'=>'width:100px;text-align:center'],
                        'attribute'=>'item_type',
                        'value'=>function($model){
                            if($model->item_type){
                                return $model->item_type;
                            }else{
                                return '';
                            }
                        },
                        'filter'=>\backend\classes\CNInstance::$moneyType,
                    ],
                    [
                        'format'=>'raw',
                        'label'=>'สถานะ',
                        'contentOptions'=>['style'=>'width:100px;text-align:center'],
                        'attribute'=>'approved',
                        'value'=>function($model){
                            if(isset($model->approved) && $model->approved === 'approved'){
                                return "<label style='color:green;'>อนุมัติ</label>";
                            }else if(isset($model->approved) && $model->approved === 'warning'){
                                return "<label style='color:orange;'>รออนุมัติ</label>";
                            }else{
                                return "<label style='color:red;'>ไม่อนุมัติ</label>";
                            }
                        },
                        'filter'=>\backend\classes\CNInstance::$approve,
                    ],
                    [
                        'format'=>'raw',
                        'label'=>'ทำรายการโดย',
                        'contentOptions'=>['style'=>'width:150px;text-align:right'],
                        'attribute'=>'create_by',
                        'value'=>function($model){
                            //create_by
                            if($model->create_by){
                                return \backend\classes\CNUser::getFullNameById($model->create_by);
                            }
                        }
                    ],
                    [
                        'format'=>'raw',
                        'label'=>'ทำรายการเมื่อ',
                        'contentOptions'=>['style'=>'width:150px;text-align:right'],
                        'attribute'=>'create_date',
                        'value'=>function($model){
                            //create_by
                            if($model->create_date){
                                return $model->create_date;
                            }
                        }
                    ],
                    // 'create_date',
                    // 'update_by',
                    // 'update_date',
                    // 'image',

                    [
                        'class' => 'appxq\sdii\widgets\ActionColumn',
                        'contentOptions' => ['style' => 'width:150px;text-align: center;'],
                        'template' => '{update} {delete}',
                        'buttons' => [
                            'update' => function ($url, $model) {
                                return Html::a('<span class="fa fa-edit"></span> ' . Yii::t('app', 'จัดการ'),
                                    yii\helpers\Url::to(['moneys/update/' . $model->id]), [
                                        'title' => Yii::t('app', 'จัดการ'),
                                        'class' => 'btn btn-primary btn-xs',
                                        'data-action' => 'update',
                                        'data-pjax' => 0
                                    ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<span class="fa fa-trash"></span> ' . Yii::t('app', 'ลบ'),
                                    yii\helpers\Url::to(['moneys/delete/' . $model->id]), [
                                        'title' => Yii::t('app', 'ลบ'),
                                        'class' => 'btn btn-danger btn-xs',
                                        'data-confirm' => Yii::t('ลบ', 'Are you sure you want to delete this item?'),
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
    'id' => 'modal-moneys',
    //'size'=>'modal-lg',
]);
?>

<?php \richardfan\widget\JSRegister::begin([
    //'key' => 'bootstrap-modal',
    'position' => \yii\web\View::POS_READY
]); ?>
    <script>
        // JS script
        $('#modal-addbtn-moneys').on('click', function () {
            modalMoney($(this).attr('data-url'));
        });

        $('#modal-delbtn-moneys').on('click', function () {
            selectionMoneyGrid($(this).attr('data-url'));
        });

        $('#moneys-grid-pjax').on('click', '.select-on-check-all', function () {
            window.setTimeout(function () {
                var key = $('#moneys-grid').yiiGridView('getSelectedRows');
                disabledMoneyBtn(key.length);
            }, 100);
        });

        $('.selectionCoreOptionIds').on('click', function () {
            var key = $('input:checked[class=\"' + $(this).attr('class') + '\"]');
            disabledMoneyBtn(key.length);
        });

        $('#moneys-grid-pjax').on('dblclick', 'tbody tr', function () {
            var id = $(this).attr('data-key');
            modalMoney('<?= Url::to(['moneys/update', 'id' => ''])?>' + id);
        });

        $('#moneys-grid-pjax').on('click', 'tbody tr td a', function () {
            var url = $(this).attr('href');
            var action = $(this).attr('data-action');

            if (action === 'update' || action === 'view') {
                modalMoney(url);
            } else if (action === 'delete') {
                yii.confirm('<?= Yii::t('chanpan', 'Are you sure you want to delete this item?')?>', function () {
                    $.post(
                        url
                    ).done(function (result) {
                        if (result.status == 'success') {
                            <?= SDNoty::show('result.message', 'result.status')?>
                            $.pjax.reload({container: '#moneys-grid-pjax'});
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

        function disabledMoneyBtn(num) {
            if (num > 0) {
                $('#modal-delbtn-moneys').attr('disabled', false);
            } else {
                $('#modal-delbtn-moneys').attr('disabled', true);
            }
        }

        function selectionMoneyGrid(url) {
            yii.confirm('<?= Yii::t('chanpan', 'Are you sure you want to delete these items?')?>', function () {
                $.ajax({
                    method: 'POST',
                    url: url,
                    data: $('.selectionMoneyIds:checked[name=\"selection[]\"]').serialize(),
                    dataType: 'JSON',
                    success: function (result, textStatus) {
                        if (result.status == 'success') {
                            <?= SDNoty::show('result.message', 'result.status')?>
                            $.pjax.reload({container: '#moneys-grid-pjax'});
                        } else {
                            <?= SDNoty::show('result.message', 'result.status')?>
                        }
                    }
                });
            });
        }

        function modalMoney(url) {
            $('#modal-moneys .modal-content').html('<div class=\"sdloader \"><i class=\"sdloader-icon\"></i></div>');
            $('#modal-moneys').modal('show')
                .find('.modal-content')
                .load(url);
        }
    </script>
<?php \richardfan\widget\JSRegister::end(); ?>