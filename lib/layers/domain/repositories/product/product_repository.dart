import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int number);

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
