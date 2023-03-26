part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class EmptyFood extends FoodState {}

class LoadingFood extends FoodState {}

class ErrorFood extends FoodState {
  final String message;

  const ErrorFood(this.message);

  @override
  List<Object> get props => [message];
}

class HasDataFood extends FoodState {
  final String category;
  final List<Food> lsFood;

  const HasDataFood(this.category, this.lsFood);

  @override
  List<Object> get props => [category, lsFood];
}
