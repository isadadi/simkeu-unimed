<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterUnit */

$this->title = 'Update Master Unit: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Master Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->unit_id, 'url' => ['view', 'id' => $model->unit_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="master-unit-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
