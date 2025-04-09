// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> $FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'categoryId': instance.categoryId,
      'sort': instance.sort,
    };
