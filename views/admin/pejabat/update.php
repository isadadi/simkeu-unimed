<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterPejabat */

$this->title = 'Update Master Pejabat: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Master Pejabats', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->pajabat_id, 'url' => ['view', 'id' => $model->pajabat_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="master-pejabat-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
