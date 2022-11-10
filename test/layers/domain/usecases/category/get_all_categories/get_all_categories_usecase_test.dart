import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/category/get_all_categories/get_all_categories_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';

import 'get_all_categories_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late MockCategoryRepository mockCategoryRepository;
  late GetAllCategoriesUseCase useCase;

  CategoryEntity categoryEntity1 = CategoryEntity(
      id: 1,
      name: 'category 1',
      description: "description",
      dateCreated: DateTime.now());

  CategoryEntity categoryEntity2 = CategoryEntity(
      id: 2,
      name: 'category 2',
      description: "description",
      dateCreated: DateTime.now());

  List<CategoryEntity> categoriesList = [];
  categoriesList.add(categoryEntity1);
  categoriesList.add(categoryEntity2);

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    useCase = GetAllCategoriesUseCase(mockCategoryRepository);
  });

  test('should get all categories from repository', () async {
    // arrange
    when(mockCategoryRepository.getAllCategories())
        .thenAnswer((_) async => Right(categoriesList));

    // act
    var result = await useCase(NoParams());
    late List<CategoryEntity> listExpected;

    result!.fold((l) => null, (r) => listExpected = r);

    // assert
    expect(result, Right(categoriesList));
    expect(listExpected.length, 2);
    verify(mockCategoryRepository.getAllCategories());
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
