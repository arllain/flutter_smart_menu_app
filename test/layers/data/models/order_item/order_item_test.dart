import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/data/models/order_item/order_item_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order_item/order_item_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  var dateCreated = DateTime.tryParse('2022-08-27T21:40:19+00:00') as DateTime;

  var tCategoryModel = CategoryModel(
      id: 1,
      name: 'category name',
      description: 'category description',
      dateCreated: dateCreated);

  var tProductModel = ProductModel(
      id: 1,
      name: 'product name',
      description: 'product description',
      category: tCategoryModel,
      price: 5.00,
      imageURL: 'https://images',
      dateCreated: dateCreated);

  var tUserModel = const UserModel(
      uid: '123456',
      email: 'email@test.com',
      photoURL: 'https://photoURL.com',
      isVerified: true,
      displayName: 'displayName');

  var tOrderModel = OrderModel(
    id: 1,
    userModel: tUserModel,
    isDelivered: false,
  );

  var tOrderItemModel = OrderItemModel(
    id: 1,
    orderModel: tOrderModel,
    productModel: tProductModel,
    quantity: 2,
  );

  test('should be a subclass of Order Item entity', () {
    expect(tOrderItemModel, isA<OrderItemEntity>());
  });

  group(
    'fromJson',
    () {
      test('should return a valida order item model from JSON', () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('/order_item/order_item.json'));

        final result = OrderItemModel.fromJson(jsonMap);
        expect(result, tOrderItemModel);
      });
    },
  );

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tOrderItemModel.toJson();
        final expectedMap = {
          "id": 1,
          "order_id": {
            "id": 1,
            "isDelivered": false,
            "userModel": {
              "uid": "123456",
              "email": "email@test.com",
              "photoURL": "https://photoURL.com",
              "isVerified": true,
              "displayName": "displayName"
            }
          },
          "product_id": {
            "id": 1,
            "name": "product name",
            "description": "product description",
            "price": 5.00,
            "imageURL": "https://images",
            "dateCreated": "2022-08-27 21:40:19.000Z",
            "category": {
              "id": 1,
              "name": "category name",
              "description": "category description",
              "dateCreated": "2022-08-27 21:40:19.000Z"
            }
          },
          "quantity": 2
        };
        expect(result, expectedMap);
      },
    );
  });
}
