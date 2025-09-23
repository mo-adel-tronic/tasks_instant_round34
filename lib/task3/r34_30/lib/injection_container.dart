import 'package:get_it/get_it.dart';
import 'package:task3/features/posts/data/datasource/posts_remote_datasource.dart';
import 'package:task3/features/posts/data/repositories/posts_repostory_imp.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';
import 'package:task3/features/posts/domin/usecase/create_posts.dart';
import 'package:task3/features/posts/domin/usecase/delete_posts.dart';
import 'package:task3/features/posts/domin/usecase/get_all_posts.dart';
import 'package:task3/features/posts/domin/usecase/get_posts.dart';
import 'package:task3/features/posts/domin/usecase/update_posts.dart';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';
import 'package:task3/features/product/data/datasource/product_remote_datasource.dart';
import 'package:task3/features/product/data/repositories/product_repostory_imp.dart';
import 'package:task3/features/product/domin/repositories/product_repository.dart';
import 'package:task3/features/product/domin/usecase/create_product.dart';
import 'package:task3/features/product/domin/usecase/delete_product.dart';
import 'package:task3/features/product/domin/usecase/get_all_product.dart';
import 'package:task3/features/product/domin/usecase/get_product.dart';
import 'package:task3/features/product/domin/usecase/update_product.dart';
import 'package:task3/features/product/presentation/services/product_console_service.dart';
import 'package:task3/features/user/data/datasource/user_remote_datasource.dart';
import 'package:task3/features/user/data/repositories/user_repostory_imp.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';
import 'package:task3/features/user/domin/usecase/create_user.dart';
import 'package:task3/features/user/domin/usecase/delete_user.dart';
import 'package:task3/features/user/domin/usecase/get_all_user.dart';
import 'package:task3/features/user/domin/usecase/get_user.dart';
import 'package:task3/features/user/domin/usecase/update_user.dart';
import 'package:task3/features/user/presentation/services/user_console_service.dart';


final k1 = GetIt.instance;

void init() {
  k1.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
  k1.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDatasourceImp(),

  );
  k1.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(),
  );


  k1.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: k1()),
  );
   k1.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(remoteDataSource: k1()),
  );
  k1.registerLazySingleton<PostRepository>(
    () => PostsRepositoryImpl(remoteDataSource: k1()),
  );

  k1.registerLazySingleton(() => GetAllProducts(k1()));
  k1.registerLazySingleton(() => GetProduct(k1()));
  k1.registerLazySingleton(() => CreateProduct(k1()));
  k1.registerLazySingleton(() => UpdateProduct(k1()));
  k1.registerLazySingleton(() => DeleteProduct(k1()));

  k1.registerLazySingleton(() => GetAllUsers(k1()));
  k1.registerLazySingleton(() => GetUser(k1()));
  k1.registerLazySingleton(() => CreateUser(k1()));
  k1.registerLazySingleton(() => UpdateUser(k1()));
  k1.registerLazySingleton(() => DeleteUser(k1()));

  k1.registerLazySingleton(() => GetAllPosts(k1()));
  k1.registerLazySingleton(() => GetPost(k1()));
  k1.registerLazySingleton(() => CreatePost(k1()));
  k1.registerLazySingleton(() => UpdatePost(k1()));
  k1.registerLazySingleton(() => DeletePost(k1()));

  k1.registerLazySingleton(
    () => ProductConsoleService(
      getAllProductsUseCase: k1(),
      getProductUseCase: k1(),
      createProductUseCase: k1(),
      updateProductUseCase: k1(),
      deleteProductUseCase: k1(),
    ),
  );

  k1.registerLazySingleton(
    () => UserConsoleService(
      getAllUsersUseCase: k1(),
      getUserUseCase: k1(),
      createUserUseCase: k1(),
      updateUserUseCase: k1(),
      deleteUserUseCase: k1(),
    ),
  );

  k1.registerLazySingleton(
    () => PostConsoleService(
      getAllPostsUseCase: k1(),
      getPostUseCase: k1(),
      createPostUseCase: k1(),
      updatePostUseCase: k1(),
      deletePostUseCase: k1(),
    ),
  );
}