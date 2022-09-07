part of 'category_bloc.dart';

enum CategoryStatus { initial, success, error, loading, selected }

extension CategoryStatusX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isError => this == CategoryStatus.error;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSelected => this == CategoryStatus.selected;
}

class CategoryState extends Equatable {
  final List<CategoryEntity> categories;
  final CategoryStatus status;
  final int idSelected;
  final String message;

  const CategoryState({
    this.status = CategoryStatus.initial,
    List<CategoryEntity>? categories,
    int idSelected = 1,
    String message = '',
  })  : categories = categories ?? const [],
        idSelected = idSelected,
        message = message;

  @override
  List<Object?> get props => [status, categories, idSelected];

  CategoryState copyWith({
    List<CategoryEntity>? categories,
    CategoryStatus? status,
    int? idSelected,
    String? message,
  }) {
    return CategoryState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        idSelected: idSelected ?? this.idSelected,
        message: message ?? this.message);
  }
}
