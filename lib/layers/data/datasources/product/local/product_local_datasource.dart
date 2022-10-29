import 'package:smart_menu_app/layers/data/models/product/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getProductsByCategory(int id);

  Future<void> cacheProductList(List<ProductModel> productList);
}
