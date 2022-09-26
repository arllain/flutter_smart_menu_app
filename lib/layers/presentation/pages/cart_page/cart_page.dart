import 'package:dartz/dartz.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';
import 'package:smart_menu_app/layers/data/models/product/product_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smart_menu_app/layers/presentation/pages/product/product_view_page/product_view_pgage.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';

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
                child: cartItems.isNotEmpty
                    ? AnimatedList(
                        scrollDirection: Axis.vertical,
                        initialItemCount: cartItems.length,
                        itemBuilder: ((context, index, animation) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.3,
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: doNothing,
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'delete'.i18n(),
                                    spacing: 10,
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductViewPage(
                                        product: cartItems[index],
                                      ),
                                    ),
                                  );
                                }),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                          begin: const Offset(-1, 0),
                                          end: Offset.zero)
                                      .animate(animation),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            cartItems[index].imageURL,
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartItems[index].category.name,
                                                style: TextStyle(
                                                  color: Colors.orange.shade400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                cartItems[index].name,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                '\$${cartItems[index].price}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ]),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            minWidth: 10,
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {},
                                            shape: const CircleBorder(),
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.grey.shade400,
                                              size: 30,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              //cartItemCount[index].toString(),
                                              3.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ),
                                          MaterialButton(
                                            padding: const EdgeInsets.all(0),
                                            minWidth: 10,
                                            splashColor: Colors.yellow[700],
                                            onPressed: () {},
                                            shape: const CircleBorder(),
                                            child: const Icon(
                                              Icons.add_circle,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    : const Text('No items'),
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

void doNothing(BuildContext context) {}
