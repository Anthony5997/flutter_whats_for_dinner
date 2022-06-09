// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientCategory _$IngredientCategoryFromJson(Map<String, dynamic> json) =>
    IngredientCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$IngredientCategoryToJson(IngredientCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
