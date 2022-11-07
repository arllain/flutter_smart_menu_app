part of 'order_bloc.dart';

enum OrderStatus { initial, success, error, loading }

extension OrderStatusX on OrderStatus {
  bool get isInitial => this == OrderStatus.initial;
  bool get isSuccess => this == OrderStatus.success;
  bool get isError => this == OrderStatus.error;
  bool get isLoading => this == OrderStatus.loading;
}

class OrderState extends Equatable {
  final OrderModel? orderModel;
  final OrderStatus status;
  final String message;

  const OrderState({
    this.orderModel,
    this.status = OrderStatus.initial,
    this.message = '',
  });

  @override
  List<Object> get props => [status, message];

  OrderState copyWith({
    OrderModel? orderModel,
    OrderStatus? status,
    String? message,
  }) {
    return OrderState(
      orderModel: orderModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
