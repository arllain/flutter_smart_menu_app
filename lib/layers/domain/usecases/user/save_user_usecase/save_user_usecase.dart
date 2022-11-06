import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/user_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

class SaveUserUseCase implements UseCase<UserEntity, Params> {
  final UserRepository repository;

  SaveUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.saveUser(params.arg);
  }
}
