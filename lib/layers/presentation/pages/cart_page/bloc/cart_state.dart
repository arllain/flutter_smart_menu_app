part of 'cart_bloc.dart';

enum CartStatus { initial, success, error, loading }

extension CartStatusX on CartStatus {
  bool get isInitial => this == CartStatus.initial;
  bool get isSuccess => this == CartStatus.success;
  bool get isError => this == CartStatus.error;
  bool get isLoading => this == CartStatus.loading;
}

class CartState extends Equatable {
  final List<ProductEntity> products;
  final CartStatus status;
  final String message;

  const CartState(
      {List<ProductEntity>? products,
      this.status = CartStatus.initial,
      String message = ''})
      : products = products ?? const [],
        message = message;

  @override
  List<Object> get props => [products, status, message];

  CartState copyWith({
    List<ProductEntity>? products,
    CartStatus? status,
    String? message,
  }) {
    return CartState(
        products: products ?? this.products,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}
