import 'package:get_it/get_it.dart';
import 'package:r34_01/core/network/api_provider.dart';
import 'package:r34_01/core/network/http_provider.dart';
import 'package:r34_01/features/book/data/implements/book_repo_implment.dart';
import 'package:r34_01/features/book/data/sources/book_remote_datasource.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';
import 'package:r34_01/features/book/domain/usecase/create_book.dart';
import 'package:r34_01/features/book/domain/usecase/delete_book.dart';
import 'package:r34_01/features/book/domain/usecase/get_all_books.dart';
import 'package:r34_01/features/book/domain/usecase/get_book.dart';
import 'package:r34_01/features/book/domain/usecase/update_book.dart';
import 'package:r34_01/features/book/presentation/console/book_menu.dart';
import 'package:r34_01/features/book/presentation/services/book_console_service.dart';
import 'package:r34_01/features/post/data/implements/post_repo_implement.dart';
import 'package:r34_01/features/post/data/sources/post_remote_datasource.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';
import 'package:r34_01/features/post/domain/usecase/create_post.dart';
import 'package:r34_01/features/post/domain/usecase/delete_post.dart';
import 'package:r34_01/features/post/domain/usecase/get_all_posts.dart';
import 'package:r34_01/features/post/domain/usecase/get_post.dart';
import 'package:r34_01/features/post/domain/usecase/update_post.dart';
import 'package:r34_01/features/post/presentation/console/post_menu.dart';
import 'package:r34_01/features/post/presentation/services/post_console_service.dart';
import 'package:r34_01/features/user/data/implements/user_repo_implement.dart';
import 'package:r34_01/features/user/data/sources/user_remote_datasource.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';
import 'package:r34_01/features/user/domain/usecase/create_user.dart';
import 'package:r34_01/features/user/domain/usecase/delete_user.dart';
import 'package:r34_01/features/user/domain/usecase/get_all_users.dart';
import 'package:r34_01/features/user/domain/usecase/get_user.dart';
import 'package:r34_01/features/user/domain/usecase/update_user.dart';
import 'package:r34_01/features/user/presentation/console/user_menu.dart';
import 'package:r34_01/features/user/presentation/services/user_console_service.dart';


final s1 = GetIt.instance;

void init() {
  // core providers
  s1.registerLazySingleton<ApiProvider>(() => HttpProvider());

  // Data sources
  s1.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(apiProvider: s1()),
  );
  s1.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDatasourceImp(apiProvider: s1()),
  );
  s1.registerLazySingleton<PostRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(apiProvider: s1()),
  );

  // Repository
  s1.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: s1()),
  );
  s1.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(remoteDataSource: s1()),
  );
  s1.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: s1()),
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