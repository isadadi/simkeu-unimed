<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterPejabat */

$this->title = $model->pajabat_id;
$this->params['breadcrumbs'][] = ['label' => 'Master Pejabats', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="master-pejabat-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->pajabat_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->pajabat_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'pajabat_id',
            'pejabat_nip',
            'pejabat_nama',
            'pejabat_jabatan',
        ],
    ]) ?>

</div>
