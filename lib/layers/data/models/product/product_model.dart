import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required int id,
      required String name,
      required String description,
      required double price,
      required CategoryModel category,
      required String imageURL,
      required DateTime dateCreated})
      : super(
            id: id,
            name: name,
            description: description,
            price: price,
            category: category,
            imageURL: imageURL,
            dateCreated: dateCreated);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'] ?? '',
        price: json['price'],
        category: CategoryModel.fromJson(json['category']),
        imageURL: json['imageURL'] ?? '',
        dateCreated: DateTime.tryParse(json['created_at']) as DateTime);
  }

  factory ProductModel.fromSheredPrefencesJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        category: CategoryModel.fromJson(json['category']),
        imageURL: json['imageURL'],
        dateCreated: DateTime.tryParse(json['dateCreated']) as DateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': (category as CategoryModel).toJson(),
      'imageURL': imageURL,
      'dateCreated': dateCreated.toString()
    };
  }
}
