import 'package:r34_06/core/error/messages.dart';
import 'package:r34_06/features/posts/domain/entities/post.dart';
import 'package:r34_06/features/posts/domain/usecases/create_post.dart';
import 'package:r34_06/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_06/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_06/features/posts/domain/usecases/get_post.dart';
import 'package:r34_06/features/posts/domain/usecases/update_post.dart';

class PostConsoleService with FailureMessages {
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
    final result = getAllPostsUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No posts found.');
        } else {
          print('\n== POSTS ===');
          for (final post in posts) {
            print('ID: ${post.id}');
            print('Title: ${post.title}');
            print('Content: ${post.content}');
            print('--');
          }
        }
      },
    );
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (post) {
        print('\n== POST DETAILS ===');
        print('ID: ${post.id}');
        print('Title: ${post.title}');
        print('Content: ${post.content}');
      },
    );
  }

  void createPost(String title, String content) {
    final post = Post(
      id: '',
      title: title,
      content: content,
    );

    final result = createPostUseCase(CreatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  void updatePost(String id, String title, String content) {
    final post = Post(
      id: id,
      title: title,
      content: content,
    );

    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedPost) => print('Post updated successfully'),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(DeletePostParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}