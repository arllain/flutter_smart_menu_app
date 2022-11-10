import 'package:smart_menu_app/layers/data/models/category/category_model.dart';

abstract class CategoryLocalDataSource {
  /// Get the cached [CategoryModel] list which was gotten the last time
  /// the user had an internet conncetion
  ///
  /// Throws [CacheException] if no cached data is present
  Future<List<CategoryModel>> getAllCategories();

  Future<void> cacheCategoryList(List<CategoryModel> categoryList);
}
