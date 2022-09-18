import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/categories_widget.dart';
import 'package:smart_menu_app/layers/presentation/widgets/header_title/header_title.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_by_category_widget/product_by_category_widget.dart';
import 'package:smart_menu_app/layers/presentation/widgets/search_input_widget/search_input_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Gap(AppLayout.getHeight(20)),
              Row(children: const [HeaderTitle()]),
              Gap(AppLayout.getHeight(12)),
              Row(
                children: const [SearchInputWidget()],
              ),
              Gap(AppLayout.getHeight(25)),
              const CategoriesWidget(),
              Gap(AppLayout.getHeight(15)),
              const ProductsByCategoryWidget(),
              // Row(
              //   children: [
              //     Text('Most Popular',
              //         style: Styles.headLineStyle3.copyWith(
              //           fontWeight: FontWeight.w600,
              //           color: Styles.darkGreyColor,
              //           shadows: [
              //             Shadow(
              //                 color: Styles.black.withOpacity(0.2),
              //                 offset: const Offset(5, 5),
              //                 blurRadius: 25)
              //           ],
              //         )),
              //   ],
              // ),
              // Gap(AppLayout.getHeight(5)),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: const EdgeInsets.only(left: 7, bottom: 15),
              //   child: Row(
              //     children: productList
              //         .map((singleProduct) =>
              //             ProductBoxCard(product: singleProduct))
              //         .toList(),
              //   ),
              // ),
              // Gap(AppLayout.getHeight(10)),
              // Row(
              //   children: [
              //     Text('Drink',
              //         style: Styles.headLineStyle3.copyWith(
              //           fontWeight: FontWeight.w600,
              //           color: Styles.darkGreyColor,
              //           shadows: [
              //             Shadow(
              //                 color: Styles.black.withOpacity(0.2),
              //                 offset: const Offset(5, 5),
              //                 blurRadius: 25)
              //           ],
              //         )),
              //   ],
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: const EdgeInsets.only(left: 20, bottom: 15),
              //   child: Row(
              //     children: productMostPopularList
              //         .map((singleProduct) =>
              //             ProductBoxCard(product: singleProduct))
              //         .toList(),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
