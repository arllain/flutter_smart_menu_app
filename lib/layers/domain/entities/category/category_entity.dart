import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime dateCreated;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.dateCreated,
  });

  @override
  List<Object?> get props => [id, name, description, dateCreated];
}
