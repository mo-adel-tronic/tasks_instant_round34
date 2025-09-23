import 'package:get_it/get_it.dart';
//products
import 'package:r34_12/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_12/features/products/data/repositories/product_repositry_impl.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:r34_12/features/products/domain/usecases/create_product.dart';
import 'package:r34_12/features/products/domain/usecases/delete_product.dart';
import 'package:r34_12/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_12/features/products/domain/usecases/get_product.dart';
import 'package:r34_12/features/products/domain/usecases/update_product.dart';
import 'package:r34_12/features/products/presentation/services/product_console_service.dart';
//users
import 'package:r34_12/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_12/features/users/data/repositories/user_repositry_impl.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:r34_12/features/users/domain/usecases/create_user.dart';
import 'package:r34_12/features/users/domain/usecases/delete_user.dart';
import 'package:r34_12/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_12/features/users/domain/usecases/get_user.dart';
import 'package:r34_12/features/users/domain/usecases/update_user.dart';
import 'package:r34_12/features/users/presentation/services/user_console_service.dart';

//posts
import 'package:r34_12/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_12/features/posts/data/repositories/post_repository_impl.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_12/features/posts/domain/usecases/create_post.dart';
import 'package:r34_12/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_12/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_12/features/posts/domain/usecases/get_post.dart';
import 'package:r34_12/features/posts/domain/usecases/update_post.dart';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';

final sl = GetIt.instance;

void init() {
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
   sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases - Products
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // Use cases - Users
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));

  // Use cases - Posts
  sl.registerLazySingleton(() => GetAllPosts(sl()));
  sl.registerLazySingleton(() => GetPost(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));

  // Services - products
  sl.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      createProductUseCase: sl(),
      updateProductUseCase: sl(),
      deleteProductUseCase: sl(),
    ),
  );

  // Services - users
  sl.registerLazySingleton(
    () => UserConsoleService(
      getAllUsersUseCase: sl(),
      getUserUseCase: sl(),
      createUserUseCase: sl(),
      updateUserUseCase: sl(),
      deleteUserUseCase: sl(),
    ),
  );

  // Services - posts
  sl.registerLazySingleton(
    () => PostConsoleService(
      getAllPostsUseCase: sl(),
      getPostUseCase: sl(),
      createPostUseCase: sl(),
      updatePostUseCase: sl(),
      deletePostUseCase: sl(),
    ),
  );
}