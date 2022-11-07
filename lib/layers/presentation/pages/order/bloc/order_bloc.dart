import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/core/error/failure_message.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/domain/usecases/order/save_order_usecase/save_order_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/params.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<SaveOrderEvent, OrderState> {
  final SaveOrderUseCase saveOrderUseCase;
  OrderBloc({
    required this.saveOrderUseCase,
  }) : super(const OrderState()) {
    on<SaveOrderEvent>(_mapSaveOrderEventToState);
  }

  void _mapSaveOrderEventToState(
      SaveOrderEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final failureOrOrder =
        await saveOrderUseCase(Params(arg: event.orderModel));

    failureOrOrder.fold(
        (failure) => emit(
              state.copyWith(
                orderModel: null,
                status: OrderStatus.error,
                message: FailureMessage.mapFailureToMessage(failure),
              ),
            ),
        (order) => emit(state.copyWith(
              orderModel: order as OrderModel,
              status: OrderStatus.success,
            )));
  }
}
