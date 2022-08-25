import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  var dateCreated = DateTime.parse('2022-08-25 00:36:58.235742');
  var tCategoryModel = CategoryModel(
      id: 1,
      name: 'category name',
      description: 'category description',
      dateCreated: dateCreated);

  test('Should be a subclass of Category entity', () async {
    expect(tCategoryModel, isA<CategoryEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid category model from JSON',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('/category/category.json'));

        final result = CategoryModel.fromJson(jsonMap);
        expect(result, tCategoryModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tCategoryModel.toJson();
        final expectedMap = {
          "id": 1,
          "name": "category name",
          "description": "category description",
          "dateCreated": "2022-08-25 00:36:58.235742"
        };
        expect(result, expectedMap);
      },
    );
  });
}
