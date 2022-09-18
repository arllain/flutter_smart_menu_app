import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/widgets/message_display/message_display.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_by_category_widget/bloc/products_by_category_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_card_widget/product_card_widget.dart';

class ProductsByCategoryWidget extends StatelessWidget {
  const ProductsByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
        builder: (context, state) {
      return state.status.isSuccess
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 7, bottom: 15),
              child: Row(
                children: state.products
                    .map((singleProduct) =>
                        ProductCardWidget(product: singleProduct))
                    .toList(),
              ),
            )
          : state.status.isLoading
              ? SizedBox(
                  height: AppLayout.getHeight(150),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : state.status.isError
                  ? MessageDisplay(message: state.message)
                  : const SizedBox();
    });
  }
}
