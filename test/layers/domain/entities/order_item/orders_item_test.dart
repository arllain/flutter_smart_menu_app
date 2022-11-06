import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/order_items/order_items_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

void main() {
  test('Order Items expected not to nave a null Order', () {
    var dateCreated = DateTime.now();
    var categoryEntity = CategoryEntity(
        id: 1,
        name: 'Category 1',
        description: 'Category description',
        dateCreated: dateCreated);

    ProductEntity productEntity = ProductEntity(
      id: 1,
      name: 'Product 1',
      description: 'Product description',
      price: 100.00,
      category: categoryEntity,
      imageURL: 'http://images',
      dateCreated: dateCreated,
    );

    UserEntity userEntity = const UserEntity(
        uid: '154545454548',
        isVerified: true,
        email: 'email@test.com',
        photoURL: "https://photoURL.com",
        displayName: 'user entity');

    OrderEntity order = OrderEntity(
      id: 1,
      userEntity: userEntity,
      isDelivered: false,
    );

    OrderItemsEntity orderItem = OrderItemsEntity(
        id: 10, orderEntity: order, productEntity: productEntity, quantity: 2);

    expect(orderItem, isNotNull);
  });

  test('Order Items expected not to be null', () {
    var dateCreated = DateTime.now();
    var categoryEntity = CategoryEntity(
        id: 1,
        name: 'Category 1',
        description: 'Category description',
        dateCreated: dateCreated);

    ProductEntity productEntity = ProductEntity(
      id: 1,
      name: 'Product 1',
      description: 'Product description',
      price: 100.00,
      category: categoryEntity,
      imageURL: 'http://images',
      dateCreated: dateCreated,
    );

    UserEntity userEntity = const UserEntity(
        uid: '154545454548',
        isVerified: true,
        email: 'email@test.com',
        photoURL: "https://photoURL.com",
        displayName: 'user entity');

    OrderEntity order = OrderEntity(
      id: 1,
      userEntity: userEntity,
      isDelivered: false,
    );

    OrderItemsEntity orderItem = OrderItemsEntity(
        id: 10, orderEntity: order, productEntity: productEntity, quantity: 2);

    expect(orderItem, isNotNull);
  });
}
