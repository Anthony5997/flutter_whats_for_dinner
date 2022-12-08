// ignore_for_file: non_constant_identifier_names

import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Review.g.dart';

@JsonSerializable()
class Review {
  final String? rating;
  final String? author;
  final DateTime? created_at;

  Review({
    required this.rating,
    required this.author,
    this.created_at,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  /// Connect the generated [_$ReviewToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
