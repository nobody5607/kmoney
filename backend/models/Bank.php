<?php

namespace backend\models;

use appxq\sdii\utils\VarDumper;
use Yii;

/**
 * This is the model class for table "bank".
 *
 * @property int $id
 * @property string $name ชื่อธนาคาร
 * @property string $image
 * @property int $rstat สถานะ
 * @property int $create_by สร้างโดย
 * @property string $create_date สร้างเมื่อ
 * @property int $update_by แก้ไขโดย
 * @property string $update_date แก้ไขเมื่อ
 * @property string $order
 */
class Bank extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'bank';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['rstat', 'create_by', 'update_by'], 'integer'],
            [['create_date', 'update_date'], 'safe'],
            [['name', 'image', 'order'], 'string', 'max' => 255],
            [['image'], 'file', 'extensions' => 'jpg, png', 'mimeTypes' => 'image/jpeg, image/png',],
//            [['image'], 'file', 'extensions' => 'gif, jpg','png', 'mimeTypes' => 'image/jpeg, image/png'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'ชื่อธนาคาร',
            'image' => 'รูปภาพ',
            'rstat' => 'Rstat',
            'create_by' => 'Create By',
            'create_date' => 'Create Date',
            'update_by' => 'Update By',
            'update_date' => 'Update Date',
            'order' => 'Order',
        ];
    }

    public function upload(){
        $file = \yii\web\UploadedFile::getInstance($this, 'image');
        //VarDumper::dump($file);
        if ($file) {
            $real_file_name = \appxq\sdii\utils\SDUtility::getMillisecTime();
            $folder = "/web/uploads/";
            $path = \Yii::getAlias('@storage') . "{$folder}";
            @unlink("{$path}/{$this->image}");
            $type = $file->extension;
            $filePath = "{$path}/{$real_file_name}.{$type}";
            //$this->image = "{$real_file_name}.{$type}";
            if ($file->saveAs("{$filePath}")) {
                return ['status'=>true,'fileName'=>"{$real_file_name}.{$type}"];
            }else{
                return ['status'=>false,'fileName'=>"{$real_file_name}.{$type}"];
            }
        }
    }

}
