<?php
namespace common\modules\user\controllers;
use dektrium\user\controllers\SecurityController as BaseSecurityController;
use common\modules\user\models\LoginForm; 
class SecurityController extends BaseSecurityController{
    //put your code here
    public function actionLogin()
    {
       
       // $this->layout='@backend/themes/adminlte/views/layouts/main';
        if (!\Yii::$app->user->isGuest) {
            $this->goHome();
        }

        /** @var LoginForm $model */
        $model = \Yii::createObject(LoginForm::className());
        $event = $this->getFormEvent($model);

        $this->performAjaxValidation($model);

        $this->trigger(self::EVENT_BEFORE_LOGIN, $event);

        if ($model->load(\Yii::$app->getRequest()->post()) && $model->login()) {
            $this->trigger(self::EVENT_AFTER_LOGIN, $event);
            return $this->goBack();
        }

        return $this->render('login', [
            'model'  => $model,
            'module' => $this->module,
        ]);
    }
}
