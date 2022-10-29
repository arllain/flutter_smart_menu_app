import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImp({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() => _getAllProductsFromUrl(
      "${dotenv.get('BASE_URL')}Product?select=id, name, description,price, imageURL, created_at, category(*)");

  @override
  Future<
      List<
          ProductModel>> getProductsByCategory(int id) => _getAllProductsFromUrl(
      "${dotenv.get('BASE_URL')}Product?select=id, name, description,price, imageURL, created_at, category(*)&category=eq.$id&order=id");

  Future<List<ProductModel>> _getAllProductsFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY')
      },
    );

    if (response.statusCode == 200) {
      final List<ProductModel> productList =
          (json.decode(response.body) as List<dynamic>)
              .map<ProductModel>((item) => ProductModel.fromJson(item))
              .toList();

      return productList;
    } else {
      throw ServerException();
    }
  }
}
