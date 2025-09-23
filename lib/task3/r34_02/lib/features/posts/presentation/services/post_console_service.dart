import 'package:r34_02/core/error/messages.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/usecases/create_post.dart';
import 'package:r34_02/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_02/features/posts/domain/usecases/get_all_post.dart';
import 'package:r34_02/features/posts/domain/usecases/get_post.dart';
import 'package:r34_02/features/posts/domain/usecases/update_post.dart';

class PostConsoleService with MapFailurMessages {
  final GetAllPost getAllPostsUseCase;
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
    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      posts,
    ) {
      if (posts.isEmpty) {
        print("No Posts till now");
      } else {
        print("\n===== POSTS ====");
        for (final post in posts) {
          print("ID: ${post.id}");
          print("Title: ${post.title}");
          print("Text: ${post.text}");
          print("Likes: ${post.numOfLikes}");
          print("------");
        }
      }
    });
  }

  void displayPost(String id) {
    final result = getPostUseCase(GetPostParam(id: id));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      post,
    ) {
      print("ID: ${post.id}");
      print("Title: ${post.title}");
      print("Text: ${post.text}");
      print("Likes: ${post.numOfLikes}");
      print("------");
    });
  }

  void createPost(String title, String text, int numOfLikes) {
    final post = Post(id: '', title: title, text: text, numOfLikes: numOfLikes);
    final result = createPostUseCase(CreatePostParam(post: post));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      newPost,
    ) {
      print("\nPost is created successfully with details :\n");

      print("ID: ${newPost.id}");
      print("Title: ${newPost.title}");
      print("Text: ${newPost.text}");
      print("Likes: ${newPost.numOfLikes}");
    });
  }

  void updatePost(
    String id,
    String newTitle,
    String newText,
    int newNumOfLikes,
  ) {
    final post = Post(
      id: id,
      title: newTitle,
      text: newText,
      numOfLikes: newNumOfLikes,
    );
    final result = updatePostUseCase(UpdatePostParam(post: post));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      newPost,
    ) {
      print("\nPost is updated successfully with details :\n");

      print("ID: ${newPost.id}");
      print("Title: ${newPost.title}");
      print("Text: ${newPost.text}");
      print("Likes: ${newPost.numOfLikes}");
    });
  }

  void deletePost(String id) {
    final result = deletePostUseCase(DeletePostParam(id: id));
    result.fold(
      (failure) => print("Error is ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "Post is deleted successfully"
            : "Post with id $id was not found",
      ),
    );
  }
}
