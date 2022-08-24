// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Fridge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fridge _$FridgeFromJson(Map<String, dynamic> json) => Fridge(
      id: json['id'] as int,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      ingredients_list: (json['ingredients_list'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FridgeToJson(Fridge instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'ingredients_list': instance.ingredients_list,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
