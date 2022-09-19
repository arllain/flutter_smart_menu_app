import 'dart:convert';

import 'package:dartz/dartz_unsafe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';

const cachedProductList = 'CACHED_PRODUCT_LIST';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<ProductModel>> getAllProducts() {
    final List<dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(cachedProductList) ?? '[]');

    if (jsonData.isNotEmpty) {
      var list = jsonData.map<ProductModel>((jsonItem) {
        return ProductModel.fromSheredPrefencesJson(jsonItem);
      }).toList();

      return Future.value(list);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int id) {
    final List<dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(cachedProductList) ?? '[]');

    if (jsonData.isNotEmpty) {
      var list = jsonData.map<ProductModel>((jsonItem) {
        return ProductModel.fromSheredPrefencesJson(jsonItem);
      }).toList();

      if (id != 1) {
        list.retainWhere((element) => element.category.id == id);
      }

      return Future.value(list);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Future<bool>> cacheProductList(List<ProductModel> productList) async {
    return sharedPreferences.setString(
        cachedProductList, jsonEncode(productList));
  }
}
