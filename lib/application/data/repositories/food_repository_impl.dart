import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:foodies/application/domain/entities/category.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/entities/food.dart';
import 'package:foodies/application/domain/repositories/food_repository.dart';
import 'package:foodies/application/data/exceptions.dart';
import '../datasources/food_api.dart';
import '../failures.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodDataSource foodDataSource;

  FoodRepositoryImpl({required this.foodDataSource});

  @override
  Future<Either<Failure, List<FoodCategory>>> getDataFoodCategory() async {
    try {
      final result = await foodDataSource.getFoodCategory();
      List<FoodCategory> lsFoodCategory = [];
      for (var element in result) {
        lsFoodCategory.add(element.toEntity());
      }
      return Right(lsFoodCategory);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Food>>> getDataFood(String category) async {
    try {
      final result = await foodDataSource.getFood(category);
      List<Food> lsFood = [];
      for (var element in result) {
        lsFood.add(element.toEntity());
      }
      return Right(lsFood);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect the network'));
    }
  }

  @override
  Future<Either<Failure, List<Detail>>> getDataDetail(String id) async {
    try {
      final result = await foodDataSource.getFoodDetail(id);
      List<Detail> lsDetail = [];
      for (var element in result) {
        lsDetail.add(element.toEntity());
      }
      return Right(lsDetail);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect the network'));
    }
  }
}
