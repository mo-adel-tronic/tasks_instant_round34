import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/features/post/data/model/post_model.dart';

abstract class PostRemoteDataSource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
     PostModel(
      name: 'Post 1',
      id: '1',
      description: 'description 1',
      price: 10.0,
    ),
     PostModel(
      name: 'Post 2',
      id: '2',
      description: 'description 2',
      price: 20.0,
    ),
  ];

  @override
  List<PostModel> getAllPosts() {
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
  PostModel createPost(PostModel post) {
    final newPost = post.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _posts.add(newPost);
    return newPost;
  }

  @override
  bool deletePost(String id) {
    final initialLength = _posts.length;
    _posts.removeWhere((post) => post.id == id);
    return _posts.length < initialLength;
  }
}
