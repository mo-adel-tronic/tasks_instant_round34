import 'package:get_it/get_it.dart';
import 'package:r34_23/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:r34_23/features/posts/data/repositories/post_repository_impl.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_23/features/posts/domain/usecases/create_post.dart';
import 'package:r34_23/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_23/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_23/features/posts/domain/usecases/get_post.dart';
import 'package:r34_23/features/posts/domain/usecases/update_post.dart';
import 'package:r34_23/features/posts/presentation/services/post_console_services.dart';
import 'package:r34_23/features/products/data/datasources/product_remote_data_source.dart';
import 'package:r34_23/features/products/data/repositories/product_repository_impl.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';
import 'package:r34_23/features/products/domain/usecases/create_product.dart';
import 'package:r34_23/features/products/domain/usecases/delete_product.dart';
import 'package:r34_23/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_23/features/products/domain/usecases/get_product.dart';
import 'package:r34_23/features/products/domain/usecases/updata_product.dart';
import 'package:r34_23/features/products/presentation/services/product_console_services.dart';
import 'package:r34_23/features/users/data/datasources/user_remote_data_sources.dart';
import 'package:r34_23/features/users/data/repositories/user_repository_impl.dart';
import 'package:r34_23/features/users/domain/repositories/user_repository.dart';
import 'package:r34_23/features/users/domain/usecases/create_user.dart';
import 'package:r34_23/features/users/domain/usecases/delete_user.dart';
import 'package:r34_23/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_23/features/users/domain/usecases/get_user.dart';
import 'package:r34_23/features/users/domain/usecases/update_user.dart';
import 'package:r34_23/features/users/presentation/services/user_console_services.dart';

final sl = GetIt.instance;

void init(){
  // data source
  sl.registerLazySingleton<ProductRemoteDataSource>(
    ()=>ProductRemoteDataSourceImpl()
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    ()=>UserRemoteDataSourceImpl()
  );
 sl.registerLazySingleton<PostRemoteDataSource>(
  ()=>PostRemoteDataSourceImpl()
 );

 // repository
 sl.registerLazySingleton<ProductRepository>(
  ()=>ProductRepositoryImpl(remoteDataSource: sl())
 );
 sl.registerLazySingleton<UserRepository>(
  ()=>UserRepositoryImpl(remoteDataSource: sl())
 );
 sl.registerLazySingleton<PostRepository>(
  ()=>PostRepositoryImpl(remoteDataSource: sl())
 );

 //use cases
 //products
 sl.registerLazySingleton(()=>GetAllProducts(sl()));
 sl.registerLazySingleton(()=>Getproduct(sl()));
 sl.registerLazySingleton(()=>Createproduct(sl()));
 sl.registerLazySingleton(()=>Updateproduct(sl()));
 sl.registerLazySingleton(()=>Deleteproduct(sl()));

//users
 sl.registerLazySingleton(()=>GetAllUsers(sl()));
 sl.registerLazySingleton(()=>GetUser(sl()));
 sl.registerLazySingleton(()=>CreateUser(sl()));
 sl.registerLazySingleton(()=>UpdateUser(sl()));
 sl.registerLazySingleton(()=>DeleteUser(sl()));

 //posts
sl.registerLazySingleton(()=>GetAllPosts(sl()));
 sl.registerLazySingleton(()=>GetPost(sl()));
 sl.registerLazySingleton(()=>CreatePost(sl()));
 sl.registerLazySingleton(()=>UpdatePost(sl()));
 sl.registerLazySingleton(()=>DeletePost(sl()));

 //services

 //products
 sl.registerLazySingleton(
  ()=>ProductConsoleServices(
   getallproductsusecase: sl(),
   getproductsusecase: sl(),
   createproductusecase: sl(),
   updateproductusecase: sl(), 
   deleteproductusecase: sl()
   )
 );
 
 //users
 sl.registerLazySingleton(
  ()=>UserConsoleServices(
  getAllUsersUseCase: sl(), 
  getUserUseCase: sl(), 
  createUserUseCase: sl(), 
  updateUserUseCase: sl(), 
  deleteUserUseCase: sl()
  )
 );

 //posts
 sl.registerLazySingleton(
  ()=>PostConsoleServices(
  getAllPostsUseCase: sl(), 
  getPostUseCase: sl(), 
  createPostUseCase: sl(), 
  updatePostUseCase: sl(), 
  deletePostUseCase: sl()
  )
 );
}
