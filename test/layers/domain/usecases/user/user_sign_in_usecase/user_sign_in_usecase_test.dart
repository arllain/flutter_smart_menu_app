import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_in_usecase/user_sign_in_usecase.dart';

import 'user_sign_in_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late UserSignInUseCase useCase;

  UserModel userModel = const UserModel(
      uid: '154545454548',
      isVerified: true,
      email: 'email@test.com',
      photoURL: "https://photoURL.com",
      displayName: 'user entity');

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = UserSignInUseCase(mockAuthRepository);
  });

  test('should get a valid current user', () async {
    // arrange
    when(mockAuthRepository.signIn()).thenAnswer((_) async => Right(userModel));

    // act
    var result = await useCase(NoParams());
    late UserEntity? userExpected;

    result.fold((l) => null, (r) => userExpected = r);

    // assert
    expect(result, Right(userExpected));
    verify(mockAuthRepository.signIn());
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
