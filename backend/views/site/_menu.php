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
<ul class="nav nav-pills nav-stacked">
    <li role="presentation" class="<?= $controllerID=='bill-items'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-items'])?>">
            <img src='<?= yii\helpers\Url::to('@web/img/bill.png')?>' style="width:20px;"> <?= Yii::t('app', 'จัดการบิล'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-packagers'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-packagers'])?>"><?= Yii::t('app', 'จัดสินค้า'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-shippings'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-shippings'])?>"><?= Yii::t('app', 'ส่งสินค้า'); ?></a>
    </li>
    <li role="presentation" class="<?= $controllerID=='bill-chargers'?'active':'' ?>">
        <a href="<?= \yii\helpers\Url::to(['/bill-chargers'])?>"><?= Yii::t('app', 'เรียกเก็บเงิน'); ?></a>
    </li>
</ul>
