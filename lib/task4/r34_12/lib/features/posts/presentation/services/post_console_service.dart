import 'dart:async';

import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/usecases/create_post.dart';
import 'package:r34_12/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_12/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_12/features/posts/domain/usecases/get_post.dart';
import 'package:r34_12/features/posts/domain/usecases/update_post.dart';




class PostConsoleService with FailureMessages {
  final _lodingController = StreamController<bool>.broadcast();


  Stream<bool> get lodingStream => _lodingController.stream;

  void _setLoding(bool v) => _lodingController.add(v);


  final GetAllPosts getAllPostsUseCase;
  final GetPost getPostUseCase;
  final CreatePost createPostUseCase;
  final UpdatePost updatePostUseCase;
  final DeletePost deletePostUseCase;

  PostConsoleService({
    required this.getAllPostsUseCase,
    required this.getPostUseCase,
    required this.createPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });


  void dispose(){
    _lodingController.close();
  }

  Future<void> displayAllPosts() async {
    _setLoding(true);
    final result = await getAllPostsUseCase();
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No posts found.');
        } else {
          print('\n== PostS ===');
          for (final post in posts) {
            print('ID: ${post.id}');
            print('Title: ${post.title}');
            print('content: ${post.content}');
            print('--');
          }
        }
      },
    );
  }

  Future<void> displayPost(String id) async {
     _setLoding(true);
    final result = await getPostUseCase(GetPostParams(id: id));
    _setLoding(false);
    
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (post) {
        print('\n== Post DETAILS ===');
        print('ID: ${post.id}');
        print('title: ${post.title}');
        print('content: ${post.content}');
        
      },
    );
  }

  Future<void> createPost(String title, String content) async {
    final post = Post(
      id: '',
      title: title,
      content: content,
      
    );

    _setLoding(true);
    final result = await createPostUseCase(CreatePostParams(post: post));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  Future<void> updatePost(String id, String title, String content,) async {
    final post = Post(
      id: id,
      title: title,
      content: content,
      
    );


    _setLoding(true);
    final result = await updatePostUseCase(UpdatePostParams(post: post));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedPost) => print('Post updated successfully'),
    );
  }

  Future<void> deletePost(String id) async {
    _setLoding(true);
    final result = await deletePostUseCase(DeletePostParams(id: id));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}