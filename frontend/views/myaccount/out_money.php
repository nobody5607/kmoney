<!-- The Modal -->
<?php
use appxq\sdii\helpers\SDNoty;
use appxq\sdii\helpers\SDHtml;
?>
<div class="modal" id="modalOutMoney" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">ถอนเงิน</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-6">
                            <form id="formOutMoney" action="<?= \yii\helpers\Url::to(['/myaccount/out-money'])?>">
                                <div class="form-group">
                                    <label for="number">ระบุจำนวนเงิน:</label>
                                    <input type="hidden" name="item_type" value="ถอนเงิน">
                                    <input type="number" class="form-control form-control-lg text-right" placeholder="0" name="amount" id="amount">
                                </div>
                                <div class="row justify-content-md-center">
                                    <div class="col-12">
                                        <button id="confirmItems2" type="submit" class="btn btn-primary btn-lg"><i class="fa fa-check"></i> ยืนยัน</button>
                                        <button type="button" data-dismiss="modal" class="btn btn-default btn-lg"><i class="fa fa-times"></i> ยกเลิก</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>
<?php \richardfan\widget\JSRegister::begin();?>
<script>
    $("#confirmItems2").on('click', function () {
        let $form = $("#formOutMoney");
        // var $form = $(this);
        $.post(
            $form.attr('action'), //serialize Yii2 form
            $form.serialize()
        ).done(function(result) {
            swal({
                title:'',
                text: result.message,
                type: result.status,
                timer: 2000
            });
            if(result.status == 'success') {
                setTimeout(function () {
                    location.reload();
                }, 2000);

            }
        }).fail(function() {
            <?= SDNoty::show("'" . SDHtml::getMsgError() . "Server Error'", '"error"')?>
            console.log('server error');
        });
        return false;
        return false;
    });
</script>
<?php \richardfan\widget\JSRegister::end();?>