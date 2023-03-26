import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/application/data/failures.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';
import 'package:foodies/application/presentation/bloc/detail/detail_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockFoosUseCase extends Mock implements FoodUseCase {}

void main() {
  late MockFoosUseCase mockFoosUseCase;
  late DetailBloc detailBloc;

  setUp(() {
    mockFoosUseCase = MockFoosUseCase();
    detailBloc = DetailBloc(mockFoosUseCase);
  });

  const idMeal = "52874";
  const detail = Detail(
      strMeal: "Beef and Mustard Pie",
      strMealThumb:
          "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      idMeal: "52874");

  test(
    'initial state should be empty',
    () {
      expect(detailBloc.state, DetailInitial());
    },
  );

  blocTest<DetailBloc, DetailState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(() => mockFoosUseCase.executeGetDetail(idMeal))
          .thenAnswer((_) async => const Right([detail]));
      return detailBloc;
    },
    act: (bloc) => bloc.add(const GetDetailFood(idMeal)),
    expect: () => [
      LoadingDetail(),
      const HasDataDetail([detail]),
    ],
    verify: (bloc) {
      verify(() => mockFoosUseCase.executeGetDetail(idMeal));
    },
  );

  blocTest<DetailBloc, DetailState>(
    'should emit [loading, has data] when data is gotten unsuccessful',
    build: () {
      when(() => mockFoosUseCase.executeGetDetail(idMeal))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return detailBloc;
    },
    act: (bloc) => bloc.add(const GetDetailFood(idMeal)),
    expect: () => [
      LoadingDetail(),
      const ErrorDetail('Server Failure'),
    ],
    verify: (bloc) {
      verify(() => mockFoosUseCase.executeGetDetail(idMeal));
    },
  );
}
