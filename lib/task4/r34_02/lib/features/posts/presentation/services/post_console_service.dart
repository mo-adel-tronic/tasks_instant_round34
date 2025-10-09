import 'dart:async';
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

  // 🔹 Loading state stream
  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream => _loadingController.stream;

  void _setLoading(bool v) => _loadingController.add(v);

  Future<void> displayAllPosts() async {
    _setLoading(true);
    final result = await getAllPostsUseCase();
    _setLoading(false);

    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      posts,
    ) {
      if (posts.isEmpty) {
        print("⚠️ No posts found.");
      } else {
        print("\n===== POSTS =====");
        for (final post in posts) {
          print("ID: ${post.id}");
          print("Title: ${post.title}");
          print("Body: ${post.body}");
          print("Views: ${post.views}");
          print("Tags: ${post.tags.join(', ')}");
          print("User ID: ${post.userId}");
          print("------");
        }
      }
    });
  }

  Future<void> displayPost(String id) async {
    _setLoading(true);
    final result = await getPostUseCase(GetPostParam(id: id));
    _setLoading(false);

    result.fold(
      (failure) {
        print("❌ Error: ${mapFailurToMssage(failure)}");
      },
      (post) {
        print("\n===== POST DETAILS =====");
        print("ID: ${post.id}");
        print("Title: ${post.title}");
        print("Body: ${post.body}");
        print("Views: ${post.views}");
        print("Tags: ${post.tags.join(', ')}");
        print("User ID: ${post.userId}");
        print("------");
      },
    );
  }

  Future<void> createPost(
    String title,
    String body,
    int views,
    List<String> tags,
    int userId,
  ) async {
    _setLoading(true);
    final post = Post(
      id: '',
      title: title,
      body: body,
      views: views,
      tags: tags,
      userId: userId,
    );
    final result = await createPostUseCase(CreatePostParam(post: post));
    _setLoading(false);

    result.fold(
      (failure) {
        print("❌ Error: ${mapFailurToMssage(failure)}");
      },
      (newPost) {
        print("\n✅ Post created successfully:");
        print("ID: ${newPost.id}");
        print("Title: ${newPost.title}");
        print("Body: ${newPost.body}");
        //print("Views: ${newPost.views}");
        print("Tags: ${newPost.tags.join(', ')}");
        print("User ID: ${newPost.userId}");
      },
    );
  }

  Future<void> updatePost(
    String id,
    String title,
    String body,
    int views,
    List<String> tags,
    int userId,
  ) async {
    _setLoading(true);
    final post = Post(
      id: id,
      title: title,
      body: body,
      views: views,
      tags: tags,
      userId: userId,
    );
    final result = await updatePostUseCase(UpdatePostParam(post: post));
    _setLoading(false);

    result.fold(
      (failure) {
        print("❌ Error: ${mapFailurToMssage(failure)}");
      },
      (updatedPost) {
        print("\n✅ Post updated successfully:");
        print("ID: ${updatedPost.id}");
        print("Title: ${updatedPost.title}");
        print("Body: ${updatedPost.body}");
        //print("Views: ${updatedPost.views}");
        print("Tags: ${updatedPost.tags.join(', ')}");
        print("User ID: ${updatedPost.userId}");
      },
    );
  }

  Future<void> deletePost(String id) async {
    _setLoading(true);
    final result = await deletePostUseCase(DeletePostParam(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print("❌ Error: ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "✅ Post deleted successfully"
            : "⚠️ Post with id $id not found",
      ),
    );
  }

  // 🔹 Dispose
  void dispose() {
    _loadingController.close();
  }
}
