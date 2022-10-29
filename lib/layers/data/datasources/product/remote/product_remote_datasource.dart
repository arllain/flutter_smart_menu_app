import 'package:smart_menu_app/layers/data/models/product/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getProductsByCategory(int id);
}
