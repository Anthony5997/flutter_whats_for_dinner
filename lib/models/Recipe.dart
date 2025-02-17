// ignore_for_file: non_constant_identifier_names

import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/models/RecipeStep.dart';
import 'package:flutter_whats_for_dinner/models/Review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Recipe.g.dart';

@JsonSerializable()
class Recipe {
  final String id;
  final String title;
  final String summary;
  final String image;
  final int ready_in_minutes;
  final int serving;
  final int preparation_minutes;
  final int cooking_minutes;
  final bool vegetarian;
  final bool vegan;
  final bool gluten_free;
  final bool dairy_free;
  final int pertinence;
  final double? user_rating;
  final double? global_rating;
  bool favorite;
  bool is_new;
  final List<Review> reviews_list;
  final List<Ingredient> ingredients_list;
  final List<Ingredient> ingredients_missing_list;
  final List<RecipeStep> recipe_steps;
  final DateTime? created_at;
  final DateTime? updated_at;

  Recipe({
    required this.id,
    required this.title,
    required this.summary,
    required this.image,
    required this.ready_in_minutes,
    required this.serving,
    required this.preparation_minutes,
    required this.cooking_minutes,
    required this.vegetarian,
    required this.vegan,
    required this.gluten_free,
    required this.dairy_free,
    required this.pertinence,
    required this.user_rating,
    required this.global_rating,
    required this.favorite,
    required this.is_new,
    required this.reviews_list,
    required this.ingredients_list,
    required this.ingredients_missing_list,
    required this.recipe_steps,
    this.created_at,
    this.updated_at,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  /// Connect the generated [_$RecipeToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
