import 'package:dartz/dartz.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/widgets/cart_items_widget/cart_items_widget.dart';
import 'package:smart_menu_app/layers/presentation/widgets/message_display/message_display.dart';

class CartPage extends StatelessWidget {
  late List<dynamic> cartItems = [];
  int totalPrice = 0;
  CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'cart'.i18n(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state.status.isLoading) {
          return Center(
            child: SizedBox(
              height: AppLayout.getHeight(150),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.status.isSuccess) {
          cartItems = state.products;
          return SingleChildScrollView(
            child: SizedBox(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: AppLayout.getScreenHeight() * 0.56,
                    child: cartItems.isNotEmpty
                        ? CartItemsWidget(cartItems: cartItems)
                        : Center(
                            child: Image.asset(
                              'assets/images/empty-cart.png',
                            ),
                          ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedBorder(
                        color: Colors.grey.shade400,
                        dashPattern: const [10, 10],
                        padding: const EdgeInsets.all(0),
                        child: Container()),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Total', style: TextStyle(fontSize: 20)),
                        Text('\$${totalPrice + 5.99}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => PaymentPage()));
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return MessageDisplay(message: state.message);
        }
      }),
    );
  }
}
