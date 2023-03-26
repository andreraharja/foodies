import 'package:dartz/dartz.dart';
import 'package:foodies/application/domain/entities/category.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/entities/food.dart';
import 'package:foodies/application/domain/repositories/food_repository.dart';

import '../../data/failures.dart';

class FoodUseCase {
  final FoodRepository repository;
  FoodUseCase(this.repository);

  Future<Either<Failure, List<FoodCategory>>> executeGetCategory() {
    return repository.getDataFoodCategory();
  }

  Future<Either<Failure, List<Food>>> executeGetFood(String category) {
    return repository.getDataFood(category);
  }

  Future<Either<Failure, List<Detail>>> executeGetDetail(String id) {
    return repository.getDataDetail(id);
  }
}