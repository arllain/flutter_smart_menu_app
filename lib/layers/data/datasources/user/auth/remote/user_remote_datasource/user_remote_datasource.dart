import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> saveUser(UserEntity user);
}
