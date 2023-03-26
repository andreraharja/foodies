import 'package:equatable/equatable.dart';

class FoodCategory extends Equatable {
  final String strCategory;

  const FoodCategory({required this.strCategory});

  @override
  List<Object?> get props => [strCategory];
}
