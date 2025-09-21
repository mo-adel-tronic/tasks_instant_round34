import 'package:r34_24/core/error/messages.dart';
import 'package:r34_24/features/posts/domain/entites/post.dart';
import 'package:r34_24/features/posts/domain/usecases/create_post.dart';
import 'package:r34_24/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_24/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_24/features/posts/domain/usecases/get_post.dart';
import 'package:r34_24/features/posts/domain/usecases/uptade_post.dart';

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
    final result = getAllPostsUseCase();
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No posts found.');
        } else {
          print("\n====== All Posts ======");
          for (final post in posts) {
            print('ID: ${post.id}');
            print('Title: ${post.title}');
            print('Publihser: ${post.publisherId}');
            print('--------------------');
          }
        }
      },
    );
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id: id));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (post) {
        print("\n------- Post Details -----");
        print('ID: ${post.id}');
        print('Title: ${post.title}');
        print('PublisherID: ${post.publisherId}');
      },
    );
  }

  void createPost(String title, String content , String publisherId) {
    final post = Post(id: '', title: title, content: content, publisherId: publisherId);
    final result = createPostUseCase(CreatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  void updatePost(String id, String title, String content, String publisherId) {
    final post = Post(id: id, title: title, content: content, publisherId: publisherId);
    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (sucess) => print('Post updated successfully'),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(id);
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (success) =>print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}
