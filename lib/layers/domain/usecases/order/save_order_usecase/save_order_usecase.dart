import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/repositories/order/order_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

class SaveOrderUseCase implements UseCase<int, Params> {
  final OrderRepository reposistoy;

  SaveOrderUseCase(this.reposistoy);

  @override
  Future<Either<Failure, int>> call(Params params) async {
    return await reposistoy.saveOrder(params.arg);
  }
}
