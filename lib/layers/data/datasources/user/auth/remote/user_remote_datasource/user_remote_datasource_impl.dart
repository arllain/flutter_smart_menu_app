import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/user_remote_datasource/user_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> saveUser(UserEntity user) =>
      _saveUser("${dotenv.get('BASE_URL')}User", user);

  Future<UserModel> _saveUser(String url, UserEntity userEntity) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'apiKey': dotenv.get('API_KEY'),
        'Authorization': dotenv.get('API_KEY'),
        'Prefer': 'return=representation'
      },
      body: toJson(userEntity),
    );

    if (response.statusCode == 201) {
      final UserModel userModel =
          UserModel.fromJson(json.decode(response.body));
      return userModel;
    } else {
      throw ServerException();
    }
  }

  toJson(UserEntity userEntity) {
    var json = {
      "uid": userEntity.uid,
      "isVerified": userEntity.isVerified,
      "email": userEntity.email,
      "photoURL": userEntity.photoURL,
      "displayName": userEntity.displayName
    };

    print(jsonEncode(json));
    return jsonEncode(json);
  }
}
