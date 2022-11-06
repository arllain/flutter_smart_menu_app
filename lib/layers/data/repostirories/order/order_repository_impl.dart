import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/order/remote/order_remote_datasource.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/layers/domain/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    required this.orderRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrderModel>> saveOrder(OrderEntity orderEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final orderModel = await orderRemoteDataSource.saveOrder(orderEntity);
        return Right(orderModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
