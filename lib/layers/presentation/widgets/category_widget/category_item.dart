import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/domain/entities/category/category_entity.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';

typedef CategoryCLicked = Function(CategoryEntity categorySelected);

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
    required this.callback,
  }) : super(key: key);

  final CategoryEntity category;
  final CategoryCLicked callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(category),
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) =>
            (state.status.isSelected && state.idSelected == category.id)
                ? true
                : false,
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: AppLayout.getHeight(44),
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                decoration: BoxDecoration(
                  color: state ? Styles.yellowColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    category.name.i18n(),
                    style: state
                        ? Styles.tabButtonS
                        : Styles.tabButtonU.copyWith(
                            shadows: [
                              Shadow(
                                  color: Styles.black.withOpacity(0.2),
                                  offset: const Offset(5, 5),
                                  blurRadius: 15)
                            ],
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
