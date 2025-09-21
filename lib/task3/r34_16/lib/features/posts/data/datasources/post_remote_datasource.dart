import 'package:r34_16/core/error/exceptions.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
    const PostModel(id: '1', title: 'First Post', content: 'This is the content of the first post.'),
    const PostModel(id: '2', title: 'Second Post', content: 'This is the content of the second post.'),
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