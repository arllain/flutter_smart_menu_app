import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order_item/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required int id,
    required OrderModel orderModel,
    required ProductModel productModel,
    required int quantity,
  }) : super(
            id: id,
            orderEntity: orderModel,
            productEntity: productModel,
            quantity: quantity);

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderModel: OrderModel.fromJson(json['order_id']),
      productModel: ProductModel.fromJson(json['product_id']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': (orderEntity as OrderModel).toJson(),
      'product_id': (productEntity as ProductModel).toJson(),
      'quantity': quantity
    };
  }
}
