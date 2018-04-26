<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterPejabat */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="master-pejabat-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'pejabat_nip')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pejabat_nama')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pejabat_jabatan')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
