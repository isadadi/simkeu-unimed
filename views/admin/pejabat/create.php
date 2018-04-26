<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterPejabat */

$this->title = 'Create Master Pejabat';
$this->params['breadcrumbs'][] = ['label' => 'Master Pejabats', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="master-pejabat-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
