<?php

namespace app\models\admin;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\admin\MasterPejabat;

/**
 * MasterPejabatSearch represents the model behind the search form of `app\models\admin\MasterPejabat`.
 */
class MasterPejabatSearch extends MasterPejabat
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pajabat_id'], 'integer'],
            [['pejabat_nip', 'pejabat_nama', 'pejabat_jabatan'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = MasterPejabat::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'pajabat_id' => $this->pajabat_id,
        ]);

        $query->andFilterWhere(['like', 'pejabat_nip', $this->pejabat_nip])
            ->andFilterWhere(['like', 'pejabat_nama', $this->pejabat_nama])
            ->andFilterWhere(['like', 'pejabat_jabatan', $this->pejabat_jabatan]);

        return $dataProvider;
    }
}
