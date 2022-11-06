import 'package:dartz/dartz.dart';
import 'package:smart_menu_app/core/error/failure.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderModel>> saveOrder(OrderEntity orderEntity);
}
