import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Ingredient.g.dart';

@JsonSerializable()
class Ingredient extends Equatable {
  final int id;
  final String name;
  final String image;
  final String category;
  final DateTime? created_at;
  final DateTime? updated_at;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    this.created_at,
    this.updated_at,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  /// Connect the generated [_$IngredientToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
