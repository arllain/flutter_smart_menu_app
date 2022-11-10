import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

class OrderItemEntity extends Equatable {
  final int id;
  final OrderEntity orderEntity;
  final ProductEntity productEntity;
  final int quantity;

  const OrderItemEntity({
    required this.id,
    required this.orderEntity,
    required this.productEntity,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, orderEntity, productEntity, quantity];
}
