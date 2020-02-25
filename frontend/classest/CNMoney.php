<?php
namespace frontend\classest;

use backend\classes\CNUser;
use yii\db\Exception;

class CNMoney
{
    public static function getAmount(){
        try{
            $user_id = CNUser::get_id();
            $sql = "
                SELECT 
                    (SELECT sum(`amount`) FROM moneys WHERE create_by=:user_id AND `approved`='approved' AND `item_type`='ฝากเงิน') as inamount,
                    (SELECT sum(`amount`) FROM moneys WHERE create_by=:user_id2 AND `approved`='approved' AND `item_type`='ถอนเงิน') as outmoney
                FROM moneys limit 1
                ";
            $params=[
                ':user_id'=>$user_id,
                ':user_id2'=>$user_id
            ];
            $amounts = \Yii::$app->db->createCommand($sql,$params)->queryOne();
            return $amounts;
        }catch (Exception $ex){

        }
    }
}