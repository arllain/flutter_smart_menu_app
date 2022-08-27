import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';

const cachedCategoryList = 'CACHED_CATEGORY_LIST';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  CategoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CategoryModel>> getAllCategories() {
    final List<dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(cachedCategoryList) ?? '[]');

    if (jsonData.isNotEmpty) {
      var list = jsonData.map<CategoryModel>((jsonItem) {
        return CategoryModel.fromJson(jsonItem);
      }).toList();

      return Future.value(list);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Future<bool>> cacheCategoryList(
      List<CategoryModel> categoryList) async {
    return sharedPreferences.setString(
        cachedCategoryList, jsonEncode(categoryList));
  }
}
