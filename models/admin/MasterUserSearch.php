<?php

namespace app\models\admin;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\user;

/**
 * MasterUserSearch represents the model behind the search form of `app\models\user`.
 */
class MasterUserSearch extends user
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'unit_id'], 'integer'],
            [['user_username', 'user_password', 'user_nama', 'user_level', 'user_status', 'user_authKey'], 'safe'],
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
        $query = user::find();

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
            'user_id' => $this->user_id,
            'unit_id' => $this->unit_id,
        ]);

        $query->andFilterWhere(['like', 'user_username', $this->user_username])
            ->andFilterWhere(['like', 'user_password', $this->user_password])
            ->andFilterWhere(['like', 'user_nama', $this->user_nama])
            ->andFilterWhere(['like', 'user_level', $this->user_level])
            ->andFilterWhere(['like', 'user_status', $this->user_status])
            ->andFilterWhere(['like', 'user_authKey', $this->user_authKey]);

        return $dataProvider;
    }
}
