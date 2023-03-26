part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetListCategory extends CategoryEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
