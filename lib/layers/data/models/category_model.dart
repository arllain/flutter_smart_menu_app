import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required int id,
    required String name,
    required String description,
    required DateTime dateCreated,
  }) : super(
            id: id,
            name: name,
            description: description,
            dateCreated: dateCreated);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        dateCreated: DateTime.tryParse(json['dateCreated']) as DateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dateCreated': dateCreated.toString()
    };
  }
}
