import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  var tUserModel = const UserModel(
      uid: '123456',
      email: 'email@test.com',
      photoURL: 'https://photoURL.com',
      isVerified: true,
      displayName: 'displayName');

  test('Should be a subclass of User entity', () async {
    expect(tUserModel, isA<UserEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid user model from JSON',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('/user/user.json'));

        final result = UserModel.fromJson(jsonMap);
        expect(result, tUserModel);
      },
    );
  });
}
