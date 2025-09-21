/*
*We need to Start in main.dart with console folder in presentation layer

*problem:*
*we need product service => that needs GetAllProductUseCase => that needs ProductRepositoryImpl => that needs RemoteDataSources =>....

*Sol: Use Dependency Injection
use singletoon to define one object for these parameters in one container(box) and use the objects from it

how?
use get_it package
 */
/*
10.
*injection_container.dart

void init(){
register(define) object for all your services that you will need
*Note : arrange them
so we will start from RemoteDataSources , then ProductRepositoryImpl ,  GetAllProductUseCase , ...

var sl = GetIt.instance

sl.registerFactory =>generate new instance every time from class
(or) sl.registerSingletoon=> generate one object and use it any time (object will created when app is runned)
(or) sl.registerLeazySingletoon ,  generate one object and use it any time (object will created when you called it first time)

ex:
sl.registerLeazySingletoon<ProductRepository>(
()=>ProductRepositoryImpl(remoteDataSource: sl()),
);

*registerLeazySingletoon<ProductRepository>: use generics
*()=> returned object or data
* remoteDataSource: sl() :  search in container (sl) about any object of RemoteDataSource
}
 */

import 'package:get_it/get_it.dart';
import 'package:r34_02/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_02/features/products/data/repositories/product_repository.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';
import 'package:r34_02/features/products/domain/usecases/create_product.dart';
import 'package:r34_02/features/products/domain/usecases/delete_product.dart';
import 'package:r34_02/features/products/domain/usecases/get_all_product.dart';
import 'package:r34_02/features/products/domain/usecases/get_product.dart';
import 'package:r34_02/features/products/domain/usecases/update_product.dart';
import 'package:r34_02/features/products/presentation/services/product_console_service.dart';
import 'package:r34_02/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_02/features/posts/data/repositories/post_repository.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_02/features/posts/domain/usecases/create_post.dart';
import 'package:r34_02/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_02/features/posts/domain/usecases/get_all_post.dart';
import 'package:r34_02/features/posts/domain/usecases/get_post.dart';
import 'package:r34_02/features/posts/domain/usecases/update_post.dart';
import 'package:r34_02/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_02/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_02/features/users/data/repositories/user_repository.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';
import 'package:r34_02/features/users/domain/usecases/create_user.dart';
import 'package:r34_02/features/users/domain/usecases/delete_user.dart';
import 'package:r34_02/features/users/domain/usecases/get_all_user.dart';
import 'package:r34_02/features/users/domain/usecases/get_user.dart';
import 'package:r34_02/features/users/domain/usecases/update_user.dart';
import 'package:r34_02/features/users/presentation/services/user_console_service.dart';

final sl = GetIt.instance;
void init() {
  //*we need product service => that needs GetAllProductUseCase => that needs ProductRepositoryImpl => that needs RemoteDataSources =>....

  //*sl.registerLeazySingletoon:  generate one object and use it any time (object will created when you called it first time)

  //Product
  //Data Source
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  //Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl()),
  );
  //search in container (sl) about any object of RemoteDataSource

  //Use Case
  sl.registerLazySingleton<GetAllProduct>(() => GetAllProduct(sl()));
  sl.registerLazySingleton<GetProduct>(() => GetProduct(sl()));
  sl.registerLazySingleton<CreateProduct>(() => CreateProduct(sl()));
  sl.registerLazySingleton<UpdateProduct>(() => UpdateProduct(sl()));
  sl.registerLazySingleton<DeleteProduct>(() => DeleteProduct(sl()));

  //Service
  sl.registerLazySingleton<ProductConsoleService>(
    () => ProductConsoleService(
      createProductUseCase: sl(),
      deleteProductUseCase: sl(),
      getAllProductsUseCase: sl(),
      getProductUseCase: sl(),
      updateProductUseCase: sl(),
    ),
  );

  //User
  //DataSource
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  //Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: sl()),
  );

  //UseCases
  sl.registerLazySingleton<GetAllUser>(() => GetAllUser(sl()));
  sl.registerLazySingleton<GetUser>(() => GetUser(sl()));
  sl.registerLazySingleton<CreateUser>(() => CreateUser(sl()));
  sl.registerLazySingleton<UpdateUser>(() => UpdateUser(sl()));
  sl.registerLazySingleton<DeleteUser>(() => DeleteUser(sl()));

  //Service
  sl.registerLazySingleton<UserConsoleService>(
    () => UserConsoleService(
      createUserUseCase: sl(),
      deleteUserUseCase: sl(),
      getAllUsersUseCase: sl(),
      getUserUseCase: sl(),
      updateUserUseCase: sl(),
    ),
  );

  //Post

  //DataSource
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(),
  );

  //Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(postRemoteDataSource: sl()),
  );

  //Use Cases
  sl.registerLazySingleton<GetAllPost>(() => GetAllPost(sl()));
  sl.registerLazySingleton<GetPost>(() => GetPost(sl()));
  sl.registerLazySingleton<CreatePost>(() => CreatePost(sl()));
  sl.registerLazySingleton<UpdatePost>(() => UpdatePost(sl()));
  sl.registerLazySingleton<DeletePost>(() => DeletePost(sl()));

  //Service
  sl.registerLazySingleton<PostConsoleService>(
    () => PostConsoleService(
      createPostUseCase: sl(),
      deletePostUseCase: sl(),
      getAllPostsUseCase: sl(),
      getPostUseCase: sl(),
      updatePostUseCase: sl(),
    ),
  );
}
