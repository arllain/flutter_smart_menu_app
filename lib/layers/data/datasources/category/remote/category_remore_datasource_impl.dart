import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;

  CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getAllCategories() =>
      _getAllCategoriesFormUrl("${dotenv.get('BASE_URL')}Category?order=id");

  @override
  Future<CategoryModel> getCategoryById(String id) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  Future<List<CategoryModel>> _getAllCategoriesFormUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY')
      },
    );

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
