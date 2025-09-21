import 'package:get_it/get_it.dart';
import 'package:r34_01/features/book/data/implements/book_repo_implment.dart';
import 'package:r34_01/features/book/data/sources/book_remote_datasource.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';
import 'package:r34_01/features/book/domain/usecase/create_book.dart';
import 'package:r34_01/features/book/domain/usecase/delete_book.dart';
import 'package:r34_01/features/book/domain/usecase/get_all_books.dart';
import 'package:r34_01/features/book/domain/usecase/get_book.dart';
import 'package:r34_01/features/book/domain/usecase/update_book.dart';
import 'package:r34_01/features/book/presentation/services/book_console_service.dart';
import 'package:r34_01/features/post/data/implements/post_repo_implement.dart';
import 'package:r34_01/features/post/data/sources/post_remote_datasource.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';
import 'package:r34_01/features/post/domain/usecase/create_post.dart';
import 'package:r34_01/features/post/domain/usecase/delete_post.dart';
import 'package:r34_01/features/post/domain/usecase/get_all_posts.dart';
import 'package:r34_01/features/post/domain/usecase/get_post.dart';
import 'package:r34_01/features/post/domain/usecase/update_post.dart';
import 'package:r34_01/features/post/presentation/services/post_console_service.dart';
import 'package:r34_01/features/user/data/implements/user_repo_implement.dart';
import 'package:r34_01/features/user/data/sources/user_remote_datasource.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';
import 'package:r34_01/features/user/domain/usecase/create_user.dart';
import 'package:r34_01/features/user/domain/usecase/delete_user.dart';
import 'package:r34_01/features/user/domain/usecase/get_all_users.dart';
import 'package:r34_01/features/user/domain/usecase/get_user.dart';
import 'package:r34_01/features/user/domain/usecase/update_user.dart';
import 'package:r34_01/features/user/presentation/services/user_console_service.dart';

final s1 = GetIt.instance;
void init() {
  s1.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSourceImpl(),
  );

  s1.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(),
  );

  s1.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  s1.registerLazySingleton<BookRepository>(
    () => BookRepoImplment(remoteDatasource: s1()),
  );

  s1.registerLazySingleton<PostRepository>(
    () => PostRepoImplment(remoteDatasource: s1()),
  );
  s1.registerLazySingleton<UserRepository>(
    () => UserRepoImplement(remoteDatasource: s1()),
  );

  s1.registerLazySingleton(() => GetAllBooks(s1()));
  s1.registerLazySingleton(() => GetBook(s1()));
  s1.registerLazySingleton(() => CreateBook(s1()));
  s1.registerLazySingleton(() => UpdateBook(s1()));
  s1.registerLazySingleton(() => DeleteBook(s1()));

  s1.registerLazySingleton(() => GetAllPosts(s1()));
  s1.registerLazySingleton(() => GetPost(s1()));
  s1.registerLazySingleton(() => CreatePost(s1()));
  s1.registerLazySingleton(() => UpdatePost(s1()));
  s1.registerLazySingleton(() => DeletePost(s1()));

  s1.registerLazySingleton(() => GetAllUsers(s1()));
  s1.registerLazySingleton(() => GetUser(s1()));
  s1.registerLazySingleton(() => CreateUser(s1()));
  s1.registerLazySingleton(() => UpdateUser(s1()));
  s1.registerLazySingleton(() => DeleteUser(s1()));

  s1.registerLazySingleton(
    () => BookConsoleService(
      getAllBooksUseCase: s1(),
      getBookUseCase: s1(),
      createBookUseCase: s1(),
      updateBookUseCase: s1(),
      deleteBookUseCase: s1(),
    ),
  );

  s1.registerLazySingleton(
    () => UserConsoleService(
      getAllUsersUseCase: s1(),
      getUserUseCase: s1(),
      createUserUseCase: s1(),
      updateUserUseCase: s1(),
      deleteUserUseCase: s1(),
    ),
  );

  s1.registerLazySingleton(
    () => PostConsoleService(
      getAllPostsUseCase: s1(),
      getPostUseCase: s1(),
      createPostUseCase: s1(),
      updatePostUseCase: s1(),
      deletePostUseCase: s1(),
    ),
  );
}
