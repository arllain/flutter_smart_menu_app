import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/core/enums/status/status.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';
import 'package:smart_menu_app/layers/domain/usecases/product/get_all_products_usecase/get_all_products_usecase.dart';
import '../get_products_by_category/get_products_by_category_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late GetAllProductsUseCase useCase;
  CategoryEntity categoryEntity = CategoryEntity(
      id: 1,
      name: 'category 1',
      description: "description",
      dateCreated: DateTime.now());

  CategoryEntity categoryEntity2 = CategoryEntity(
      id: 1,
      name: 'category 2',
      description: "description",
      dateCreated: DateTime.now());

  ProductEntity productEntity1 = ProductEntity(
      id: 1,
      name: 'product 1',
      description: 'description 1',
      price: 1.00,
      category: categoryEntity,
      imageURL:
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
      dateCreated: DateTime.now());

  ProductEntity productEntity2 = ProductEntity(
      id: 2,
      name: 'product 2',
      description: 'description 2',
      price: 2.00,
      category: categoryEntity,
      imageURL:
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
      dateCreated: DateTime.now());

  ProductEntity productEntity3 = ProductEntity(
      id: 3,
      name: 'product 3',
      description: 'description 3',
      price: 3.00,
      category: categoryEntity2,
      imageURL:
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
      dateCreated: DateTime.now());

  List<ProductEntity> productList = [];
  productList.addAll([productEntity1, productEntity2, productEntity3]);

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = GetAllProductsUseCase(mockProductRepository);
  });

  test('should get a list of products from repository', () async {
    // arrange
    when(mockProductRepository.getAllProducts())
        .thenAnswer((_) async => Right(productList));

    // act
    var result = await useCase(NoParams());

    //assert
    expect(result, Right(productList));
    verify(mockProductRepository.getAllProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
