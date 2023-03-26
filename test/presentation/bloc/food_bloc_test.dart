import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/failures.dart';
import 'package:foodies/application/domain/entities/food.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';
import 'package:foodies/application/presentation/bloc/food/food_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFoosUseCase extends Mock implements FoodUseCase {}

void main() {
  late MockFoosUseCase mockFoosUseCase;
  late FoodBloc foodBloc;

  setUp(() {
    mockFoosUseCase = MockFoosUseCase();
    foodBloc = FoodBloc(mockFoosUseCase);
  });

  const category = "Beef";
  const food = Food(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");

  test(
    'initial state should be empty',
    () {
      expect(foodBloc.state, FoodInitial());
    },
  );

  blocTest<FoodBloc, FoodState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(() => mockFoosUseCase.executeGetFood(category))
          .thenAnswer((_) async => const Right([food]));
      return foodBloc;
    },
    act: (bloc) => bloc.add(const GetListFood(category)),
    expect: () => [
      LoadingFood(),
      const HasDataFood(category, [food]),
    ],
    verify: (bloc) {
      verify(() => mockFoosUseCase.executeGetFood(category));
    },
  );

  blocTest<FoodBloc, FoodState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(() => mockFoosUseCase.executeGetFood(category))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return foodBloc;
    },
    act: (bloc) => bloc.add(const GetListFood(category)),
    expect: () => [
      LoadingFood(),
      const ErrorFood('Server Failure'),
    ],
    verify: (bloc) {
      verify(() => mockFoosUseCase.executeGetFood(category));
    },
  );
}
