import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/order/remote/order_remote_datasource.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final http.Client client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<OrderModel> saveOrder(OrderEntity order) =>
      _saveOrder("${dotenv.get('BASE_URL')}Order", order);

  Future<OrderModel> _saveOrder(String url, OrderEntity order) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY'),
        'Authorization': dotenv.get('API_KEY'),
        'Prefer': 'resolution=merge-duplicates, return=representation',
      },
      body: toJson(order),
    );

    if (response.statusCode == 201) {
      return order as OrderModel;
    } else {
      throw ServerException();
    }
  }

  toJson(OrderEntity orderEntity) {
    var json = {
      "user_id": orderEntity.userEntity.uid,
      "isDelivered": false,
    };

    return jsonEncode(json);
  }
}
