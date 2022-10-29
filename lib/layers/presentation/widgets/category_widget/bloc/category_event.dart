part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllCategoriesEvent extends CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  SelectCategoryEvent({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}
