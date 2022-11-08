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
  final int? orderId;
  final OrderStatus status;
  final String message;

  const OrderState({
    this.orderModel,
    this.orderId,
    this.status = OrderStatus.initial,
    this.message = '',
  });

  @override
  List<Object> get props => [status, message];

  OrderState copyWith({
    OrderModel? orderModel,
    int? orderId,
    OrderStatus? status,
    String? message,
  }) {
    return OrderState(
      orderModel: orderModel,
      orderId: orderId,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
