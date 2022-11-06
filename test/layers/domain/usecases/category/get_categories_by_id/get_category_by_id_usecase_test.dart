import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/category/get_category_by_id/get_category_by_id_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

import 'get_category_by_id_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late MockCategoryRepository mockCategoryRepository;
  late GetCategoryByIdUseCase useCase;

  CategoryEntity categoryEntity = CategoryEntity(
      id: 1,
      name: 'category 1',
      description: "description",
      dateCreated: DateTime.now());

  const id = 1;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    useCase = GetCategoryByIdUseCase(mockCategoryRepository);
  });

  test('should get a category by id from repository', () async {
    // arrange
    when(mockCategoryRepository.getCategoryById(id))
        .thenAnswer((_) async => Right(categoryEntity));

    // act
    var result = await useCase(const Params(arg: id));

    // assert
    expect(result, Right(categoryEntity));
    verify(mockCategoryRepository.getCategoryById(id));
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
