import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';
import 'package:smart_menu_app/layers/presentation/pages/product/product_view_page/product_view_pgage.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCardWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: product)));
      },
      child: Container(
        width: size.width * 0.6,
        height: AppLayout.getHeight(305),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        margin: const EdgeInsets.only(right: 17, top: 5),
        decoration: BoxDecoration(
          color: Styles.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            ),
            const BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageURL,
              imageBuilder: (context, imageProvider) => Container(
                height: AppLayout.getHeight(150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Styles.primaryColor,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const Gap(5),
            Center(
              child: Text(
                product.name,
                style: Styles.productNameStyle,
              ),
            ),
            const Gap(5),
            Center(
              child: Text(
                '\$${product.price}',
                style: Styles.productPriceStyle,
              ),
            ),
            const Gap(8),
            Center(
              child: MaterialButton(
                color: Styles.yellowColor,
                minWidth: 45,
                height: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  print('${product.id} - ${product.name}');
                },
                padding: const EdgeInsets.all(5),
                child: Center(
                    child: Icon(
                  Icons.shopping_cart,
                  color: Styles.black,
                  size: 25,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
