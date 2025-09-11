import 'package:r34_12/core/error/exceptions.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
    const PostModel(id: '1', title: 'Post 1', description: 'Description 1'),
    const PostModel(id: '2', title: 'Post 2', description: 'Description 2'),
  ];

  @override
  PostModel createPost(PostModel post) {
    final newPost = post.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
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