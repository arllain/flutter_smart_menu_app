import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/data/repostirories/product/product_repository_impl.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([
  ProductLocalDataSource,
  ProductRemoteDataSource,
  NetworkInfo,
])
void main() {
  late ProductRepositoryImp repository;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  var dateCreated = DateTime.now();

  var tCategoryModel1 = CategoryModel(
      id: 1,
      name: 'category 1',
      description: 'category 1 description',
      dateCreated: dateCreated);

  var tCategoryModel2 = CategoryModel(
      id: 1,
      name: 'category 2',
      description: 'category 2 description',
      dateCreated: dateCreated);

  var tProductModel1 = ProductModel(
      id: 1,
      name: 'product name',
      description: 'product description',
      category: tCategoryModel1,
      price: 5.00,
      imageURL: 'https://images',
      dateCreated: dateCreated);

  var tProductModel2 = ProductModel(
      id: 2,
      name: 'product name',
      description: 'product description',
      category: tCategoryModel1,
      price: 15.00,
      imageURL: 'https://images',
      dateCreated: dateCreated);

  List<ProductModel> tAllProductModelList = [tProductModel1, tProductModel2];
  List<ProductEntity> tAllProductList = tAllProductModelList;
  List<ProductModel> tProductModelByCategoryList = [tProductModel1];
  List<ProductEntity> tProductByCategoryList = tProductModelByCategoryList;

  setUpAll(() {
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = ProductRepositoryImp(
        productLocalDataSource: mockProductLocalDataSource,
        productRemoteDataSource: mockProductRemoteDataSource,
        networkInfo: mockNetworkInfo);

    when(mockProductRemoteDataSource.getAllProducts())
        .thenAnswer((_) async => tAllProductModelList);

    when(mockProductRemoteDataSource.getProductsByCategory(tCategoryModel1.id))
        .thenAnswer((_) async => tProductModelByCategoryList);
  });

  group('getAllProducts', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getAllProducts();
      // assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('when device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return remote a list of all products when the call to remote data source is succesful',
        () async {
      // arrange
      when(mockProductRemoteDataSource.getAllProducts())
          .thenAnswer((_) async => tAllProductModelList);
      // act
      final result = await repository.getAllProducts();
      // assert
      verify(mockProductRemoteDataSource.getAllProducts());
      expect(result, equals(Right(tAllProductList)));
    });

    test(
        'should cache a list of all products locally when the call to remote data source is succesful',
        () async {
      // arrange
      when(mockProductRemoteDataSource.getAllProducts())
          .thenAnswer((_) async => tAllProductModelList);
      // act
      await repository.getAllProducts();
      // assert
      verify(mockProductRemoteDataSource.getAllProducts());
      verify(mockProductLocalDataSource.cacheProductList(tAllProductModelList));
    });

    test(
        'should return remote a list of all products by category when the call to remote data source is succesful',
        () async {
      // arrange
      when(mockProductRemoteDataSource
              .getProductsByCategory(tCategoryModel1.id))
          .thenAnswer((_) async => tProductModelByCategoryList);
      // act
      final result = await repository.getProductsByCategory(tCategoryModel1.id);
      // assert
      verify(mockProductRemoteDataSource
          .getProductsByCategory(tCategoryModel1.id));
      expect(result, equals(Right(tProductModelByCategoryList)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccesful',
        () async {
      // arrange
      when(mockProductRemoteDataSource.getAllProducts())
          .thenThrow(ServerException());
      // act
      final result = await repository.getAllProducts();
      // assert
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('when device if offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
        'should return the last product list cached when the cached data is present',
        () async {
      //arrange
      when(mockProductLocalDataSource.getAllProducts())
          .thenAnswer((_) async => tAllProductModelList);
      // act
      final result = await repository.getAllProducts();
      //aseert
      verify(mockProductLocalDataSource.getAllProducts());
      expect(result, equals(Right(tAllProductList)));
    });

    test(
        'should return the last product list cached filtered by category id when the cached data is present',
        () async {
      //arrange
      when(mockProductLocalDataSource.getProductsByCategory(tCategoryModel1.id))
          .thenAnswer((_) async => tProductModelByCategoryList);
      // act
      final result = await repository.getProductsByCategory(tCategoryModel1.id);
      //aseert
      verify(
          mockProductLocalDataSource.getProductsByCategory(tCategoryModel1.id));
      expect(result, equals(Right(tProductByCategoryList)));
    });

    test('should return CacheFailure when there is no cached data present',
        () async {
      // arrange
      when(mockProductLocalDataSource.getAllProducts())
          .thenThrow(CacheException());
      // act
      final result = await repository.getAllProducts();
      // assert
      verify(mockProductLocalDataSource.getAllProducts());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
