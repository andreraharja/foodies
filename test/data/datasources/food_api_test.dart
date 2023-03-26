import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/datasources/food_api.dart';
import 'package:foodies/application/data/exceptions.dart';
import 'package:foodies/application/data/models/m_meals.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/json_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late FoodDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = FoodDataSourceImpl(dio: mockDio);
  });

  group('get category', () {
    final mCategory = MMealsCategory.fromJson(
        json.decode(readJson('helper/dummy_data/dummy_category.json')));

    test(
      'should return categroy model when the response code is 200',
      () async {
        when(
          () => mockDio
              .get("https://www.themealdb.com/api/json/v1/1/list.php?c=list"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 200,
              data: json
                  .decode(readJson('helper/dummy_data/dummy_category.json')),
              requestOptions: RequestOptions(
                  path:
                      "https://www.themealdb.com/api/json/v1/1/list.php?c=list"))),
        );
        final result = await dataSource.getFoodCategory();
        expect(result, equals(mCategory.meals));
      },
    );

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        when(
          () => mockDio
              .get("https://www.themealdb.com/api/json/v1/1/list.php?c=list"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 404,
              data: 'Not Found',
              requestOptions: RequestOptions(
                  path:
                      "https://www.themealdb.com/api/json/v1/1/list.php?c=list"))),
        );
        final call = dataSource.getFoodCategory();
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get food', () {
    final mFood = MMealsFood.fromJson(
        json.decode(readJson('helper/dummy_data/dummy_food.json')));

    test(
      'should return food model when the response code is 200',
      () async {
        when(
          () => mockDio
              .get("https://themealdb.com/api/json/v1/1/filter.php?c=Beef"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 200,
              data: json.decode(readJson('helper/dummy_data/dummy_food.json')),
              requestOptions: RequestOptions(
                  path:
                      "https://themealdb.com/api/json/v1/1/filter.php?c=Beef"))),
        );
        final result = await dataSource.getFood("Beef");
        expect(result, equals(mFood.meals));
      },
    );

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        when(
          () => mockDio
              .get("https://themealdb.com/api/json/v1/1/filter.php?c=Beef"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 404,
              data: 'Not Found',
              requestOptions: RequestOptions(
                  path:
                      "https://themealdb.com/api/json/v1/1/filter.php?c=Beef"))),
        );
        final call = dataSource.getFood("Beef");
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get detail food', () {
    final mDetail = MMealsDetail.fromJson(
        json.decode(readJson('helper/dummy_data/dummy_detail.json')));

    test(
      'should return detail food model when the response code is 200',
      () async {
        when(
          () => mockDio.get(
              "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 200,
              data:
                  json.decode(readJson('helper/dummy_data/dummy_detail.json')),
              requestOptions: RequestOptions(
                  path:
                      "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772"))),
        );
        final result = await dataSource.getFoodDetail("52772");
        expect(result, equals(mDetail.meals));
      },
    );

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        when(
          () => mockDio.get(
              "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772"),
        ).thenAnswer(
          (_) async => Future.value(Response(
              statusCode: 404,
              data: 'Not Found',
              requestOptions: RequestOptions(
                  path:
                      "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772"))),
        );
        final call = dataSource.getFoodDetail("52772");
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}
