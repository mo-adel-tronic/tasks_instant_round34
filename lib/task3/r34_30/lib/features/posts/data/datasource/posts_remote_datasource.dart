import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/posts/data/models/posts_model.dart';

abstract class PostsRemoteDataSource {
  List<PostModel> getAllPost();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final List<PostModel> _posts = [
    PostModel(id: '1', name: 'First Post', body: 'This is the body of the first post'),
    PostModel(id: '2', name: 'Second Post', body: 'This is the body of the second post'),
  ];
  

  @override
  List<PostModel> getAllPost() {
    return _posts;
  }

  @override
  PostModel getPost(String id) {
    try {
      return _posts.firstWhere((post) => post.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  PostModel createPost(PostModel post) {
    final newPost = post.copyWith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _posts.add(newPost);
    return newPost;
  }

  @override
  PostModel updatePost(PostModel post) {
    final index = _posts.indexWhere((p) => p.id == post.id);
    if (index != -1) {
      _posts[index] = post;
      return post;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deletePost(String id) {
    final initialLength = _posts.length;
    _posts.removeWhere((post) => post.id == id);
    return _posts.length < initialLength;
  }
}