<?php


namespace frontend\controllers;


use appxq\sdii\utils\SDdate;
use appxq\sdii\utils\VarDumper;
use backend\classes\CNUser;
use backend\models\Bank;
use cpn\chanpan\classes\CNMessage;
use frontend\classest\CNMoney;
use frontend\models\Moneys;
use yii\web\Controller;

class MyaccountController extends Controller
{
    public function beforeAction($action)
    {
        if(\Yii::$app->user->isGuest){
            return $this->redirect(['/user/login']);
        }
        if (in_array($action->id,['in-money','out-money','uploadimage'])) {
            $this->enableCsrfValidation = false;
        }

        return parent::beforeAction($action);
    }
    public function actionSummary(){


        $moneys = Moneys::find()->where('create_by=:user_id',[
            ':user_id'=>CNUser::get_id()
        ])->limit(3)->orderBy(['create_date'=>SORT_DESC])->all();

        $amounts = CNMoney::getAmount();
        $total = 0;
        $inAmount = $amounts['inamount'];
        $outAmount = $amounts['outmoney'];
        $total = $inAmount-$outAmount;
        $user_id = CNUser::get_id();
        $user = CNUser::get_user_by_id($user_id);
        $bank = Bank::findOne($user['bank']);
//        VarDumper::dump($bank);

        //VarDumper::dump($moneys);
        return $this->render("summary",[
            'moneys'=>$moneys,
            'total'=>$total,
            'user'=>$user,
            'bank'=>$bank
        ]);
    }

    public function actionTransactions(){
        $moneyWarning = Moneys::find()->where("create_by=:user_id AND approved='warning'",[
            ':user_id'=>CNUser::get_id()
        ])->orderBy(['create_date'=>SORT_DESC])->all();
        $moneyApproved = Moneys::find()->where("create_by=:user_id AND approved='approved'",[
            ':user_id'=>CNUser::get_id()
        ])->orderBy(['create_date'=>SORT_DESC])->all();


        return $this->render("transactions",[
            'moneyWarning'=>$moneyWarning,
            'moneyApproved'=>$moneyApproved
        ]);
    }
    public function actionTransactionDetail(){
        $id = \Yii::$app->request->get('id');
        $model = Moneys::findOne($id);
        return $this->render("transaction-detail",[
            'v'=>$model
        ]);
    }
    public function actionTransfer(){
        return $this->render("transfer");
    }
    public function actionHelp(){
        return $this->render("help");
    }


    public function actionInMoney(){
        if(\Yii::$app->user->isGuest){
            return $this->redirect(['/user/login']);
        }
        $amount = \Yii::$app->request->post('amount');
        $item_type = \Yii::$app->request->post('item_type');
        $model = new Moneys();
        $model->amount = $amount;
        $model->create_by = CNUser::get_id();
        $model->create_date = SDdate::get_current_date_time();
        $model->item_type = $item_type;
        $model->approved = 'warning';
        if($model->save()){
            return CNMessage::getSuccess("บันทึกรายการแล้วกรุณารอดำเนินการ", $model);
        }else{
            return CNMessage::getError("บันทึกรายการไม่สำเร็จกรุณาลองใหม่ภายหลัง ขออภัยในความไม่สะดวกค่ะ", $model->errors);
        }
        //VarDumper::dump($_POST);
    }
    public function actionOutMoney(){
        if(\Yii::$app->user->isGuest){
            return $this->redirect(['/user/login']);
        }
        $amount = \Yii::$app->request->post('amount');
        $item_type = \Yii::$app->request->post('item_type');

        $amounts = CNMoney::getAmount();
        $total = 0;
        $inAmount = $amounts['inamount'];
        $outAmount = $amounts['outmoney'];

        $total = $inAmount-$outAmount;
        if($amount > $total){
            return CNMessage::getError("ยอดเงินในระบบของท่านไม่เพียงพอ กรุณาตรวจสอบยอดเงินอีกครั้ง");
        }

        $model = new Moneys();
        $model->amount = $amount;
        $model->create_by = CNUser::get_id();
        $model->create_date = SDdate::get_current_date_time();
        $model->item_type = $item_type;
        $model->approved = 'warning';
        if($model->save()){
            return CNMessage::getSuccess("บันทึกรายการแล้วกรุณารอดำเนินการ", $model);
        }else{
            return CNMessage::getError("บันทึกรายการไม่สำเร็จกรุณาลองใหม่ภายหลัง ขออภัยในความไม่สะดวกค่ะ", $model->errors);
        }
        //VarDumper::dump($_POST);
    }

    public function actionGetimage(){
        $id = \Yii::$app->request->get('id');
        $model = Moneys::findOne($id);
        $storageUrl = isset(\Yii::$app->params['storageUrl'])?\Yii::$app->params['storageUrl']:'';
        $fileName = "<img style='width:300px' src='{$storageUrl}/uploads/{$model->image}' class='rounded'/> ";
        if(!$model->image){
            $fileName = "";
        }
        return CNMessage::getSuccess("โหลดหลักฐานสำเร็จ", ['fileName'=>$fileName]);
    }
    public function actionUploadimage(){
        if(\Yii::$app->request->post()){
            $image = \yii\web\UploadedFile::getInstanceByName('image');
            $storage = \Yii::getAlias('@storage');
            $newFile = date('YmdHis').rand(0,99);
            $path = "{$storage}/web/uploads";
            $id = \Yii::$app->request->post('id');
            $model = Moneys::findOne($id);
            @unlink("{$path}/{$model->image}");
            //VarDumper::dump("{$path}/{$model->image}");
            if($image->saveAs("{$path}/{$newFile}.{$image->extension}")){
                $model->image = $newFile.".{$image->extension}";
                $model->update_date = SDdate::get_current_date_time();
                if($model->save()){
                    return CNMessage::getSuccess("อัปโหลดหลักฐานการชำระเงินสำเร็จ");
                }else{
                    return CNMessage::getError("อัปโหลดหลักฐานการชำระเงินไม่สำเร็จ", $model->errors);
                }

            }
        }
        //VarDumper::dump($storage);
    }



}