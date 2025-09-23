import 'package:task3/core/error/messages.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';
import 'package:task3/features/posts/domin/usecase/create_posts.dart';
import 'package:task3/features/posts/domin/usecase/delete_posts.dart';
import 'package:task3/features/posts/domin/usecase/get_all_posts.dart';
import 'package:task3/features/posts/domin/usecase/get_posts.dart';
import 'package:task3/features/posts/domin/usecase/update_posts.dart';

class PostConsoleService with MapFailureMessages {
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

  void displayAllPosts() {
    final posts = getAllPostsUseCase();
    posts.fold((Failure) => print('Error: ${mapFailureMessages(Failure)}'), (
      posts,
    ) {
      if (posts.isEmpty) {
        print('No posts found.');
      } else {
        print('\n== POSTS ===');
      }
      for (final post in posts) {
        print('Post ID: ${post.id}');
        print('Name: ${post.name}');
        print('Body: ${post.body}');
      }
    });
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id: id));
    result.fold((failure) => print('Error: ${mapFailureMessages(failure)}'), (
      post,
    ) {
      print('\n== POST DETAILS ===');
      print('ID: ${post.id}');
      print('Name: ${post.name}');
      print('Body: ${post.body}');
    });
  }

  void createPost(String name, String body) {
    final post = Post(
      id: '',
      name: name,
      body: body
    );

    final result = createPostUseCase(CreatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  void updatePost(String id, String name, String body) {
    final post = Post(
      id: id,
      name: name,
      body: body
    );

    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (updatedPost) => print('Post updated successfully'),
    );
  }

  void deletePost (String id) {
    final result = deletePostUseCase(DeletePostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) => print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}