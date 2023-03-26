import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/models/m_category.dart';
import 'package:foodies/application/data/models/m_meals.dart';
import 'package:foodies/application/domain/entities/category.dart';

import '../../helper/json_reader.dart';

void main() {
  const mCategory = MCategory(strCategory: "Beef");
  const foodCategory = FoodCategory(strCategory: "Beef");

  group('to entity', () {
    test(
      'should be a subclass of Food Category entity',
      () async {
        final result = mCategory.toEntity();
        expect(result, equals(foodCategory));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helper/dummy_data/dummy_category.json'),
        );
        final result = MMealsCategory.fromJson(jsonMap);
        expect(result.meals![0], equals(mCategory));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        final result = mCategory.toJson();
        final expectedJsonMap = {'strCategory': 'Beef'};
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
