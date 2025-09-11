import 'package:task7/core/error/exceptions.dart';
import 'package:task7/features/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  List<PostModel> getAllPost();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  PostModel deletePost(String id);
}
//test
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final List<PostModel> _post = [
    PostModel(
        id: '1',
        title: 'title',
        content: 'content',
        createAt: DateTime.fromMillisecondsSinceEpoch(1731016000000)),
    PostModel(
        id: '2',
        title: 'title',
        content: 'content',
        createAt: DateTime.fromMillisecondsSinceEpoch(1631015000000)),
  ];
  @override
  PostModel createPost(PostModel post) {
    final newpost =
        post.copywith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _post.add(newpost);
    return newpost;
  }

  @override
  PostModel deletePost(String id) {
    try {
      final post = _post.firstWhere((p) => p.id == id);
      _post.remove(post);
      return post;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  List<PostModel> getAllPost() {
    return _post;
  }

  @override
  PostModel getPost(String id) {
    try {
      return _post.firstWhere((p) => p.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  PostModel updatePost(PostModel post) {
    final index = _post.indexWhere((p) => p.id == post.id);
    if (index != -1) {
      _post[index] = post;
      return post;
    } else {
      throw ServerException();
    }
  }
}
