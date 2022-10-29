import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/core/inject/injection_container.dart' as di;
import 'package:smart_menu_app/core/inject/injection_container.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/utils/app_styles.dart';
import 'package:smart_menu_app/layers/presentation/widgets/bottom_bar/bottom_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_by_category_widget/bloc/products_by_category_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<CategoryBloc>()..add(GetAllCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsByCategoryBloc>()
            ..add(GetProductsByCategoryEvent(idSelected: 1, categoryName: '')),
        ),
        BlocProvider(
            create: (context) => getIt<CartBloc>()..add(GetCartList())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app-title'.i18n(),
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocalJsonLocalization.delegate,
        ],
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: const BottomBar(),
      ),
    );
  }
}
