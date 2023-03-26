import 'package:dio/dio.dart';
import 'package:foodies/application/data/models/m_category.dart';
import 'package:foodies/application/data/models/m_detail.dart';
import 'package:foodies/application/data/models/m_food.dart';
import 'package:foodies/application/data/models/m_meals.dart';

import '../exceptions.dart';

abstract class FoodDataSource {
  Future<List<MCategory>> getFoodCategory();
  Future<List<MFood>> getFood(String category);
  Future<List<MDetail>> getFoodDetail(String id);
}

class FoodDataSourceImpl implements FoodDataSource {
  final Dio dio;
  FoodDataSourceImpl({required this.dio});

  @override
  Future<List<MCategory>> getFoodCategory() async {
    Response response = await dio
        .get("https://www.themealdb.com/api/json/v1/1/list.php?c=list");
    List<MCategory> lsResult = [];
    if (response.statusCode == 200) {
      var mealsCategory = MMealsCategory.fromJson(response.data);
      mealsCategory.meals?.forEach((element) {
        lsResult.add(element);
      });
      return lsResult;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MFood>> getFood(String category) async {
    Response response = await dio
        .get("https://themealdb.com/api/json/v1/1/filter.php?c=" + category);
    List<MFood> lsResult = [];
    if (response.statusCode == 200) {
      var mealsFood = MMealsFood.fromJson(response.data);
      mealsFood.meals?.forEach((element) {
        lsResult.add(element);
      });
      return lsResult;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MDetail>> getFoodDetail(String id) async {
    Response response = await dio
        .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id);
    List<MDetail> lsResult = [];
    if (response.statusCode == 200) {
      var mealsDetail = MMealsDetail.fromJson(response.data);
      mealsDetail.meals?.forEach((element) {
        lsResult.add(element);
      });
      return lsResult;
    } else {
      throw ServerException();
    }
  }
}
