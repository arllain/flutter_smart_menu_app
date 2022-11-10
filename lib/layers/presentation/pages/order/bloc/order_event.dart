part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SaveOrderEvent extends OrderEvent {
  final OrderModel orderModel;

  SaveOrderEvent({
    required this.orderModel,
  });

  @override
  List<Object> get props => [orderModel];
}
