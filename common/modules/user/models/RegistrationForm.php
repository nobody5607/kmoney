<?php
namespace common\modules\user\models;
use appxq\sdii\utils\VarDumper;
use dektrium\user\models\RegistrationForm as BaseRegistrationForm;
use Yii;
use common\modules\user\models\User;
use common\modules\user\models\Profile;
class RegistrationForm extends BaseRegistrationForm{
    public $reCaptcha;
    public $firstname;
    public $lastname;
    public $telephone;
    public $confirm_password;
    public $lineToken;
    public $accountNumber;
    public $bank, $accountName;
    public function rules()
    {
         $user = $this->module->modelMap['User'];
         $rules[] = ['username', 'required'];
         $rules[] = ['username', 'trim'];
         $rules[] = ['username', 'string', 'min' => 3, 'max' => 255];
         
         $rules[] = ['email', 'required'];
         $rules[] = ['email', 'trim'];
         $rules[] = ['email', 'email'];
         
         $rules[] = ['password', 'required', 'skipOnEmpty' => $this->module->enableGeneratingPassword];
         $rules[] = ['password', 'string', 'min' => 6, 'max' => 72];
 
         $rules[] = ['confirm_password', 'required'];
         $rules[] = ['confirm_password', 'compare', 'compareAttribute'=>'password', 'message'=> Yii::t('app','รหัสผ่านไม่ตรงกัน')];
         
         $rules[] = ['firstname', 'required'];
         $rules[] = ['lastname', 'required'];
         $rules[] = ['telephone', 'required'];
         $rules[] = ['bank','required'];
         $rules[] = ['accountNumber','required'];
         $rules[] = ['accountName','required'];

         $rules[] = ['lineToken', 'string', 'min' => 1, 'max' => 255];
        // $rules[]=[['reCaptcha'], \himiklab\yii2\recaptcha\ReCaptchaValidator::className(), 'secret' => '6LeaIl4UAAAAAB2xHY6p9L9lHf00NqsuapdQBhfT', 'uncheckedMessage' => 'Please confirm that you are not a bot.'];
         //$rules[]=['reCaptcha', 'safe'];
         return $rules;
    }
    public function attributeLabels()
    {
        $labels = parent::attributeLabels(); 
        $labels['firstname'] = Yii::t('chanpan', 'ชื่อ');
        $labels['lastname'] = Yii::t('chanpan', 'นามสกุล'); 
	
        $labels['confirm_password']=Yii::t('chanpan', 'ยืนยันรหัสผ่าน');
        $labels['accountNumber']=Yii::t('appmenu', 'หมายเลขบัญชี');
        $labels['lineToken']=Yii::t('appmenu', 'Line token');
        $labels['telephone'] = 'เบอร์โทรศัพท์';
        $labels['bank'] = 'เลือกธนาคาร';
        $labels['accountName'] = 'ชื่อบัญชี';


        return $labels;
    }
    public function register()
    { 
        if (!$this->validate()) {
            return false;
        }
        $user = Yii::createObject(User::className());
        $user->setScenario('register');       

        $user->setAttributes([
            'email'    => $this->email,
            'username' => $this->username,
            'password' => $this->password
            ]);
        $profile = \Yii::createObject(Profile::className());
        $profile->setAttributes([
            'name' => $this->firstname.' '.$this->lastname,
            'public_email' => $this->email,
            'gravatar_email' => $this->email,
            'dob'=>' ',//$this->dob,
            'firstname'=>$this->firstname,
            'lastname'=>$this->lastname,             
            'department'=>'00',//$this->department,
            'position'=>'0',
            'sitecode'=>'00',//$this->sitecode,
            'tel'=> $this->telephone,//$this->telephone
            'lineToken'=>$this->lineToken,
            'accountNumber'=>$this->accountNumber,
            'bank'=>$this->bank,
            'accountName'=>$this->accountName
        ]);

	    $user->modelProfile = $profile;
	
        return $user->register();
    }
    
}
