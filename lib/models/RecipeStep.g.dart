// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecipeStep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) => RecipeStep(
      id: json['id'] as int,
      step_number: json['step_number'] as int,
      step: json['step'] as String,
    );

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step_number': instance.step_number,
      'step': instance.step,
    };
