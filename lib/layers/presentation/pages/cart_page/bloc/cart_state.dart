part of 'cart_bloc.dart';

enum CartStatus { initial, success, error, loading }

extension CartStatusX on CartStatus {
  bool get isInitial => this == CartStatus.initial;
  bool get isSuccess => this == CartStatus.success;
  bool get isError => this == CartStatus.error;
  bool get isLoading => this == CartStatus.loading;
}

class CartState extends Equatable {
  final Map<ProductEntity, int> cartList;
  final CartStatus status;
  final String message;

  const CartState(
      {Map<ProductEntity, int>? cartList,
      this.status = CartStatus.initial,
      this.message = ''})
      : cartList = cartList ?? const {};

  @override
  List<Object> get props => [cartList, status, message];

  CartState copyWith({
    Map<ProductEntity, int>? cartList,
    CartStatus? status,
    String? message,
  }) {
    return CartState(
        cartList: cartList,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}
