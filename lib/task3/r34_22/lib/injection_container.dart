import 'package:r34_22/features/posts/domain/usecases/create_post.dart';
import 'package:r34_22/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_22/features/posts/domain/usecases/get_all_post.dart';
import 'package:r34_22/features/posts/domain/usecases/get_post.dart';
import 'package:r34_22/features/posts/domain/usecases/update_post.dart';
import 'package:r34_22/features/products/data/datasources/product_remote_data_source.dart';
import 'package:r34_22/features/products/data/repositories/product_repository_impl.dart';
import 'package:r34_22/features/products/domain/repositories/product_repository.dart';
import 'package:r34_22/features/products/domain/usecases/create_product.dart';
import 'package:r34_22/features/products/domain/usecases/delete_product.dart';
import 'package:r34_22/features/products/domain/usecases/get_all_product.dart';
import 'package:r34_22/features/products/domain/usecases/get_product.dart';
import 'package:r34_22/features/products/domain/usecases/update_product.dart';
import 'package:r34_22/features/products/presentation/services/product_console_service.dart';
import 'package:r34_22/features/user/data/datasources/user_remote_data_source.dart';
import 'package:r34_22/features/user/data/repositories/user_repository_impl.dart';
import 'package:r34_22/features/user/domain/repositories/user_repository.dart';
import 'package:r34_22/features/user/domain/usecases/create_user.dart';
import 'package:r34_22/features/user/domain/usecases/delete_user.dart';
import 'package:r34_22/features/user/domain/usecases/get_all_user.dart';
import 'package:r34_22/features/user/domain/usecases/get_user.dart';
import 'package:r34_22/features/user/domain/usecases/update_user.dart';
import 'package:r34_22/features/user/presentation/service/user_console_service.dart';

final sl = GetIt.instance;

class GetIt {
  static var instance;
}

void init(){
  // data source
  sl.registerLazySingleton<ProductRemoteDataSource>(
    ()=>ProductRemoteDataSourceImpl()
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    ()=>UserRemoteDataSourceImpl()
  );
 // repository
 sl.registerLazySingleton<ProductRepository>(
  ()=>ProductRepositoryImpl(remoteDataSource: sl())
 );
 sl.registerLazySingleton<UserRepository>(
  ()=>UserRepositoryImpl(remoteDataSource: sl())
 );
 //use cases
 //products
 sl.registerLazySingleton(()=>GetAllProducts(sl()));
 sl.registerLazySingleton(()=>GetProduct(sl()));
 sl.registerLazySingleton(()=>CreateProduct(sl()));
 sl.registerLazySingleton(()=>UpdateProduct(sl()));
 sl.registerLazySingleton(()=>DeleteProduct(sl()));

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
}