import 'package:r34_23/core/error/message.dart';
import 'package:r34_23/features/posts/domain/entities/post.dart';
import 'package:r34_23/features/posts/domain/usecases/create_post.dart';
import 'package:r34_23/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_23/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_23/features/posts/domain/usecases/get_post.dart';
import 'package:r34_23/features/posts/domain/usecases/update_post.dart';

class PostConsoleServices with Message {
  final GetAllPosts getAllPostsUseCase;
  final GetPost getPostUseCase;
  final CreatePost createPostUseCase;
  final UpdatePost updatePostUseCase;
  final DeletePost deletePostUseCase;

  PostConsoleServices({
    required this.getAllPostsUseCase,
    required this.getPostUseCase,
    required this.createPostUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });

  void displayAllPosts() {
    final result = getAllPostsUseCase();
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (posts) {
        if (posts.isEmpty) {
          print("No posts found.");
        } else {
          print('\n=== Posts ===');
          for (final post in posts) {
            print("ID: ${post.id}");
            print("Title: ${post.title}");
            print("Content: ${post.content}");
            print("-----");
          }
        }
      },
    );
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParams(id));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (post) {
        print("\n=== Post Details ===");
        print("ID: ${post.id}");
        print("Title: ${post.title}");
        print("Content: ${post.content}");
      },
    );
  }

  void createPost(String title, String content ) {
    final post = Post(
      id: "",
      title: title,
      content: content,
     
    );

    final result = createPostUseCase(CreatePostParams(post));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (newPost) =>
          print("New post created successfully with ID: ${newPost.id}"),
    );
  }

  void updatePost(String id, String title, String content) {
    final post = Post(
      id: id,
      title: title,
      content: content,
    );

    final result = updatePostUseCase(UpdatePostParams(post));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (_) => print("Post updated successfully."),
    );
  }

  void deletePost(String id) {
    final result = deletePostUseCase(Deletepostparams(id));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (success) => print(success ? "Post deleted successfully." : "Post not found.",
      ),
    );
  }
}