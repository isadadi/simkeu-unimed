<?php

namespace app\models\admin;

use Yii;

/**
 * This is the model class for table "simkeu_master_pejabat".
 *
 * @property int $pajabat_id
 * @property string $pejabat_nip
 * @property string $pejabat_nama
 * @property string $pejabat_jabatan
 */
class MasterPejabat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'simkeu_master_pejabat';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pejabat_nip', 'pejabat_nama', 'pejabat_jabatan'], 'required'],
            [['pejabat_nip', 'pejabat_nama', 'pejabat_jabatan'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pajabat_id' => 'Pajabat ID',
            'pejabat_nip' => 'Pejabat Nip',
            'pejabat_nama' => 'Pejabat Nama',
            'pejabat_jabatan' => 'Pejabat Jabatan',
        ];
    }
}
