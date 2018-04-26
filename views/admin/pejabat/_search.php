<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterPejabatSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="master-pejabat-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'pajabat_id') ?>

    <?= $form->field($model, 'pejabat_nip') ?>

    <?= $form->field($model, 'pejabat_nama') ?>

    <?= $form->field($model, 'pejabat_jabatan') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>