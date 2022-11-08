import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/layers/domain/entities/order_item/order_item_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

class OrderEntity extends Equatable {
  final int id;
  final UserEntity userEntity;
  final bool isDelivered;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.id,
    required this.userEntity,
    required this.isDelivered,
    required this.items,
  });

  @override
  List<Object?> get props => [id, userEntity, isDelivered, items];
}
