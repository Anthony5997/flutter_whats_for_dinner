// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      rating: json['rating'] as String?,
      author: json['author'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'rating': instance.rating,
      'author': instance.author,
      'created_at': instance.created_at?.toIso8601String(),
    };
