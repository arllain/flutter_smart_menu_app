import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/core/enums/status/status.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';
import 'package:smart_menu_app/layers/domain/usecases/product/get_products_by_category/get_products_by_category_usecase.dart';

import 'get_products_by_category_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late GetProductsByCategoryUseCase useCase;
  CategoryEntity categoryEntity = CategoryEntity(
      id: 1,
      name: 'category 1',
      description: "description",
      dateCreated: DateTime.now());

  ProductEntity productEntity1 = ProductEntity(
      id: 1,
      name: 'product 1',
      description: 'description 1',
      price: 1.00,
      category: categoryEntity,
      status: Status.active,
      dateCreated: DateTime.now());

  ProductEntity productEntity2 = ProductEntity(
      id: 2,
      name: 'product 2',
      description: 'description 2',
      price: 2.00,
      category: categoryEntity,
      status: Status.active,
      dateCreated: DateTime.now());

  ProductEntity productEntity3 = ProductEntity(
      id: 3,
      name: 'product 3',
      description: 'description 3',
      price: 3.00,
      category: categoryEntity,
      status: Status.active,
      dateCreated: DateTime.now());

  List<ProductEntity> productList = [];
  productList.addAll([productEntity1, productEntity2, productEntity3]);

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = GetProductsByCategoryUseCase(mockProductRepository);
  });

  test('should get a list of products by category from repository', () async {
    // arrange
    when(mockProductRepository.getProductsByCategory(categoryEntity.id))
        .thenAnswer((_) async => Right(productList));

    // act
    var result = await useCase(Params(id: categoryEntity.id));

    //assert
    expect(result, Right(productList));
    verify(mockProductRepository.getProductsByCategory(categoryEntity.id));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
