import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/product/product_view_page/product_view_pgage.dart';

class CartItemsWidget extends StatelessWidget {
  final Map<ProductEntity, int> cart;

  const CartItemsWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      scrollDirection: Axis.vertical,
      initialItemCount: cart.length,
      itemBuilder: ((context, index, animation) {
        if (cart.keys.toList().length - 1 >= index) {
          ProductEntity product = cart.keys.elementAt(index);
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
                    onPressed: (context) {
                      context
                          .read<CartBloc>()
                          .add(DeleteProductsEvent(product: product));
                    },
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
                        product: product,
                      ),
                    ),
                  );
                }),
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(animation),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageURL,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category.name,
                                style: TextStyle(
                                  color: Colors.orange.shade400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            minWidth: 10,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              context.read<CartBloc>().add(UpdateCartEvent(
                                  product: product, isAdd: false));
                            },
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
                              //3.toString(),
                              cart.values.elementAt(index).toString(),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade800),
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(0),
                            minWidth: 10,
                            splashColor: Colors.yellow[700],
                            onPressed: () {
                              context.read<CartBloc>().add(UpdateCartEvent(
                                  product: product, isAdd: true));
                            },
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
        } else {
          return Container();
        }
      }),
    );
  }
}

void doNothing(BuildContext context) {}
