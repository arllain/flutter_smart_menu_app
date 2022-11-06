import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

void main() {
  test('Order Entity expected not to be null', () {
    UserEntity userEntity = const UserEntity(
        uid: '154545454548',
        isVerified: true,
        email: 'email@test.com',
        photoURL: "https://photoURL.com",
        displayName: 'user entity');

    OrderEntity orderEntity = OrderEntity(
      id: 1,
      userEntity: userEntity,
      isDelivered: false,
    );

    expect(orderEntity, isNotNull);
  });

  test('Order Entity expected not to hava a not null user', () {
    UserEntity userEntity = const UserEntity(
        uid: '154545454548',
        isVerified: true,
        email: 'email@test.com',
        photoURL: "https://photoURL.com",
        displayName: 'user entity');

    OrderEntity orderEntity = OrderEntity(
      id: 1,
      userEntity: userEntity,
      isDelivered: false,
    );

    expect(orderEntity.userEntity, isNotNull);
  });
}
