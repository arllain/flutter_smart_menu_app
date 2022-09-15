import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductLocalDataSource productLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImp({
    required this.productLocalDataSource,
    required this.productRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductList =
            await productRemoteDataSource.getAllProducts();
        productLocalDataSource.cacheProductList(remoteProductList);
        return Right(remoteProductList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProductList = await productLocalDataSource.getAllProducts();
        return Right(localProductList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductList =
            await productRemoteDataSource.getProductsByCategory(id);
        return Right(remoteProductList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProductList =
            await productLocalDataSource.getProductsByCategory(id);
        return Right(localProductList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
