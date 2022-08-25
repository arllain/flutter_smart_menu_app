import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource.dart';
import 'package:smart_menu_app/layers/data/models/category_model.dart';
import 'package:smart_menu_app/layers/data/repostirories/category_repository_impl.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateMocks([
  CategoryLocalDataSource,
  NetworkInfo,
])
void main() {
  late CategoryRepositoryImpl repository;
  late MockCategoryLocalDataSource mockCategoryLocalDataSource;
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

  List<CategoryModel> tCategoryModelList = [tCategoryModel1, tCategoryModel2];

  List<CategoryEntity> tCategoryList = tCategoryModelList;

  setUpAll(() {
    mockCategoryLocalDataSource = MockCategoryLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CategoryRepositoryImpl(
      categoryLocalDataSource: mockCategoryLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    when(mockCategoryLocalDataSource.getAllCategories())
        .thenAnswer((_) async => tCategoryModelList);
  });

  group('getAllCategories', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getAllCategories();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );
  });

  group('when device if offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
        'should return the last category list cached when the cached data is present',
        () async {
      //arrange
      when(mockCategoryLocalDataSource.getAllCategories())
          .thenAnswer((_) async => tCategoryModelList);
      // act
      final result = await repository.getAllCategories();
      //aseert
      verify(mockCategoryLocalDataSource.getAllCategories());
      expect(result, equals(Right(tCategoryList)));
    });

    test('should return CacheFailure when there is no cached data present',
        () async {
      // arrange
      when(mockCategoryLocalDataSource.getAllCategories())
          .thenThrow(CacheException());
      // act
      final result = await repository.getAllCategories();
      // assert
      verify(mockCategoryLocalDataSource.getAllCategories());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
