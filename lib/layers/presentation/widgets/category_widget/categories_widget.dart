import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/category_item.dart';
import 'package:smart_menu_app/layers/presentation/widgets/message_display/message_display.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state.status.isError) {
          return MessageDisplay(message: state.message);
        }

        return SizedBox(
          height: AppLayout.getHeight(4) * 15,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                key: ValueKey('${state.categories[index].name}$index'),
                category: state.categories[index],
                callback: (CategoryEntity categorySelected) {
                  context.read<CategoryBloc>().add(
                        SelectCategoryEvent(
                          idSelected: categorySelected.id,
                        ),
                      );
                },
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              width: 1.0,
            ),
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }
}
