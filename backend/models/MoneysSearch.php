<?php

namespace backend\models;

use appxq\sdii\utils\VarDumper;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Moneys;

/**
 * MoneysSearch represents the model behind the search form about `backend\models\Moneys`.
 */
class MoneysSearch extends Moneys
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'update_by'], 'integer'],
            [['amount'], 'number'],
            [['item_type','create_by', 'approved', 'create_date', 'update_date', 'image'], 'safe'],
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
        $query = Moneys::find()->orderBy(['create_date'=>SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->innerJoin('profile','moneys.create_by=profile.user_id');

        $query->andFilterWhere(['like', 'moneys.amount', $this->amount]);
        $query->andFilterWhere(['like', 'moneys.item_type', $this->item_type]);
        $query->andFilterWhere(['like', 'moneys.approved', $this->approved]);
        $query->andFilterWhere(['like', 'profile.firstname', $this->create_by]);
        //VarDumper::dump($query->createCommand()->rawSql);
        return $dataProvider;
    }
}
