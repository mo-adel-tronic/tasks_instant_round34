import 'package:get_it/get_it.dart';
import 'package:r34_24/features/book/data/datasources/book_remote_datasource.dart';
import 'package:r34_24/features/book/data/repositories/book_repo.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';
import 'package:r34_24/features/book/domain/usescases/create_book.dart';
import 'package:r34_24/features/book/domain/usescases/delete_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_all_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_book.dart';
import 'package:r34_24/features/book/domain/usescases/uptade_book.dart';
import 'package:r34_24/features/book/presentation/services/book_console_service.dart';
import 'package:r34_24/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_24/features/posts/data/repositories/post_repo.dart';
import 'package:r34_24/features/posts/domain/repositories/post_repos.dart';
import 'package:r34_24/features/posts/domain/usecases/create_post.dart';
import 'package:r34_24/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_24/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_24/features/posts/domain/usecases/get_post.dart';
import 'package:r34_24/features/posts/domain/usecases/uptade_post.dart';
import 'package:r34_24/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_24/features/user/data/datasources/user_remote_datasource.dart';
import 'package:r34_24/features/user/data/repositories/user_repo.dart';
import 'package:r34_24/features/user/domain/repositories/user_repo.dart';
import 'package:r34_24/features/user/domain/uesecases/create_user.dart';
import 'package:r34_24/features/user/domain/uesecases/delete_user.dart';
import 'package:r34_24/features/user/domain/uesecases/get_all_user.dart';
import 'package:r34_24/features/user/domain/uesecases/get_user.dart';
import 'package:r34_24/features/user/domain/uesecases/uptade_user.dart';
import 'package:r34_24/features/user/presentation/services/user_console_services.dart';




final sl = GetIt.instance;

void init() {

  sl.registerLazySingleton<BookRemoteDatasource>(
    () => BookRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<BookRepos>(
    () => BookRepositoryIMPL(remoteDatasource: sl()),
  );
  sl.registerLazySingleton(() => GetAllBooks(sl()));
  sl.registerLazySingleton(() => GetBook(sl()));
  sl.registerLazySingleton(() => CreateBook(sl()));
  sl.registerLazySingleton(() => UpdateBook(sl()));
  sl.registerLazySingleton(() => DeleteBook(sl()));
  sl.registerLazySingleton(() => BookConsoleService(
        getAllBooksUseCase: sl(),
        getBookUseCase: sl(),
        createBookUseCase: sl(),
        updateBookUseCase: sl(),
        deleteBookUseCase: sl(),
      ));

  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImpl()
    );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDatasource: sl())
    );
  sl.registerLazySingleton(() => GetAllPosts(sl()));
  sl.registerLazySingleton(() => GetPost(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => PostConsoleService(
        getAllPostsUseCase: sl(),
        getPostUseCase: sl(),
        createPostUseCase: sl(),
        updatePostUseCase: sl(),
        deletePostUseCase: sl(),
      ));


  sl.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl()
    );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDatasource: sl())
    );
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => UserConsoleService(
        getAllUsersUseCase: sl(),
        getUserUseCase: sl(),
        createUserUseCase: sl(),
        updateUserUseCase: sl(),
        deleteUserUseCase: sl(),
      ));
}

BookRemoteDatasourceImpl remoteDatasource = sl <BookRemoteDatasourceImpl>();
PostRemoteDatasource postRemoteDatasource = sl<PostRemoteDatasource>();
