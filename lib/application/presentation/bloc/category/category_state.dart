part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class EmptyCategory extends CategoryState {}

class LoadingCategory extends CategoryState {}

class ErrorCategory extends CategoryState {
  final String message;

  const ErrorCategory(this.message);

  @override
  List<Object> get props => [message];
}

class HasDataCategory extends CategoryState {
  final List<FoodCategory> lsFoodCategory;

  const HasDataCategory(this.lsFoodCategory);

  @override
  List<Object> get props => [lsFoodCategory];
}
