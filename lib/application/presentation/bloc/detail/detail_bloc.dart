import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/domain/usecase/food_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final FoodUseCase _foodUseCase;

  DetailBloc(this._foodUseCase) : super(DetailInitial()) {
    on<GetDetailFood>((event, emit) async {
      emit(LoadingDetail());
      final result = await _foodUseCase.executeGetDetail(event.id);
      result.fold((failure) => emit(ErrorDetail(failure.message)),
              (data) => emit(HasDataDetail(data)));
    });
  }
}
