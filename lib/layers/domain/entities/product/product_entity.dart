import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/core/enums/status/status.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final CategoryEntity category;
  final String imageURL;
  final DateTime dateCreated;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageURL,
    required this.dateCreated,
  });

  @override
  List<Object?> get props =>
      [id, name, description, price, category, dateCreated];
}
