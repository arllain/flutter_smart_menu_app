import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/user_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/save_user_usecase/save_user_usecase.dart';

import 'save_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late MockUserRepository mockUserRepository;
  late SaveUserUseCase useCase;

  UserEntity userEntity = const UserEntity(
      uid: '154545454548',
      isVerified: true,
      email: 'email@test.com',
      photoURL: "https://photoURL.com",
      displayName: 'user entity');

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = SaveUserUseCase(mockUserRepository);
  });

  test('should save a user to database', () async {
    // arrange
    when(mockUserRepository.saveUser(userEntity))
        .thenAnswer((_) async => const Right(true));

    // act
    var result = await useCase(Params(arg: userEntity));
    late bool isSuccesful;

    result.fold((l) => null, (r) => isSuccesful = r);

    // assert
    expect(result, Right(isSuccesful));
    verify(mockUserRepository.saveUser(userEntity));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
