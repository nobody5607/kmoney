<?php

namespace backend\models;

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
            [['create_date', 'update_date','create_by'], 'safe'],
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
            'amount' => 'จำนวนเงิน',
            'item_type' => 'รายการ',
            'approved' => '	สถานะ',
            'create_by' => 'ทำรายการโดย',
            'create_date' => 'ทำรายการเมื่อ',
            'update_by' => 'Update By',
            'update_date' => 'Update Date',
            'image' => 'Image',
        ];
    }
}
