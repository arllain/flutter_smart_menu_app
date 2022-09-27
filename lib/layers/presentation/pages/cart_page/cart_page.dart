import 'package:dartz/dartz.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/widgets/cart_items_widget/cart_items_widget.dart';

class CartPage extends StatelessWidget {
  late List<dynamic> cartItems = [];
  int totalPrice = 0;
  CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var dateCreated =
        DateTime.tryParse('2022-08-27T21:40:19+00:00') as DateTime;

    var tCategoryModel = CategoryModel(
        id: 1,
        name: 'category name',
        description: 'category description',
        dateCreated: dateCreated);

    var tProductModel = ProductModel(
        id: 1,
        name: 'Product 1',
        description: 'description',
        price: 10.00,
        category: tCategoryModel,
        imageURL:
            'https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
        dateCreated: dateCreated);

    var tProductMode2 = ProductModel(
        id: 2,
        name: 'Product 2',
        description: 'description',
        price: 10.00,
        category: tCategoryModel,
        imageURL:
            'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=472&q=80',
        dateCreated: dateCreated);

    cartItems.addAll([
      tProductModel,
      tProductMode2,
      tProductModel,
      tProductMode2,
      tProductModel,
      tProductMode2
    ]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'cart'.i18n(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: AppLayout.getScreenHeight() * 0.56,
                child: !cartItems.isNotEmpty
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
      ),
    );
  }
}
