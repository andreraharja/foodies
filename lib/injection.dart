import 'package:dio/dio.dart';
import 'package:foodies/application/data/datasources/food_api.dart';
import 'package:foodies/application/data/repositories/food_repository_impl.dart';
import 'package:foodies/application/domain/repositories/food_repository.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';
import 'package:foodies/application/presentation/bloc/category/category_bloc.dart';
import 'package:foodies/application/presentation/bloc/detail/detail_bloc.dart';
import 'package:foodies/application/presentation/bloc/food/food_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // bloc
  locator.registerFactory(() => CategoryBloc(locator()));
  locator.registerFactory(() => FoodBloc(locator()));
  locator.registerFactory(() => DetailBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => FoodUseCase(locator()));

  // repository
  locator.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(
      foodDataSource: locator(),
    ),
  );

  // data source
  Dio dio = Dio();
  locator.registerLazySingleton<FoodDataSource>(
    () => FoodDataSourceImpl(
      dio: dio,
    ),
  );

  // external
  locator.registerLazySingleton(() => Dio);
}
