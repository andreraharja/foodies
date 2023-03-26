import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/usecase/food_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FoodUseCase _foodUseCase;

  CategoryBloc(this._foodUseCase) : super(CategoryInitial()) {
    on<GetListCategory>((event, emit) async {
      emit(LoadingCategory());
      final result = await _foodUseCase.executeGetCategory();
      result.fold((failure) => emit(ErrorCategory(failure.message)),
              (data) => emit(HasDataCategory(data)));
    });
  }
}
