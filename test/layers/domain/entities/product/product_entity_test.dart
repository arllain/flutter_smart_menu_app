import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/core/enums/status/status.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

void main() {
  test('ProductEntity expected not to be null', () {
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
    expect(productEntity, isNotNull);
  });

  test('ProductEntity expected to have a not null category', () {
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
    expect(productEntity.category, isNotNull);
  });
}
