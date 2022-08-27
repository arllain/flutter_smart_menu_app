import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.categoryLocalDataSource,
    required this.categoryRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategoryList =
            await categoryRemoteDataSource.getAllCategories();
        return Right(remoteCategoryList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCategoryList =
            await categoryLocalDataSource.getAllCategories();
        return Right(localCategoryList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int number) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}
