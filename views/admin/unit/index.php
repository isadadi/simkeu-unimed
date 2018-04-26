<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\admin\MasterUnitSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Master Units';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="master-unit-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Master Unit', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'unit_id',
            'unit_nama',
            'unit_status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
