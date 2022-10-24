import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<GetCartList>((event, emit) {
      emit(state.copyWith(status: CartStatus.loading));
      emit(state.copyWith(status: CartStatus.success));
    });

    on<UpdateCartEvent>((event, emit) {
      Map<ProductEntity, int> cart =
          Map<ProductEntity, int>.from((state.cartList));

      if (event.isAdd) {
        if (cart[event.product] == null) {
          cart.addAll({event.product: 0});
        }
        cart[event.product] = cart[event.product]! + 1;
      } else {
        if (cart[event.product]! - 1 == 0) {
          cart.remove(event.product);
        } else {
          cart[event.product] = cart[event.product]! - 1;
        }
      }
      emit(state.copyWith(status: CartStatus.loading));
      emit(state.copyWith(status: CartStatus.success, cartList: cart));
    });

    on<DeleteProductsEvent>((event, emit) {
      Map<ProductEntity, int> cart =
          Map<ProductEntity, int>.from((state.cartList));
      cart.remove(event.product);

      emit(state.copyWith(status: CartStatus.loading));
      emit(state.copyWith(status: CartStatus.success, cartList: cart));
    });
  }
}
