<?php
    $this->title ='กิจกรรม';
?>
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark"> กิจกรรม </h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= \yii\helpers\Url::to(['/'])?>">สรุป</a></li>
                    <li class="breadcrumb-item active">กิจกรรม</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="">
                <h5 >รอดำเนินการ</h5>
            </div>
            <div >
                <?php if($moneyWarning):?>
                    <?php foreach($moneyWarning as $k=>$v):?>
                        <?= $this->render('_items',['v'=>$v]);?>
                    <?php endforeach; ?>
                <?php else:?>
                    <div class="text-center">ยังไม่มีรายการ</div>
                <?php endif; ?>
            </div>
        </div>
    </div>


<!--    approved-->
    <div class="card">
        <div class="card-body">
            <div class="">
                <h5 >เสร็จสมบูรณ์แล้ว</h5>
            </div>
            <div >
                <?php if($moneyApproved):?>
                    <?php foreach($moneyApproved as $k=>$v):?>
                        <?= $this->render('_items',['v'=>$v]);?>
                    <?php endforeach; ?>
                <?php else:?>
                    <div class="text-center">ยังไม่มีรายการ</div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
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
