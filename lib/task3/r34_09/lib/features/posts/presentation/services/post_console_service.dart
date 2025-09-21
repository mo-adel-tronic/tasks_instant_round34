import 'dart:ffi';

import 'package:task7/core/error/messages.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:task7/features/posts/domain/usecases/create_post.dart';
import 'package:task7/features/posts/domain/usecases/delete_post.dart';
import 'package:task7/features/posts/domain/usecases/get_all_post.dart';
import 'package:task7/features/posts/domain/usecases/get_post.dart';
import 'package:task7/features/posts/domain/usecases/update_post.dart';
import 'package:task7/features/posts/domain/entities/post.dart';

class PostConsoleService with MapFailureMessages {
  late final GetAllPost getAllPostUseCase;
  late final GetPost getPostUseCase;
  late final CreatePost createPostUseCase;
  late final UpdatePost updatePostUseCase;
  late final DeletePost deletePostUseCase;
  PostConsoleService({
    required this.getAllPostUseCase,
    required this.getPostUseCase,
    required this.createPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });

  Future<void> displayAllPost() async {
    final result = await getAllPostUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No post found.');
          return;
        }
        print('\n=== posts ===');
        for (final post in posts) {
          print('ID: ${post.id}');
          print('title: ${post.title}');
          print('content: ${post.content}');
          print('createAt: ${post.createAt}');
          print('---');
        }
      },
    );
  }

  Future<void> displaypost(String id) async {
    final result = await getPostUseCase(getPostparams(id: id));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (Post) {
        print('\n=== posts DETAILS ===');
        print('ID: ${Post.id}');
        print('title: ${Post.title}');
        print('content: ${Post.content}');
        print('createAt: ${Post.createAt}');
      },
    );
  }

  
  Future<void> createpost(String title, String content, int createAt) async {
    final post = Post(
      id: '', 
      title: title,
      content: content,
      createAt: createAt,
    );
 
    final result =
        await createPostUseCase(createPostparams(post: post));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newPost) =>
          print('post created successfully with ID: ${newPost.id}'),
    );
  }

   Future<void> updatepost(
      String id, String title, String content, int createAt) async {
    final post = Post(
      id: id,
      title: title,
      content: content,
      createAt: createAt,
    );

    final result =
        await updatePostUseCase(UpdatePostparams(post: post));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedpost) => print('post updated successfully'),
    );
  }

Future<void> deletepost(String id) async {
  final result = await deletePostUseCase(DeletePostparams(id: id));
  result.fold(
    (failure) => print('Error: ${mapFailureToMessage(failure)}'),
    (success) => print(
      success ? 'post deleted successfully' : 'post not found',
    ),
  );
}
}
