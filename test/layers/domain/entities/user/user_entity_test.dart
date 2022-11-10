import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

void main() {
  test('UserEntity expected not to be null', () {
    UserEntity userEntity = const UserEntity(
        uid: '154545454548',
        isVerified: true,
        email: 'email@test.com',
        photoURL: "https://photoURL.com",
        displayName: 'user entity');

    expect(userEntity, isNotNull);
  });
}
