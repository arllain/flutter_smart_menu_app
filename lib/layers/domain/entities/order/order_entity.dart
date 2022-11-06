import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

class OrderEntity extends Equatable {
  final int id;
  final UserEntity userEntity;
  final DateTime dateCreated;

  const OrderEntity({
    required this.id,
    required this.userEntity,
    required this.dateCreated,
  });

  @override
  List<Object?> get props => [id, userEntity, dateCreated];
}
