import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/user_remote_datasource/user_remote_datasource.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> saveUser(UserEntity userEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final isSuccesful = await userRemoteDataSource.saveUser(userEntity);
        return Right(isSuccesful);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
