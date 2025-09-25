import 'dart:async';
import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/usecase/create_post.dart';
import 'package:r34_01/features/post/domain/usecase/delete_post.dart';
import 'package:r34_01/features/post/domain/usecase/get_all_posts.dart';
import 'package:r34_01/features/post/domain/usecase/get_post.dart';
import 'package:r34_01/features/post/domain/usecase/update_post.dart';
import 'package:r34_01/core/error/messages.dart';

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
    final posts = await getAllPostsUseCase();
    _setLoading(false);
    posts.fold((failuer) => print('Error: ${mapFailureMessages(failuer)}'), (
      posts,
    ) {
      if (posts.isEmpty) {
        print('No posts found.');
      } else {
        print('\n== POSTS ===');
      }
      for (final post in posts) {
        print('Post ID: ${post.id}');
        print('title: ${post.title}');
        print('Body: ${post.body}');
      }
    });
  }

  Future<void> displayPost(String id) async {
    _setLoading(true);
    final result = await getPostUseCase(GetPostParams(id: id));
    _setLoading(false);
    result.fold((failuer) => print('Error: ${mapFailureMessages(failuer)}'), (
      post,
    ) {
      print('\n== POST DETAILS ===');
      print('ID: ${post.id}');
      print('title: ${post.title}');
      print('Body: ${post.body}');
    });
  }

  Future<void> createPost(String title, String body) async {
    final post = Post(id: '', title: title, body: body);
    _setLoading(true);
    final result = await createPostUseCase(CreatePostParams(post: post));
    _setLoading(false);
    result.fold(
      (failuer) => print('Error: ${mapFailureMessages(failuer)}'),
      (newPost) => print('Post created successfully with ID: ${newPost.id}'),
    );
  }

  Future<void> updatePost(String id, String title, String body) async {
    final post = Post(id: id, title: title, body: body);
    _setLoading(true);
    final result = await updatePostUseCase(UpdatePostParams(post: post));
    _setLoading(false);
    result.fold(
      (failuer) => print('Error: ${mapFailureMessages(failuer)}'),
      (updatedPost) => print('Post updated successfully'),
    );
  }

  Future<void> deletePost(String id) async {
    _setLoading(true);
    final result = await deletePostUseCase(DeletePostParams(id: id));
    _setLoading(false);
    result.fold(
      (failuer) => print('Error: ${mapFailureMessages(failuer)}'),
      (success) =>
          print(success ? 'Post deleted successfully' : 'Post not found'),
    );
  }
}
