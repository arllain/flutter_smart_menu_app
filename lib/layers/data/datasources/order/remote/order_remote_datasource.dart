import 'package:smart_menu_app/layers/domain/entities/order/order_entity.dart';

abstract class OrderRemoteDataSource {
  Future<int> saveOrder(OrderEntity order);
}
