import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const Food(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});

  @override
  List<Object?> get props => [idMeal];
}
