import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/domain/entities/category.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/entities/food.dart';
import 'package:foodies/application/domain/repositories/food_repository.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

void main() {
  late MockFoodRepository mockFoodRepository;
  late FoodUseCase foodUseCase;

  setUp(() {
    mockFoodRepository = MockFoodRepository();
    foodUseCase = FoodUseCase(mockFoodRepository);
  });

  const category = FoodCategory(strCategory: "Beef");
  const food = Food(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");
  const detail = Detail(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");

  test(
    'should get food category from the repository',
    () async {
      when(() => mockFoodRepository.getDataFoodCategory())
          .thenAnswer((_) async => const Right([category]));
      final result = await foodUseCase.executeGetCategory();
      expect(result, equals(const Right([category])));
    },
  );

  test(
    'should get all food from the repository',
    () async {
      when(() => mockFoodRepository.getDataFood(category.strCategory))
          .thenAnswer((_) async => const Right([food]));
      final result = await foodUseCase.executeGetFood(category.strCategory);
      expect(result, equals(const Right([food])));
    },
  );

  test(
    'should get detail food from the repository',
    () async {
      when(() => mockFoodRepository.getDataDetail(food.idMeal))
          .thenAnswer((_) async => const Right([detail]));
      final result = await foodUseCase.executeGetDetail(food.idMeal);
      expect(result, equals(const Right([detail])));
    },
  );
}
