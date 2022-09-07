import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_menu_app/core/inject/injection_container.dart';
import 'package:smart_menu_app/layers/presentation/pages/home/home_layout.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Styles.bgColor,
  //     body: ListView(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Column(
  //             children: [
  //               Gap(AppLayout.getHeight(20)),
  //               Row(
  //                 children: [
  //                   Text(
  //                     'choose-the-best-for-you'.i18n(),
  //                     style: Styles.headLineStyle2.copyWith(
  //                       shadows: [
  //                         Shadow(
  //                             color: Styles.black.withOpacity(0.3),
  //                             offset: const Offset(5, 5),
  //                             blurRadius: 15)
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Gap(AppLayout.getHeight(12)),
  //               Row(
  //                 children: [
  //                   Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 5),
  //                         child: Container(
  //                           height: (AppLayout.getHeight(40)),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(50),
  //                             border: Border.all(
  //                               color: Colors.grey.withOpacity(0.5),
  //                             ),
  //                           ),
  //                           child: Row(
  //                             children: [
  //                               SizedBox(
  //                                 width: AppLayout.getWidth(258),
  //                                 child: TextField(
  //                                   style: TextStyle(color: Styles.white),
  //                                   decoration: InputDecoration(
  //                                       hintStyle:
  //                                           TextStyle(color: Styles.lightGrey),
  //                                       prefixIcon: Icon(Icons.search,
  //                                           color: Styles.lightGrey),
  //                                       hintText: 'search'.i18n(),
  //                                       border: InputBorder.none),
  //                                 ),
  //                               ),
  //                               CircleAvatar(
  //                                 backgroundColor: Colors.transparent,
  //                                 child: Image.asset(
  //                                   'assets/icons/adjust.png',
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Gap(AppLayout.getHeight(25)),
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: CategoriesWidget(categories: categoryList),
  //               ),
  //               Gap(AppLayout.getHeight(15)),
  //               Row(
  //                 children: [
  //                   Text('Most Popular',
  //                       style: Styles.headLineStyle3.copyWith(
  //                         fontWeight: FontWeight.w600,
  //                         color: Styles.darkGreyColor,
  //                         shadows: [
  //                           Shadow(
  //                               color: Styles.black.withOpacity(0.2),
  //                               offset: const Offset(5, 5),
  //                               blurRadius: 25)
  //                         ],
  //                       )),
  //                 ],
  //               ),
  //               Gap(AppLayout.getHeight(5)),
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 padding: const EdgeInsets.only(left: 7, bottom: 15),
  //                 child: Row(
  //                   children: productList
  //                       .map((singleProduct) =>
  //                           ProductBoxCard(product: singleProduct))
  //                       .toList(),
  //                 ),
  //               ),
  //               Gap(AppLayout.getHeight(10)),
  //               Row(
  //                 children: [
  //                   Text('Drink',
  //                       style: Styles.headLineStyle3.copyWith(
  //                         fontWeight: FontWeight.w600,
  //                         color: Styles.darkGreyColor,
  //                         shadows: [
  //                           Shadow(
  //                               color: Styles.black.withOpacity(0.2),
  //                               offset: const Offset(5, 5),
  //                               blurRadius: 25)
  //                         ],
  //                       )),
  //                 ],
  //               ),
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 padding: const EdgeInsets.only(left: 20, bottom: 15),
  //                 child: Row(
  //                   children: productMostPopularList
  //                       .map((singleProduct) =>
  //                           ProductBoxCard(product: singleProduct))
  //                       .toList(),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  getIt<CategoryBloc>()..add(GetAllCategoriesEvent()))
        ],
        child: const HomeLayout(),
      ),
    );
  }
}
