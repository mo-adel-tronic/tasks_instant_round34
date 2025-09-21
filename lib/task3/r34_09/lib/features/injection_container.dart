import 'package:get_it/get_it.dart';

// ================= PRODUCTS =================
import 'package:task7/features/products/data/datasources/product_remote_datasource.dart';
import 'package:task7/features/products/data/repositories/product_repository_impl.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';
import 'package:task7/features/products/domain/usecases/create_product.dart';
import 'package:task7/features/products/domain/usecases/delete_product.dart';
import 'package:task7/features/products/domain/usecases/get_all_products.dart';
import 'package:task7/features/products/domain/usecases/get_product.dart';
import 'package:task7/features/products/domain/usecases/update_product.dart';
import 'package:task7/features/products/presentation/services/product_console_service.dart';

// ================= USERS =================
import 'package:task7/features/users/data/datasources/user_remote_datesources.dart';
import 'package:task7/features/users/data/repositories/user_repository_impl.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';
import 'package:task7/features/users/domain/usecases/create_user.dart';
import 'package:task7/features/users/domain/usecases/delete_user.dart';
import 'package:task7/features/users/domain/usecases/get_all_user.dart';
import 'package:task7/features/users/domain/usecases/get_user.dart';
import 'package:task7/features/users/domain/usecases/update_user.dart';
import 'package:task7/features/users/presentation/services/user_console_service.dart';

// ================= POSTS =================
import 'package:task7/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task7/features/posts/data/repositories/post_repository_impl.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';
import 'package:task7/features/posts/domain/usecases/create_post.dart';
import 'package:task7/features/posts/domain/usecases/delete_post.dart';
import 'package:task7/features/posts/domain/usecases/get_all_post.dart';
import 'package:task7/features/posts/domain/usecases/get_post.dart';
import 'package:task7/features/posts/domain/usecases/update_post.dart';
import 'package:task7/features/posts/presentation/services/post_console_service.dart';

final sl = GetIt.instance;

void init() {
  // ====================================================
  // PRODUCTS
  // ====================================================
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  sl.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      createProductUseCase: sl(),
      updateProductUseCase: sl(),
      deleteProductUseCase: sl(),
    ),
  );

  // ====================================================
  // USERS
  // ====================================================
  sl.registerLazySingleton<UserRemoteDatesources>(
    () => UserRemoteDatesourcesImbl(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllUser(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  sl.registerLazySingleton(
    () => UserConsoleService(
      getAllUserUsecase: sl(),
      getUserUsecase: sl(),
      createUserUsecase: sl(),
      updateUserUsecase: sl(),
      deleteUserUsecase: sl(),
    ),
  );

  // ====================================================
  // POSTS  required this.getAllUserUsecase,

  // ====================================================
  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImpl(),
  );

  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetAllPost(sl()));
  sl.registerLazySingleton(() => GetPost(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));

  sl.registerLazySingleton(
    () => PostConsoleService(
      getAllPostUseCase: sl(),
      getPostUseCase: sl(),
      createPostUseCase: sl(),
      updatePostUseCase: sl(),
      deletePostUseCase: sl(),
    ),
  );
}
