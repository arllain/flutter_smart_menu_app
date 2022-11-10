import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, int>> saveOrder(OrderEntity orderEntity);
}
