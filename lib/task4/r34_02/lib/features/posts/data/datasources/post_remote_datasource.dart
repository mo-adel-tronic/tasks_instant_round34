import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  List<PostModel> getAllPosts();
  PostModel getPost(String id);
  PostModel createPost(PostModel model);
  PostModel updatePost(PostModel model);
  bool deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final List<PostModel> _posts = [
    PostModel(id: "1", title: "p1", numOfLikes: 20, text: "text1"),
    PostModel(id: "2", title: "p2", numOfLikes: 20, text: "text2"),
    PostModel(id: "3", title: "p3", numOfLikes: 20, text: "text3"),
    PostModel(id: "4", title: "p4", numOfLikes: 20, text: "text4"),
    PostModel(id: "5", title: "p5", numOfLikes: 20, text: "text5"),
  ];

  @override
  List<PostModel> getAllPosts() {
    return _posts;
  }

  @override
  PostModel getPost(String id) {
    try {
      return _posts.firstWhere((p) => p.id == id); //or use orElse
    } catch (e) {
      throw ServerException(); //Your exception
    }
  }

  @override
  PostModel createPost(PostModel model) {
    /*create new Post with data:
     newId = DateTime.now()..
     newnumOfLikes = model.numOfLikes
    */
    final PostModel newPost = model.copyWith(
      newId: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _posts.add(newPost);
    return newPost;
  }

  @override
  PostModel updatePost(PostModel model) {
    final int PostIndex = _posts.indexWhere((p) => p.id == model.id);
    if (PostIndex != -1) {
      _posts[PostIndex] = model; //update data
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deletePost(String id) {
    final oldLength = _posts.length;
    _posts.removeWhere((p) => id == p.id);
    return _posts.length < oldLength;
  }
}
