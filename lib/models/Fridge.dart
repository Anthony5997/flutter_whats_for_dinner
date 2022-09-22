// ignore_for_file: non_constant_identifier_names

import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Fridge.g.dart';

@JsonSerializable()
class Fridge {
  final String id;
  List<Ingredient> ingredients_list;
  final DateTime? created_at;
  DateTime? updated_at;

  Fridge({
    required this.id,
    required this.ingredients_list,
    this.created_at,
    this.updated_at,
  });

  factory Fridge.fromJson(Map<String, dynamic> json) => _$FridgeFromJson(json);

  /// Connect the generated [_$FridgeToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FridgeToJson(this);
}
