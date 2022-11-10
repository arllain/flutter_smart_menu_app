import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

class GetProductsByCategoryUseCase
    implements UseCase<List<ProductEntity>, Params> {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>?> call(Params params) async {
    return await repository.getProductsByCategory(params.arg);
  }
}
