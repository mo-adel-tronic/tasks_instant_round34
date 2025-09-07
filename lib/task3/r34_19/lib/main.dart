import 'package:flutter/material.dart';
import 'features/user/presentation/user_screen.dart';
import 'features/post/presentation/post_screen.dart';
import 'features/book/presentation/book_screen.dart';
import 'features/user/data/implements/user_repository_impl.dart';
import 'features/user/data/implements/user_local_source_impl.dart';
import 'features/post/data/implements/post_repository_impl.dart';
import 'features/post/data/implements/post_local_source_impl.dart';
import 'features/book/data/implements/book_repository_impl.dart';
import 'features/book/data/implements/book_local_source_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create local sources and repository instances
    final userLocal = UserLocalSourceImpl();
    final userRepo = UserRepositoryImpl(userLocal);
    final postLocal = PostLocalSourceImpl();
    final postRepo = PostRepositoryImpl(postLocal);
    final bookLocal = BookLocalSourceImpl();
    final bookRepo = BookRepositoryImpl(bookLocal);

    return MaterialApp(
      title: 'Task3 Clean Arch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(userRepo: userRepo, postRepo: postRepo, bookRepo: bookRepo),
    );
  }
}

class HomePage extends StatelessWidget {
  final UserRepositoryImpl userRepo;
  final PostRepositoryImpl postRepo;
  final BookRepositoryImpl bookRepo;
  const HomePage({super.key, required this.userRepo, required this.postRepo, required this.bookRepo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task3 - Features')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserScreen(repository: userRepo))), child: const Text('Users')),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PostScreen(repository: postRepo))), child: const Text('Posts')),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookScreen(repository: bookRepo))), child: const Text('Books')),
          ],
        ),
      ),
    );
  }
}
