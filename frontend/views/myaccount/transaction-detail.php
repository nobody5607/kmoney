<?php
    $id = Yii::$app->request->get('id');
?>
<div class="content-header">
    <div class="container">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark"> <?= $v->item_type; ?> </h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= \yii\helpers\Url::to(['/'])?>">สรุป</a></li>
                    <li class="breadcrumb-item"><a href="<?= \yii\helpers\Url::to(['/myaccount/transactions'])?>">กิจกรรม</a></li>
                    <li class="breadcrumb-item active"> <?= $v->item_type; ?></li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<div class="container">

    <div class="row justify-content-md-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div>
                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        <a href="<?= \yii\helpers\Url::to(['/myaccount/summary'])?>">สรุป</a>
                    </div>
                    <div>
                        <?php
                            echo \appxq\sdii\utils\SDdate::mysql2phpThDateTime($v->create_date);
                        ?>
                    </div>
                    <div>
                        <div>
                            <?php
                            $user = \backend\classes\CNUser::get_user_by_id($v->create_by);
                            $name = isset($user['name'])?$user['name']:'';
                            echo $name;
                            //\appxq\sdii\utils\VarDumper::dump($user);
                            ?>
                        </div>
                        <?php
                        $textStatus = "text-danger";
                        if($v->approved == 'approved'){
                            $textStatus = "text-success";
                        }
                        ?>
                        <label class="text-sm"><?= $v->item_type; ?>
                            <?php
                            if( $v->approved == 'warning' )
                            {
                                echo "<label class='text-danger'>รอดำเนินการ</label>";
                            }else{
                                echo "<label class='text-success'>เสร็จสมบูรณ์แล้ว</label>";
                            }
                            ?>
                        </label>
                        <label class="text-sm <?= $textStatus; ?>">

                              + ฿<?= number_format($v->amount)?>
                            <?php
                            if( $v->approved == 'approved' )
                            {
                                echo "<i class='fas fa-check'></i>";
                            }else{
                                echo "<i class='fa fa-exclamation-triangle'></i>";
                            }
                            ?>

                     </label>
                    </div>
                     <div>
                         <hr>
                         <div><h6>หลักฐานการชำระเงิน</h6></div>
                         <div>
                             <input type="file" name="image" id="image">
                              <div id="previewImage"></div>
                         </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php \richardfan\widget\JSRegister::begin();?>
<script>
    function initImage(){
        let id = "<?= $id; ?>";
        let url = '<?= \yii\helpers\Url::to(['/myaccount/getimage?id='])?>'+id;
        $.get(url, function (result) {
            if(result.status == 'success'){
                $("#previewImage").html(result.data.fileName);
            }
        });

    }
    initImage();
    $('#image').on('change', function(){
        var reg=/(.jpg|.gif|.png)$/;
        if (!reg.test($("#image").val())) {
            alert('Invalid File Type');
            return false;
        }
        let id = "<?= $id; ?>";
        var formData = new FormData();
        if($(this).prop('files').length > 0)
        {
            file =$(this).prop('files')[0];
            formData.append("image", file);
        }
        formData.append("id",id);
        $.ajax({
            url: '<?= \yii\helpers\Url::to(['/myaccount/uploadimage'])?>',  //Server script to process data
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            //Ajax events
            success: function(html){
                initImage();
            }
        });
        return false;
    });

</script>
<?php \richardfan\widget\JSRegister::end();?>