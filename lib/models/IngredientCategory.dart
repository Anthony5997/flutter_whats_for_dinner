// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'IngredientCategory.g.dart';

@JsonSerializable()
class IngredientCategory {
  final int id;
  final String name;
  final String image;
  final DateTime? created_at;
  final DateTime? updated_at;

  IngredientCategory({
    required this.id,
    required this.name,
    required this.image,
    this.created_at,
    this.updated_at,
  });

  factory IngredientCategory.fromJson(Map<String, dynamic> json) =>
      _$IngredientCategoryFromJson(json);

  /// Connect the generated [_$IngredientCategoryToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IngredientCategoryToJson(this);
}
