// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      image: json['image'] as String,
      ready_in_minutes: json['ready_in_minutes'] as int,
      serving: json['serving'] as int,
      preparation_minutes: json['preparation_minutes'] as int,
      cooking_minutes: json['cooking_minutes'] as int,
      vegetarian: json['vegetarian'] as bool,
      vegan: json['vegan'] as bool,
      gluten_free: json['gluten_free'] as bool,
      dairy_free: json['dairy_free'] as bool,
      pertinence: json['pertinence'] as int,
      ingredients_list: (json['ingredients_list'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients_missing_list:
          (json['ingredients_missing_list'] as List<dynamic>)
              .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList(),
      recipe_steps: (json['recipe_steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'image': instance.image,
      'ready_in_minutes': instance.ready_in_minutes,
      'serving': instance.serving,
      'preparation_minutes': instance.preparation_minutes,
      'cooking_minutes': instance.cooking_minutes,
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'gluten_free': instance.gluten_free,
      'dairy_free': instance.dairy_free,
      'pertinence': instance.pertinence,
      'ingredients_list': instance.ingredients_list,
      'ingredients_missing_list': instance.ingredients_missing_list,
      'recipe_steps': instance.recipe_steps,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
