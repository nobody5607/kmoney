<?php
$this->title ='สรุป';
?>
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark"> สวัสดีค่ะ <label>คุณ ณัฐพล</label></h1>
            </div><!-- /.col -->

        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-md-7 mt-3 mb-0">
                    <div class="card">
                        <div class="card-body">
                            <div class="">
                                <h5 >ยอดคงเหลือบัญชีของคุณ</h5>
                            </div>

                            <div >
                                <h2>
                                    ฿<?= number_format($total, 2)?>
                                </h2>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="col-md-4 ml-3 mb-3 mr-3">
                    <div class="">
                        <?php
                        $storageUrl = isset(\Yii::$app->params['storageUrl'])?\Yii::$app->params['storageUrl']:'';
                        ?>
                        <div class="row">
                            <div class="col-6 col-sm-6 mt-3">
                                <?= $this->render("in_money");?>
                                <button type="button" class="btn btn-block btn-success" data-toggle="modal" data-target="#modalInMoney">
                                    <img style="width:80px" src="<?= "{$storageUrl}/uploads/m2.svg"?>" alt="">
                                    <div>
                                        ฝากเงิน
                                    </div>
                                </button>
                            </div>
                            <div class="col-6 col-sm-6 mt-3">
                                <?= $this->render("out_money");?>
                                <button type="button" class="btn btn-block btn-secondary" data-toggle="modal" data-target="#modalOutMoney">
                                    <img style="width:80px" src="<?= "{$storageUrl}/uploads/m1.svg"?>" alt="">
                                    <div>
                                        ถอนเงิน
                                    </div>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 mt-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="">
                                <h5 >กิจกรรมล่าสุด</h5>
                            </div>


                            <div >
                                <?php if(isset($moneys)):?>
                                    <?php foreach($moneys as $k=>$v):?>
                                       <?= $this->render('_items',['v'=>$v]);?>
                                    <?php endforeach; ?>
                                <?php else:?>
                                    <div>
                                        <div class="text-center">ยังไม่มีกิจกรรม</div>
                                    </div>
                                <?php endif; ?>


                            </div>
                            <div>
                                <br>
                                <a href="<?= \yii\helpers\Url::to(['/myaccount/transactions'])?>" type="button" class="btn btn-outline-primary">ดูกิจกรรมเพิ่มเติม</a>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-3 ml-3">

                    <h4>บัญชีธนาคาร</h4>

                    <div>
                        <div >
                            <div class="media">
                                <img src="https://lh3.googleusercontent.com/fRj3gVsSGNq1izt8NON0l6Cdqt2dEK4IRhInLoPLlunZMCA0wwOmVnaeDYQEZ8ejWQ" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        793-272636-8 ไทยพาณิชย์
                                    </h3>
                                    <p class="text-sm">นาย ณัฐพล จันทร์ปาน</p>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>


        </div>

        <!-- /.col-md-6 -->
    </div>
    <!-- /.row -->
</div><!-- /.container-fluid -->

<?php \richardfan\widget\JSRegister::begin();?>
<script>
    $(".media").on('click', function () {
        let url = $(this).attr('data-url');
        window.open(url,'_parent');
        return false;
    });
</script>
<?php \richardfan\widget\JSRegister::end();?>
<?php \appxq\sdii\widgets\CSSRegister::begin();?>
<style>
    .media{
        padding:10px;
        border-bottom: 1px solid #2125294a;
        border-bottom-style: dotted;
        cursor:pointer;

    }
    .media:hover{
        background:#3c8dbc26;
    }
</style>
<?php \appxq\sdii\widgets\CSSRegister::end();?>