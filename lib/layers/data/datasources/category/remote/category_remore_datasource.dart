import 'package:smart_menu_app/layers/data/models/category/category_model.dart';

abstract class CategoryRemoteDataSource {
  /// Calls the https://parseapi.back4app.com/classes/Category/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<CategoryModel>> getAllCategories();

  /// Calls the https://parseapi.back4app.com/classes/Category/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes
  Future<CategoryModel> getCategoryById(String id);
}
