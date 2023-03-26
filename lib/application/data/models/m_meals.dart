import 'package:equatable/equatable.dart';
import 'package:foodies/application/data/models/m_category.dart';
import 'package:foodies/application/data/models/m_detail.dart';
import 'package:foodies/application/data/models/m_food.dart';

class MMealsCategory extends Equatable {
  final List<MCategory>? meals;

  const MMealsCategory({this.meals});

  factory MMealsCategory.fromJson(Map<String, dynamic> json) {
    List<MCategory> lsMCategory = [];
    json['meals'].forEach((v) {
      lsMCategory.add(MCategory.fromJson(v));
    });
    return MMealsCategory(meals: lsMCategory);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [meals];
}

class MMealsFood extends Equatable {
  final List<MFood>? meals;

  const MMealsFood({this.meals});

  factory MMealsFood.fromJson(Map<String, dynamic> json) {
    List<MFood> lsMFood = [];
    json['meals'].forEach((v) {
      lsMFood.add(MFood.fromJson(v));
    });
    return MMealsFood(meals: lsMFood);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [meals];
}

class MMealsDetail extends Equatable {
  final List<MDetail>? meals;

  const MMealsDetail({this.meals});

  factory MMealsDetail.fromJson(Map<String, dynamic> json) {
    List<MDetail> lsMDetail = [];
    json['meals'].forEach((v) {
      lsMDetail.add(MDetail.fromJson(v));
    });
    return MMealsDetail(meals: lsMDetail);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [meals];
}
