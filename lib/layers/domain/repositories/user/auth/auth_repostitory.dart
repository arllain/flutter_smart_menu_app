import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel?>> getCurrentUser();
  Future<Either<Failure, UserModel?>> signIn();
  Future<Either<Failure, bool>> signOut();
}
