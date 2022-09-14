import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';

class GetAllCategoriesUseCase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>?> call(NoParams params) async {
    return await repository.getAllCategories();
  }
}
