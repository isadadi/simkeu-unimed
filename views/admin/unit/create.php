<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterUnit */

$this->title = 'Create Master Unit';
$this->params['breadcrumbs'][] = ['label' => 'Master Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="master-unit-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
