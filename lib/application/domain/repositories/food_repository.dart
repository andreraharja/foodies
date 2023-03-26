import 'package:dartz/dartz.dart';
import 'package:foodies/application/domain/entities/category.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/entities/food.dart';

import '../../data/failures.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodCategory>>> getDataFoodCategory();
  Future<Either<Failure, List<Food>>> getDataFood(String category);
  Future<Either<Failure, List<Detail>>> getDataDetail(String id);
}
