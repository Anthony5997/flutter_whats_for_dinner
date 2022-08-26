import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  int id;
  String name;
  String image;
  int category_id;
  String? category_name;
  int? quantity;
  int? unit_id;
  String? unit_name;

  Ingredient(
      {required this.id,
      required this.name,
      required this.image,
      required this.category_id,
      this.category_name,
      this.quantity,
      this.unit_id,
      this.unit_name});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  /// Connect the generated [_$IngredientToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
