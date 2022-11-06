import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> saveUser(UserEntity userEntity);
}
