<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\admin\MasterPejabatSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Master Pejabats';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="master-pejabat-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Master Pejabat', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'pajabat_id',
            'pejabat_nip',
            'pejabat_nama',
            'pejabat_jabatan',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
