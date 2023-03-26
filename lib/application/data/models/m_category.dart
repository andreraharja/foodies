import 'package:equatable/equatable.dart';
import 'package:foodies/application/domain/entities/category.dart';

class MCategory extends Equatable {
  final String strCategory;

  const MCategory({required this.strCategory});

  factory MCategory.fromJson(Map<String, dynamic> json) {
    return MCategory(strCategory: json['strCategory']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strCategory'] = strCategory;
    return data;
  }

  FoodCategory toEntity() => FoodCategory(
        strCategory: strCategory,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [strCategory];
}
