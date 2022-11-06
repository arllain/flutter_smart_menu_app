import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> saveOrder(OrderEntity order);
}
