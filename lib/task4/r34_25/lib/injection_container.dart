import 'package:get_it/get_it.dart';
import 'package:task3/core/network/api_provider.dart';
import 'package:task3/core/network/http_provider.dart';
import 'package:task3/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task3/features/posts/data/repositories/post_repository_impl.dart';
import 'package:task3/features/posts/domain/repositories/posts_repository.dart';
import 'package:task3/features/posts/domain/usecase/create_post.dart';
import 'package:task3/features/posts/domain/usecase/delete_post.dart';
import 'package:task3/features/posts/domain/usecase/get_all_posts.dart';
import 'package:task3/features/posts/domain/usecase/get_post.dart';
import 'package:task3/features/posts/domain/usecase/update_post.dart';
import 'package:task3/features/posts/presentation/console/post_menu.dart';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';
import 'package:task3/features/products/data/datasources/product_remote_datasource.dart';
import 'package:task3/features/products/data/repositories/product_repository_impl.dart';
import 'package:task3/features/products/domain/repositories/product_repository.dart';
import 'package:task3/features/products/domain/usecase/create_product.dart';
import 'package:task3/features/products/domain/usecase/delete_product.dart';
import 'package:task3/features/products/domain/usecase/get_all_product.dart';
import 'package:task3/features/products/domain/usecase/get_product.dart';
import 'package:task3/features/products/domain/usecase/update_product.dart';
import 'package:task3/features/products/presentation/console/product_menu.dart';
import 'package:task3/features/products/presentation/services/product_console_service.dart';
import 'package:task3/features/user/data/datasources/user_remote_datesources.dart';
import 'package:task3/features/user/data/repositories/user_repository_impl.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';
import 'package:task3/features/user/domin/usecase/create_user.dart';
import 'package:task3/features/user/domin/usecase/delete_user.dart';
import 'package:task3/features/user/domin/usecase/get_all_users.dart';
import 'package:task3/features/user/domin/usecase/get_user.dart';
import 'package:task3/features/user/domin/usecase/update_user.dart';
import 'package:task3/features/user/presentation/console/user_menu.dart';
import 'package:task3/features/user/presentation/services/use_console_service.dart';

final s1 = GetIt.instance;

void init() {
  // core providers
  s1.registerLazySingleton<ApiProvider>(() => HttpProvider());

  // Data sources
  s1.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiProvider: s1()),
  );
  s1.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDatasourceImpl(apiProvider: s1()),
  );
  s1.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(apiProvider: s1()),
  );

  // Repository
  s1.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: s1()),
  );
  s1.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(remoteDataSource: s1()),
  );
  s1.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDatasource: s1()),
  );

  // Use cases - Products
  s1.registerLazySingleton(() => GetAllProducts(s1()));
  s1.registerLazySingleton(() => GetProduct(s1()));
  s1.registerLazySingleton(() => CreateProduct(s1()));
  s1.registerLazySingleton(() => UpdateProduct(s1()));
  s1.registerLazySingleton(() => DeleteProduct(s1()));

  // Use cases - Users
  s1.registerLazySingleton(() => GetAllUsers(s1()));
  s1.registerLazySingleton(() => GetUser(s1()));
  s1.registerLazySingleton(() => CreateUser(s1()));
  s1.registerLazySingleton(() => UpdateUser(s1()));
  s1.registerLazySingleton(() => DeleteUser(s1()));

  // Use cases - Posts
  s1.registerLazySingleton(() => GetAllPosts(s1()));
  s1.registerLazySingleton(() => GetPost(s1()));
  s1.registerLazySingleton(() => CreatePost(s1()));
  s1.registerLazySingleton(() => UpdatePost(s1()));
  s1.registerLazySingleton(() => DeletePost(s1()));

  // Services - products
  s1.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: s1(),
      getProductUseCase: s1(),
      createProductUseCase: s1(),
      updateProductUseCase: s1(),
      deleteProductUseCase: s1(),
    ),
  );

  // Services - users
  s1.registerLazySingleton(
    () => UserConsoleService(
      getAllUsersUseCase: s1(),
      getUserUseCase: s1(),
      createUserUseCase: s1(),
      updateUserUseCase: s1(),
      deleteUserUseCase: s1(),
    ),
  );

  // Services - posts
  s1.registerLazySingleton(
    () => PostConsoleService(
      getAllPostsUseCase: s1(),
      getPostUseCase: s1(),
      createPostUseCase: s1(),
      updatePostUseCase: s1(),
      deletePostUseCase: s1(),
    ),
  );

  // Create the main menu
  s1.registerFactory(() => ProductMenu(s1<ProductConsoleService>()));
  s1.registerFactory(() => UserMenu(s1<UserConsoleService>()));
  s1.registerFactory(() => PostMenu(s1<PostConsoleService>()));
}
