import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_out_usecase/user_sign_out_usecase.dart';

import 'user_sign_out_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late UserSignOutUseCase useCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = UserSignOutUseCase(mockAuthRepository);
  });

  test('should perform a user sign out', () async {
    // arrange
    when(mockAuthRepository.signOut())
        .thenAnswer((_) async => const Right(true));

    // act
    var result = await useCase(NoParams());
    late bool userSignOut;

    result.fold((l) => null, (r) => userSignOut = r);

    // assert
    expect(result, Right(userSignOut));
    verify(mockAuthRepository.signOut());
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
