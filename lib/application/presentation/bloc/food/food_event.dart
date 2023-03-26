part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class GetListFood extends FoodEvent {
  final String category;

  const GetListFood(this.category);

  @override
  List<Object> get props => [category];
}