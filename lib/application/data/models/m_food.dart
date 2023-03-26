import 'package:equatable/equatable.dart';
import 'package:foodies/application/domain/entities/food.dart';

class MFood extends Equatable {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const MFood(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  factory MFood.fromJson(Map<String, dynamic> json) {
    return MFood(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
        idMeal: json['idMeal']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }

  Food toEntity() =>
      Food(strMeal: strMeal, strMealThumb: strMealThumb, idMeal: idMeal);

  @override
  List<Object?> get props => [idMeal];
}
