import 'dart:convert';

import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/service/api_info.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  final APIInfo apiInfo;

  CategoryRemoteDataSourceImpl({
    required this.client,
    required this.apiInfo,
  });

  @override
  Future<List<CategoryModel>> getAllCategories() => _getAllCategories();

  @override
  Future<CategoryModel> getCategoryById(String id) {
    throw UnimplementedError();
  }

  Future<List<CategoryModel>> _getAllCategories() async {
    Uri uri = apiInfo.getUrl(url: 'Category', extraParameters: {'order': 'id'});
    final response = await client.get(uri, headers: apiInfo.getHeaders());

    if (response.statusCode == 200) {
      final List<CategoryModel> tCategoryList =
          (json.decode(response.body) as List<dynamic>)
              .map<CategoryModel>((item) => CategoryModel.fromJson(item))
              .toList();

      return tCategoryList;
    } else {
      throw ServerException();
    }
  }
}
