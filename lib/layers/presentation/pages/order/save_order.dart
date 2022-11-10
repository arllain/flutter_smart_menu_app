import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/data/models/order/order_model.dart';
import 'package:smart_menu_app/layers/data/models/order_item/order_item_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/data/models/user/user_model.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/order/bloc/order_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/payment_success_page/payment_success_page.dart';
import 'package:smart_menu_app/layers/presentation/widgets/message_display/message_display.dart';

class SaveOrder extends StatelessWidget {
  const SaveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = BlocProvider.of<AuthBloc>(context).state.user as UserModel;
    var cartList = BlocProvider.of<CartBloc>(context).state.cartList;

    OrderModel orderModel =
        OrderModel(id: 0, userModel: user, isDelivered: false, items: const []);
    List<OrderItemModel> items = [];
    cartList.forEach((key, value) {
      OrderItemModel orderItemModel = OrderItemModel(
          id: 0,
          orderModel: orderModel,
          productModel: key as ProductModel,
          quantity: value);
      items.add(orderItemModel);
    });

    orderModel = OrderModel(
        id: orderModel.id, userModel: user, isDelivered: false, items: items);

    context.read<OrderBloc>().add(SaveOrderEvent(orderModel: orderModel));

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'processing'.i18n(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFFFB01D)),
                    backgroundColor: Color(0xFF615793),
                    strokeWidth: 10,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                ],
              );
            } else if (state.status.isSuccess) {
              // BlocProvider.of<CartBloc>(context).state.copyWith(cartList: null);
              context.read<CartBloc>().add(ClearCartEvent());

              return const PaymentSuccessPage();
            } else {
              return MessageDisplay(message: state.message);
            }
          },
        ),
      ),
    );
  }
}
