import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/models/m_food.dart';
import 'package:foodies/application/data/models/m_meals.dart';
import 'package:foodies/application/domain/entities/food.dart';

import '../../helper/json_reader.dart';

void main() {
  const mFood = MFood(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");
  const food = Food(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");

  group('to entity', () {
    test(
      'should be a subclass of Food entity',
      () async {
        final result = mFood.toEntity();
        expect(result, equals(food));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helper/dummy_data/dummy_food.json'),
        );
        final result = MMealsFood.fromJson(jsonMap);
        expect(result.meals![0], equals(mFood));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        final result = mFood.toJson();
        final expectedJsonMap = {
          "strMeal": "Beef and Mustard Pie",
          "strMealThumb":
              "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
          "idMeal": "52874"
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
