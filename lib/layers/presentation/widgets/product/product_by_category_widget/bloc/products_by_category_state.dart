part of 'products_by_category_bloc.dart';

enum ProductStatus { initial, success, error, loading }

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;
  bool get isSuccess => this == ProductStatus.success;
  bool get isError => this == ProductStatus.error;
  bool get isLoading => this == ProductStatus.loading;
}

class ProductsByCategoryState extends Equatable {
  final List<ProductEntity> products;
  final ProductStatus status;
  final String categoryName;
  final String message;

  const ProductsByCategoryState({
    List<ProductEntity>? products,
    this.status = ProductStatus.initial,
    this.categoryName = '',
    this.message = '',
  }) : products = products ?? const [];

  @override
  List<Object> get props => [products, status, categoryName];

  ProductsByCategoryState copyWith({
    List<ProductEntity>? products,
    ProductStatus? status,
    String? categoryName,
    String? message,
  }) {
    return ProductsByCategoryState(
        products: products ?? this.products,
        status: status ?? this.status,
        categoryName: categoryName ?? this.categoryName,
        message: message ?? this.message);
  }
}
