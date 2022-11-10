import 'dart:convert';
import 'package:smart_menu_app/layers/data/models/order_item/order_item_model.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required int id,
    required UserModel userModel,
    required bool isDelivered,
    required List<OrderItemModel> items,
  }) : super(
          id: id,
          userEntity: userModel,
          isDelivered: isDelivered,
          items: items,
        );

  factory OrderModel.fromJson(Map<String, dynamic> jsonStr) {
    return OrderModel(
      id: jsonStr['id'],
      userModel: UserModel.fromJson(jsonStr['userModel']),
      isDelivered: jsonStr['isDelivered'],
      items: jsonStr['items'].length > 0
          ? (json.decode(jsonStr['items']) as List<dynamic>)
              .map<OrderItemModel>((item) => OrderItemModel.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userModel': (userEntity as UserModel).toJson(),
      'isDelivered': isDelivered,
    };
  }
}
