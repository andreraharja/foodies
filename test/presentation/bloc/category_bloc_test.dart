import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/failures.dart';
import 'package:foodies/application/domain/entities/category.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';
import 'package:foodies/application/presentation/bloc/category/category_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFoodUseCase extends Mock implements FoodUseCase {}

void main() {
  late MockFoodUseCase mockFoodUseCase;
  late CategoryBloc categoryBloc;

  setUp(() {
    mockFoodUseCase = MockFoodUseCase();
    categoryBloc = CategoryBloc(mockFoodUseCase);
  });

  const category = FoodCategory(strCategory: "Beef");

  test(
    'initial state should be empty',
    () {
      expect(categoryBloc.state, CategoryInitial());
    },
  );

  blocTest<CategoryBloc, CategoryState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(() => mockFoodUseCase.executeGetCategory())
          .thenAnswer((_) async => const Right([category]));
      return categoryBloc;
    },
    act: (bloc) => bloc.add(GetListCategory()),
    expect: () => [
      LoadingCategory(),
      const HasDataCategory([category]),
    ],
    verify: (bloc) {
      verify(() => mockFoodUseCase.executeGetCategory());
    },
  );

  blocTest<CategoryBloc, CategoryState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(() => mockFoodUseCase.executeGetCategory())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return categoryBloc;
    },
    act: (bloc) => bloc.add(GetListCategory()),
    expect: () => [
      LoadingCategory(),
      const ErrorCategory('Server Failure'),
    ],
    verify: (bloc) {
      verify(() => mockFoodUseCase.executeGetCategory());
    },
  );
}
