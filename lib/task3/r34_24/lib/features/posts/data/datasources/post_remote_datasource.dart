import 'package:r34_24/core/error/exception.dart';
import '../models/post_model.dart';

abstract class PostRemoteDatasource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final List<PostModel> _posts = [
    const PostModel(id: '1', title: 'title 1', content: 'First post', publisherId: '1'),
    const PostModel(id: '2', title: 'title 2', content: 'second post', publisherId: '2'),
  ];

  @override
  List<PostModel> getAllPosts() => _posts;

  @override
  PostModel getPost(String id) {
    try {
      return _posts.firstWhere((post) => post.id == id);
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  PostModel createPost(PostModel post) {
    final newPost = post.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString());
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
