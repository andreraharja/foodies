import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/food.dart';
import '../../../domain/usecase/food_usecase.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodUseCase _foodUseCase;

  FoodBloc(this._foodUseCase) : super(FoodInitial()) {
    on<GetListFood>((event, emit) async {
      emit(LoadingFood());
      final result = await _foodUseCase.executeGetFood(event.category);
      result.fold((failure) => emit(ErrorFood(failure.message)),
          (data) => emit(HasDataFood(event.category, data)));
    });
  }
}
