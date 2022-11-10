import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
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
    items: const [],
  );

  test('should be a subclass of Order entity', () {
    expect(tOrderModel, isA<OrderEntity>());
  });

  group(
    'fromJson',
    () {
      test('should return a valida order model from JSON', () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('/order/order.json'));

        final result = OrderModel.fromJson(jsonMap);
        expect(result, tOrderModel);
      });
    },
  );

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tOrderModel.toJson();
        final expectedMap = {
          "id": 1,
          "isDelivered": false,
          "userModel": {
            "uid": "123456",
            "email": "email@test.com",
            "photoURL": "https://photoURL.com",
            "isVerified": true,
            "displayName": "displayName"
          }
        };
        expect(result, expectedMap);
      },
    );
  });
}
