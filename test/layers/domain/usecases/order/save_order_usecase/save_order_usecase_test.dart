import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/repositories/order/order_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/order/save_order_usecase/save_order_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

import 'save_order_usecase_test.mocks.dart';

@GenerateMocks([OrderRepository])
void main() {
  late MockOrderRepository mockOrderRepository;
  late SaveOrderUseCase useCase;

  UserEntity userEntity = const UserEntity(
      uid: '154545454548',
      isVerified: true,
      email: 'email@test.com',
      photoURL: "https://photoURL.com",
      displayName: 'user entity');

  UserModel userModel = const UserModel(
      uid: '154545454548',
      isVerified: true,
      email: 'email@test.com',
      photoURL: "https://photoURL.com",
      displayName: 'user entity');

  OrderEntity orderEntity = OrderEntity(
    id: 1,
    userEntity: userEntity,
    isDelivered: false,
    items: const [],
  );

  OrderModel orderModel = OrderModel(
    id: 1,
    userModel: userModel,
    isDelivered: false,
    items: const [],
  );

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    useCase = SaveOrderUseCase(mockOrderRepository);
  });

  test('should save a order to database', () async {
    // arrange
    when(mockOrderRepository.saveOrder(orderEntity))
        .thenAnswer((_) async => Right(orderModel.id));

    // act
    var result = await useCase(Params(arg: orderEntity));
    late int expectedOrderId;

    result.fold((l) => null, (r) => expectedOrderId = r);

    // assert
    expect(result, Right(expectedOrderId));
    verify(mockOrderRepository.saveOrder(orderEntity));
    verifyNoMoreInteractions(mockOrderRepository);
  });
}
