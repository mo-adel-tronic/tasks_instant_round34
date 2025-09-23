import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/usecase/create_post.dart';
import 'package:r34_01/features/post/domain/usecase/delete_post.dart';
import 'package:r34_01/features/post/domain/usecase/get_all_posts.dart';
import 'package:r34_01/features/post/domain/usecase/get_post.dart';
import 'package:r34_01/features/post/domain/usecase/update_post.dart';
import 'package:r34_01/core/error/messages.dart';

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
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      posts,
    ) {
      if (posts.isEmpty) {
        print("No Posts found.");
      } else {
        print("\n===POSTS===");
        for (final post in posts) {
          print("ID: ${post.id}");
          print("Name: ${post.name}");
          print("Description: ${post.description}");
          print("Price: \$${post.price.toStringAsFixed(2)}");
          print("-----");
        }
      }
    });
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id: id));
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      post,
    ) {
      print("\n===POSTS===");
      print("ID: ${post.id}");
      print("Name: ${post.name}");
      print("Description: ${post.description}");
      print("Price: \$${post.price.toStringAsFixed(2)}");
      print("-----");
    });
  }

  void createPost(String name, String description, double price) {
    final post = Post(
      id: '',
      name: name,
      description: description,
      price: price,
    );
    final result = createPostUseCase(CreatePostParams(post: post));
    result.fold(
      (failuer) => print('Error:${mapFailureToMessage(failuer)}'),
      (newPost) => print('Post created successfully with ID:${newPost.id}'),
    );
  }

  void updatePost(String id, String name, String description, double price) {
    final post = Post(
      id: id,
      name: name,
      description: description,
      price: price,
    );
    final result = updatePostUseCase(UpdatePostParams(post: post));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (updatedPost) => print('Post updated successfully'),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(DeletePostParams(id: id));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (success) => print(success? 'Post deleted successfully' : 'Post not found'),
    );
  }
}
