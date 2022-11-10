import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/order/remote/order_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/models/order_item/order_item_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:http/http.dart' as http;
import 'package:smart_menu_app/layers/domain/entities/order_item/order_item_entity.dart';

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final http.Client client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<int> saveOrder(OrderEntity order) =>
      _saveOrder("${dotenv.get('BASE_URL')}Order", order);

  Future<int> _saveOrder(String url, OrderEntity order) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY'),
        'Authorization': dotenv.get('API_KEY'),
        'Prefer': 'resolution=merge-duplicates, return=representation',
      },
      body: orderToJson(order),
    );

    if (response.statusCode == 201) {
      final List<OrderId> orderId =
          (json.decode(response.body) as List<dynamic>)
              .map<OrderId>((item) => OrderId.fromJson(item))
              .toList();

      await _saveOrderItens(
          "${dotenv.get('BASE_URL')}Order_Item", orderId[0].id, order.items);

      return orderId[0].id;
    } else {
      throw ServerException();
    }
  }

  orderToJson(OrderEntity orderEntity) {
    var json = {
      "user_id": orderEntity.userEntity.uid,
      "isDelivered": false,
    };

    return jsonEncode(json);
  }

  orderItemToJson(int orderId, List<OrderItemEntity> items) {
    var json = items
        .map((item) => {
              "order_id": orderId,
              "product_id": item.productEntity.id,
              "quantity": item.quantity,
            })
        .toList();

    return jsonEncode(json);
  }

  Future<List<OrderItemModel>> _saveOrderItens(
      String url, int orderId, List<OrderItemEntity> items) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY'),
        'Authorization': dotenv.get('API_KEY'),
        'Prefer': 'resolution=merge-duplicates, return=representation',
      },
      body: orderItemToJson(orderId, items),
    );

    if (response.statusCode == 201) {
      return [];
    } else {
      throw ServerException();
    }
  }
}

class OrderId {
  final int id;
  OrderId({required this.id});

  factory OrderId.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    return OrderId(id: id);
  }
}
