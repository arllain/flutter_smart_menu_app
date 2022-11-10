import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smart_menu_app/core/network/network_info.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/category/local/category_local_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/order/remote/order_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/order/remote/order_remote_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/local/product_local_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/product/remote/product_remote_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/firabese/firebase_datasource._impl.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/firabese/firebase_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/user_remote_datasource/user_remote_datasource.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/user_remote_datasource/user_remote_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/category/category_repository_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/order/order_repository_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/product/product_repository_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/user/auth/auth_repository_impl.dart';
import 'package:smart_menu_app/layers/data/repostirories/user/user_repository_impl.dart';
import 'package:smart_menu_app/layers/domain/repositories/category/category_repository.dart';
import 'package:smart_menu_app/layers/domain/repositories/order/order_repository.dart';
import 'package:smart_menu_app/layers/domain/repositories/product/product_repository.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/auth/auth_repostitory.dart';
import 'package:smart_menu_app/layers/domain/repositories/user/user_repository.dart';
import 'package:smart_menu_app/layers/domain/usecases/category/get_all_categories/get_all_categories_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/order/save_order_usecase/save_order_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/product/get_products_by_category/get_products_by_category_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/get_current_user_usecase/get_current_user_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/save_user_usecase/save_user_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_in_usecase/user_sign_in_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_out_usecase/user_sign_out_usecase.dart';
import 'package:smart_menu_app/layers/presentation/auth/bloc/auth_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:smart_menu_app/layers/presentation/pages/order/bloc/order_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/category_widget/bloc/category_bloc.dart';
import 'package:smart_menu_app/layers/presentation/widgets/product/product_by_category_widget/bloc/products_by_category_bloc.dart';

// service locator
final getIt = GetIt.instance;

Future<void> init() async {
  //! User
  // Use cases
  getIt.registerLazySingleton(() => SaveUserUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: getIt()));

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

  //! Auth
  //Bloc
  getIt.registerLazySingleton(() => AuthBloc(
        getCurrentUserUseCase: getIt(),
        userSignInUseCase: getIt(),
        userSignOutUseCase: getIt(),
      ));

  // Use cases
  getIt.registerLazySingleton(() => GetCurrentUserUseCase(getIt()));
  getIt.registerLazySingleton(() => UserSignInUseCase(getIt()));
  getIt.registerLazySingleton(() => UserSignOutUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        firebaseDataSource: getIt(),
        networkInfo: getIt(),
        userRepository: getIt(),
      ));

  // Data Sources
  getIt.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSourceImpl(firebaseAuth: getIt()));

  //! Order
  //Bloc
  getIt.registerLazySingleton(() => OrderBloc(saveOrderUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => SaveOrderUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(
        orderRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  // Data Sources
  getIt.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(client: getIt()));

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
}
