// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      ingredient_category_id: json['ingredient_category_id'] as int,
      category_name: json['category_name'] as String?,
      quantity: json['quantity'] as int?,
      unit_id: json['unit_id'] as int?,
      unit_name: json['unit_name'] as String?,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'ingredient_category_id': instance.ingredient_category_id,
      'category_name': instance.category_name,
      'quantity': instance.quantity,
      'unit_id': instance.unit_id,
      'unit_name': instance.unit_name,
    };
