import 'dart:async';
import 'package:r34_24/core/error/messages.dart';
import 'package:r34_24/features/posts/domain/entites/post.dart';
import 'package:r34_24/features/posts/domain/usecases/create_post.dart';
import 'package:r34_24/features/posts/domain/usecases/delete_post.dart';
import 'package:r34_24/features/posts/domain/usecases/get_all_posts.dart';
import 'package:r34_24/features/posts/domain/usecases/get_post.dart';
import 'package:r34_24/features/posts/domain/usecases/uptade_post.dart';


class PostConsoleService with MapFailureMessages {
  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream => _loadingController.stream;

  void _setLoading(bool v) => _loadingController.add(v);

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

  void dispose() {
    _loadingController.close();
  }

  Future<void> displayAllPosts() async {
    _setLoading(true);
    final result = await getAllPostsUseCase();
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (posts) {
        if (posts.isEmpty) {
          print('No posts found.');
        } else {
          print("\n====== All Posts ======");
          for (final post in posts) {
            print('ID: ${post.id}');
            print('Title: ${post.title}');
            print('Content: ${post.content}');
            print('Publisher ID: ${post.publisherId}');
            print('--------------------');
          }
        }
      },
    );
  }

  Future<void> displayPost(String id) async {
    _setLoading(true);
    final result = await getPostUseCase(GetPostParams(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (post) {
        print("\n====== Post Details ======");
        print('ID: ${post.id}');
        print('Title: ${post.title}');
        print('Content: ${post.content}');
        print('Publisher ID: ${post.publisherId}');
      },
    );
  }

  Future<void> createPost(String title, String content, String publisherId) async {
    final post = Post(
      id: '', // ID ignored
      title: title,
      content: content,
      publisherId: publisherId,
    );

    _setLoading(true);
    final result = await createPostUseCase(CreatePostParams(post: post));
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  Future<void> updatePost(String id, String title, String content, String publisherId) async {
    final post = Post(
      id: id,
      title: title,
      content: content,
      publisherId: publisherId,
    );

    _setLoading(true);
    final result = await updatePostUseCase(UpdatePostParams(post: post));
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (_) => print('Post updated successfully'),
    );
  }

  Future<void> deletePost(String id) async {
    _setLoading(true);
    final result = await deletePostUseCase(DeletePostParams(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) => print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}
