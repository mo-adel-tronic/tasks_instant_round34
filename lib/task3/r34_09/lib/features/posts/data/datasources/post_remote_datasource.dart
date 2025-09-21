import 'package:task7/core/error/exceptions.dart';
import 'package:task7/features/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  List<PostModel> getAllPost();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}
//test
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final List<PostModel> _post = [
    PostModel(
        id: '1',
        title: 'cdscds',
        content: 'content',
        createAt: 141),
    PostModel(
        id: '2',
        title: 'title',
        content: 'content',
        createAt: 291298),
  ];
  @override
  PostModel createPost(PostModel post) {
    final newpost =
        post.copywith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _post.add(newpost);
    return newpost;
  }

  @override
  bool deletePost(String id) {
        final initialLingth = _post.length;
      _post.removeWhere((product)=>product.id ==id);
      return _post.length< initialLingth;
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
