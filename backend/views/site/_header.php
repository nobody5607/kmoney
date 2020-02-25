<?php
    $moduleID = '';
    $controllerID = '';
    $actionID = '';

    if (isset(\Yii::$app->controller->module->id)) {
        $moduleID = \Yii::$app->controller->module->id;
    }
    if (isset(\Yii::$app->controller->id)) {
        $controllerID = \Yii::$app->controller->id;
    }
    if (isset(\Yii::$app->controller->action->id)) {
        $actionID = \Yii::$app->controller->action->id;
    }
?>
<ul class="nav nav-tabs" style="font-size: 16px;">
    <li role="presentation" class="<?= $controllerID=='bill-items'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(["/bill-items/update?id={$bid}&bid={$bid}"])?>">
        <img src='<?= yii\helpers\Url::to('@web/img/bill.png')?>' style="width:30px;">  <?= Yii::t('app', 'จัดการบิล'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-packagers'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-packagers?bid='.$bid])?>">
                 <img src='<?= yii\helpers\Url::to('@web/img/packager.png')?>' style="width:30px;"> <?= Yii::t('app', 'จัดสินค้า'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-shippings'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-shippings?bid='.$bid])?>">
                         
        <img src='<?= yii\helpers\Url::to('@web/img/delivery.png')?>' style="width:30px;"> <?= Yii::t('app', 'ส่งสินค้า'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-chargers'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-chargers?bid='.$bid])?>">
         <img src='<?= yii\helpers\Url::to('@web/img/cash.png')?>' style="width:30px;"> <?= Yii::t('app', 'เรียกเก็บเงิน'); ?></a>
    </li>
</ul>