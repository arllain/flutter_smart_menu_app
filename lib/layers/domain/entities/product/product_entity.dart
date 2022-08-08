import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/domain/entities/enums/status/status.dart';

class ProductEntity {
  int id;
  String name;
  String description;
  double price;
  CategoryEntity category;
  Status status;
  DateTime dateCreated;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.status,
    required this.dateCreated,
  });
}
