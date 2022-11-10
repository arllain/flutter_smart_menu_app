import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  var dateCreated = DateTime.tryParse('2022-08-27T21:40:19+00:00') as DateTime;

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
          "dateCreated": "2022-08-27 21:40:19.000Z"
        };
        expect(result, expectedMap);
      },
    );
  });
}
