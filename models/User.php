<?php

namespace app\models;
use Yii;
use yii\db\ActiveRecord;
use app\components\MyHelper;
class User extends ActiveRecord implements \yii\web\IdentityInterface
{

 

   public static function tableName()
    {
        return 'simkeu_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_username', 'user_password', 'user_nama', 'user_level', 'user_status', 'user_authKey', 'unit_id'], 'required'],
            [['user_level', 'user_status'], 'string'],
            [['unit_id'], 'integer'],
            [['user_username'], 'string', 'max' => 25],
            [['user_password', 'user_authKey'], 'string', 'max' => 250],
            [['user_nama'], 'string', 'max' => 50],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => admin\MasterUnit::className(), 'targetAttribute' => ['unit_id' => 'unit_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'user_username' => 'User Username',
            'user_password' => 'User Password',
            'user_nama' => 'User Nama',
            'user_level' => 'User Level',
            'user_status' => 'User Status',
            'user_authKey' => 'User Auth Key',
            'unit_id' => 'Unit ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(SimkeuMasterUnit::className(), ['unit_id' => 'unit_id']);
    }


    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
       $user = self::find()->where(["user_id"=>$id])->one();
       if(!count($user)){
            return 0;
       }
       return new static($user);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        $user = self::find()->where(['accessToken' => $token])->one();

        if(!count($user)){
            return null;
        }
        return new static($user);
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        $user = self::find()->where(['user_username' => $username])->one();
        if(!count($user))
            return null;

        return new static($user);
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->user_id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->user_authKey;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->user_authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        //kalo ada enkripsi masukkan disini
        return MyHelper::validatePassword($password, $this->user_password);
    }
}
