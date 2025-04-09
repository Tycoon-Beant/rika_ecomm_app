import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  double? min;
  double? max;
  String? categoryId;
  String? sort;

  FilterModel({
    this.min,
    this.max,
    this.categoryId,
    this.sort,
  });

  bool get isClear {
    return categoryId == null && min == null && max == null && sort == null;
  }

  

  FilterModel copyWith({
    double? min,
    double? max,
    String? categoryId,
    String? sort,
  }) {
    return FilterModel(
      min: min ?? this.min,
      max: max ?? this.max,
      categoryId: categoryId ?? this.categoryId,
      sort: sort ?? this.sort,
    );
  }

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
}
