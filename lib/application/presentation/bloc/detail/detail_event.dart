part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class GetDetailFood extends DetailEvent {
  final String id;

  const GetDetailFood(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
