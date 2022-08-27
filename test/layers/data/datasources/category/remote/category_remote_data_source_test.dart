import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';

// @GenerateMocks([SharedPreferences])
void main() {
  late CategoryLocalDataSourceImpl dataSource;
  // late MockSharedPreferences mockSharedPreferences;
  const cachedCategoryList = 'CACHED_CATEGORY_LIST';

  setUpAll(() {
    // mockSharedPreferences = MockSharedPreferences();
    // dataSource =
    //     CategoryLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  // group('getAllCategories', () {
  //   final List<CategoryModel> tCategoryList =
  //       (json.decode(fixture('/category/category_list_cached.json'))
  //               as List<dynamic>)
  //           .map<CategoryModel>((item) => CategoryModel.fromJson(item))
  //           .toList();

  //   test(
  //       'should return a list of Category from SharedPreferences when there is a list in the cache',
  //       () async {
  //     // arrange
  //     when(mockSharedPreferences.getString(any))
  //         .thenReturn(fixture('/category/category_list_cached.json'));
  //     //act
  //     final result = await dataSource.getAllCategories();
  //     //assert
  //     verify(mockSharedPreferences.getString(cachedCategoryList));
  //     expect(result, equals(tCategoryList));
  //   });
  // });
}
