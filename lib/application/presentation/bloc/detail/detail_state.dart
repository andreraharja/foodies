part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class EmptyDetail extends DetailState {}

class LoadingDetail extends DetailState {}

class ErrorDetail extends DetailState {
  final String message;

  const ErrorDetail(this.message);

  @override
  List<Object> get props => [message];
}

class HasDataDetail extends DetailState {
  final List<Detail> lsDetail;

  const HasDataDetail(this.lsDetail);

  @override
  List<Object> get props => [lsDetail];
}
