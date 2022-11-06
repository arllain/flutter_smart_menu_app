import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required int id,
      required UserModel userModel,
      required bool isDelivered})
      : super(
          id: id,
          userEntity: userModel,
          isDelivered: isDelivered,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userModel: UserModel.fromJson(json['userModel']),
      isDelivered: json['isDelivered'],
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
