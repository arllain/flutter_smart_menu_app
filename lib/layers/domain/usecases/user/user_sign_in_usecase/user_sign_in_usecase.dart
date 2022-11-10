import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/usecases/usecase.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';

class UserSignInUseCase extends UseCase<UserEntity?, NoParams> {
  final AuthRepository repository;

  UserSignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.signIn();
  }
}
