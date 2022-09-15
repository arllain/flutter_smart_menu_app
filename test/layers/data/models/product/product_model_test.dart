import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

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

  test('Should be a subclass of Product entity', () async {
    expect(tProductModel, isA<ProductEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid product model from JSON',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('/product/product.json'));

        final result = ProductModel.fromJson(jsonMap);
        expect(result, tProductModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tProductModel.toJson();
        final expectedMap = {
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
        };
        expect(result, expectedMap);
      },
    );
  });
}
