<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;
use dektrium\user\widgets\UserMenu;

/**
 * @var dektrium\user\models\User $user
 */

$user = Yii::$app->user->identity;
?>
<ul class="nav nav-pills">
    <li class="nav-item">
        <a class="nav-link <?= isset($_GET['active'])&&$_GET['active'] == 'account' ? 'active': ''?> " href="<?= \yii\helpers\Url::to(['/user/settings/account?active=account']);?>">บัญชี</a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= isset($_GET['active'])&&$_GET['active'] == 'profile' ? 'active': ''?>" href="<?= \yii\helpers\Url::to(['/user/settings/profile?active=profile']);?>">โปรไฟล์</a>
    </li>

</ul>
