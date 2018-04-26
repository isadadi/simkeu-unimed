<?php

namespace app\models\admin;

use Yii;

/**
 * This is the model class for table "simkeu_master_unit".
 *
 * @property int $unit_id
 * @property string $unit_nama
 * @property string $unit_status
 *
 * @property SimkeuAkun[] $simkeuAkuns
 * @property SimkeuPembayaranUp[] $simkeuPembayaranUps
 * @property SimkeuUser[] $simkeuUsers
 */
class MasterUnit extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'simkeu_master_unit';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['unit_nama', 'unit_status'], 'required'],
            [['unit_status'], 'string'],
            [['unit_nama'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'unit_id' => 'Unit ID',
            'unit_nama' => 'Unit Nama',
            'unit_status' => 'Unit Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSimkeuAkuns()
    {
        return $this->hasMany(SimkeuAkun::className(), ['unit_id' => 'unit_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSimkeuPembayaranUps()
    {
        return $this->hasMany(SimkeuPembayaranUp::className(), ['unit_id' => 'unit_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSimkeuUsers()
    {
        return $this->hasMany(SimkeuUser::className(), ['unit_id' => 'unit_id']);
    }
}
