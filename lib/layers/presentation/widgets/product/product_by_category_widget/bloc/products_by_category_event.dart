part of 'products_by_category_bloc.dart';

abstract class ProductsByCategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductsByCategoryEvent extends ProductsByCategoryEvent {
  final int idSelected;
  final String categoryName;

  GetProductsByCategoryEvent({
    required this.idSelected,
    required this.categoryName,
  });

  @override
  List<Object> get props => [idSelected, categoryName];
}
