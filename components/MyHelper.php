<?php
namespace app\components;
use yii;
use yii\helpers\Url;
use common\models\User;
 
class MyHelper  {
    public static function hashPassword($pass){

        for($i=0;$i<64;$i++){
            $pass = md5($pass);
            for($j=0;$j<52;$j+=2)
                $pass = base64_encode($pass);
        }
        $pass = md5($pass);
        return Yii::$app->getSecurity()->generatePasswordHash($pass);
    }

    public function validatePassword($pass, $hash){
        for($i=0;$i<64;$i++){
            $pass = md5($pass);
            for($j=0;$j<52;$j+=2)
                $pass = base64_encode($pass);
        }
        $pass = md5($pass);

        return Yii::$app->getSecurity()->validatePassword($pass, $hash);
    }
   
}