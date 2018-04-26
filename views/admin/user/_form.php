<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\user */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_password')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_nama')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_level')->dropDownList([ 'admin' => 'Admin', 'bendum' => 'Bendum', 'bnbp' => 'Bnbp', 'bppc' => 'Bppc', 'verifikator' => 'Verifikator', 'nihil' => 'Nihil', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'user_status')->dropDownList([ 'aktif' => 'Aktif', 'nonaktif' => 'Nonaktif', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'user_authKey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
