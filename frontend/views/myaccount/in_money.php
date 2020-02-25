<!-- The Modal -->
<?php
    use appxq\sdii\helpers\SDNoty;
    use appxq\sdii\helpers\SDHtml;
?>
<div class="modal" id="modalInMoney" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">ฝากเงิน</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-6">
                            <form id="formInMoney" action="<?= \yii\helpers\Url::to(['/myaccount/in-money'])?>">
                                <div class="form-group">
                                    <label for="number">ระบุจำนวนเงิน:</label>
                                    <input type="hidden" name="item_type" value="ฝากเงิน">
                                    <input type="number" class="form-control form-control-lg text-right" placeholder="0" name="amount" id="amount">
                                </div>
                                <div class="row justify-content-md-center">
                                    <div class="col-12">
                                        <button id="confirmItems" type="submit" class="btn btn-primary btn-lg"><i class="fa fa-check"></i> ยืนยัน</button>
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
    $("#confirmItems").on('click', function () {
        let $form = $("#formInMoney");
        // var $form = $(this);
        $.post(
            $form.attr('action'), //serialize Yii2 form
            $form.serialize()
        ).done(function(result) {
            swal({
                title: '',
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