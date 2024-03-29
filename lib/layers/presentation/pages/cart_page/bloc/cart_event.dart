part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCartList extends CartEvent {}

class UpdateCartEvent extends CartEvent {
  final ProductEntity product;
  final bool isAdd;

  UpdateCartEvent({
    required this.product,
    required this.isAdd,
  });

  @override
  List<Object> get props => [product, isAdd];
}

class DeleteProductsEvent extends CartEvent {
  final ProductEntity product;

  DeleteProductsEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class ClearCartEvent extends CartEvent {}
