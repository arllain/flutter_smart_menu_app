import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

class GetCategoryByIdUseCase implements UseCase<CategoryEntity, Params> {
  final CategoryRepository repository;

  GetCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(Params params) async {
    return await repository.getCategoryById(params.id);
  }
}
