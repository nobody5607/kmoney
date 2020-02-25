<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "moneys".
 *
 * @property int $id
 * @property string $amount  จำนวนเงิน
 * @property string $item_type ประเภทรายการ
 * @property string $approved สถานะรายการ
 * @property int $create_by ทำรายการโดย
 * @property string $create_date ทำรายการวันที่
 * @property int $update_by แก้ไขรายการโดย
 * @property string $update_date แก้ไขรายการวันที่
 * @property string $image หลักฐานการชำระเงิน
 */
class Moneys extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'moneys';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['amount'], 'number'],
            [['create_by', 'update_by'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['item_type', 'approved'], 'string', 'max' => 50],
            [['image'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'amount' => ' จำนวนเงิน',
            'item_type' => 'ประเภทรายการ',
            'approved' => 'สถานะรายการ',
            'create_by' => 'ทำรายการโดย',
            'create_date' => 'ทำรายการวันที่',
            'update_by' => 'แก้ไขรายการโดย',
            'update_date' => 'แก้ไขรายการวันที่',
            'image' => 'หลักฐานการชำระเงิน',
        ];
    }
}
