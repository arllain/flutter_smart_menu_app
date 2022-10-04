import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    List<ProductEntity> products = List<ProductEntity>.from(state.products);

    on<GetCartList>((event, emit) {
      emit(state.copyWith(status: CartStatus.loading));
      emit(state.copyWith(status: CartStatus.success));
    });

    on<UpdateCartEvent>((event, emit) {
      if (event.isAdd) {
        products.add(event.product);
        emit(state.copyWith(status: CartStatus.success, products: products));
      } else {
        products.remove(event.product);
        emit(state.copyWith(status: CartStatus.success, products: products));
      }
    });
  }
}
