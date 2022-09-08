// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RecipeStep.g.dart';

@JsonSerializable()
class RecipeStep extends Equatable {
  final int id;
  final int step_number;
  final String step;

  RecipeStep({
    required this.id,
    required this.step_number,
    required this.step,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);

  /// Connect the generated [_$RecipeStepToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
