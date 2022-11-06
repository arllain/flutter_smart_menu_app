import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/core/error/failure_message.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';
import 'package:smart_menu_app/layers/domain/usecases/product/get_products_by_category/get_products_by_category_usecase.dart';

part 'products_by_category_event.dart';
part 'products_by_category_state.dart';

class ProductsByCategoryBloc
    extends Bloc<ProductsByCategoryEvent, ProductsByCategoryState> {
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  ProductsByCategoryBloc({
    required this.getProductsByCategoryUseCase,
  }) : super(const ProductsByCategoryState()) {
    on<GetProductsByCategoryEvent>(_mapGetProductsByCategoryEventToState);
  }

  void _mapGetProductsByCategoryEventToState(GetProductsByCategoryEvent event,
      Emitter<ProductsByCategoryState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    final failureOrProductList =
        await getProductsByCategoryUseCase(Params(arg: event.idSelected));

    failureOrProductList?.fold((failure) {
      emit(state.copyWith(
        status: ProductStatus.error,
        message: FailureMessage.mapFailureToMessage(failure),
      ));
    }, (productList) {
      emit(state.copyWith(
        status: ProductStatus.success,
        products: productList,
      ));
    });
  }
}
