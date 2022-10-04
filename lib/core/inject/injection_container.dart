import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/category/category_repository_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/product/product_repository_impl.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/category/get_all_categories/get_all_categories_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/product/get_products_by_category/get_products_by_category_usecase.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_by_category_widget/bloc/products_by_category_bloc.dart';

// service locator
final getIt = GetIt.instance;

Future<void> init() async {
  //! Category
  // Bloc
  getIt.registerFactory(() => CategoryBloc(getAllCategoriesUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetAllCategoriesUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      categoryLocalDataSource: getIt(),
      categoryRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(client: getIt()));

  //! Product
  // Bloc
  getIt.registerFactory(
      () => ProductsByCategoryBloc(getProductsByCategoryUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetProductsByCategoryUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
        productLocalDataSource: getIt(),
        productRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  // Data sources
  getIt.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp(client: getIt()));

  //! Cart
  // Bloc
  getIt.registerLazySingleton(() => CartBloc());
  getIt.registerLazySingleton(() => GetCartList());

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
