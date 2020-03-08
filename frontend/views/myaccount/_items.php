<div class="media" data-url="<?= \yii\helpers\Url::to(['/myaccount/transaction-detail?id='.$v->id])?>">
    <div class="media-body">
        <div class="row">
            <div class="col-md-2">
                <?php
                    echo \appxq\sdii\utils\SDdate::mysql2phpThDateSmall($v->create_date);
                ?>
            </div>
            <div class="col-md-10">
                <h3 class="dropdown-item-title">

                    <h5>
                        <?php
                        $user = \backend\classes\CNUser::get_user_by_id($v->create_by);
                        $name = isset($user['name'])?$user['name']:'';
                        echo $name;
                        //\appxq\sdii\utils\VarDumper::dump($user);
                        ?>
                    </h5>

                    <?php
                        $textStatus = "text-danger";
                        if($v->approved == 'approved'){
                            $textStatus = "text-success";
                        }
                    ?>
                    <span class="float-right text-sm <?= $textStatus; ?>">
                         + ฿<?= number_format($v->amount)?>
                        <?php
                        if( $v->approved == 'approved' )
                        {
                            echo "<i class='fas fa-check'></i>";
                        }else{
                            echo "<i class='fa fa-exclamation-triangle'></i>";
                        }
                        ?>

                     </span>
                </h3>
                <p class="text-sm"><?= $v->item_type; ?>
                    <?php
                    if( $v->approved == 'warning' )
                    {
                        echo "<label class='text-danger'>รอดำเนินการ</label>";
                    }else{
                        echo "<label class='text-success'>เสร็จสมบูรณ์แล้ว</label>";
                    }
                    ?>
                </p>
            </div>
        </div>
    </div>
</div>