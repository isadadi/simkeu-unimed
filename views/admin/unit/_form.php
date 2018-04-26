<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\admin\MasterUnit */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="master-unit-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'unit_nama')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_status')->dropDownList([ 'aktif' => 'Aktif', 'nonaktif' => 'Nonaktif', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
