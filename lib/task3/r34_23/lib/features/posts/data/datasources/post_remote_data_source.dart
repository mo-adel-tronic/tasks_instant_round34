import 'package:r34_23/core/error/exceptions.dart';
import 'package:r34_23/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel post);
  PostModel updatePost(PostModel post);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
    const PostModel( id: "1", title: "Post1", content: "This is the first post",  ),
    const PostModel( id: "2",  title: "Post2",  content: "This is the second post",),
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
      throw Serverexception();
    }
  }

  @override
  PostModel createPost(PostModel post) {
    final newPost =
        post.copywith(id: DateTime.now().millisecondsSinceEpoch.toString());
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
      throw Serverexception();
    }
  }

  @override
  bool deletePost(String id) {
    final initialLength = _posts.length;
    _posts.removeWhere((post) => post.id == id);
    return _posts.length < initialLength;
  }
}