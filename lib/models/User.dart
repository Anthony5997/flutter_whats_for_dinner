import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/models/RecipeStep.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String nickname;
  final String email;
  final String password;
  final String profile_picture;
  final DateTime? created_at;
  final DateTime? updated_at;

  User({
    required this.id,
    required this.nickname,
    required this.email,
    required this.password,
    required this.profile_picture,
    this.created_at,
    this.updated_at,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
