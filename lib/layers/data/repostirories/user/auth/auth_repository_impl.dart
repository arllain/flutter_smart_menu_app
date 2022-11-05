import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/firabese/firebase_datasource.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDataSource firebaseDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.firebaseDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        User? user = await firebaseDataSource.getCurrentUser().first;
        if (user != null) {
          UserModel userModel = UserModel(
              uid: user.uid,
              email: user.email,
              photoURL: user.photoURL,
              isVerified: user.emailVerified,
              displayName: user.displayName);
          return Right(userModel);
        }
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel?>> signIn() async {
    if (await networkInfo.isConnected) {
      try {
        UserCredential? userCredential =
            await firebaseDataSource.signInWithGoogle();
        if (userCredential != null) {
          UserModel userModel = UserModel(
              uid: userCredential.user?.uid,
              email: userCredential.user?.email,
              photoURL: userCredential.user?.photoURL,
              isVerified: userCredential.user?.emailVerified,
              displayName: userCredential.user?.displayName);
          return Right(userModel);
        }
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        await firebaseDataSource.signOut();
        return const Right(true);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
