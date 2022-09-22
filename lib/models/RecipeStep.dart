// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'RecipeStep.g.dart';

@JsonSerializable()
class RecipeStep {
  final int step_number;
  final String step;

  RecipeStep({
    required this.step_number,
    required this.step,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);

  /// Connect the generated [_$RecipeStepToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
}
