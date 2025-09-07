import '../entity/post.dart';
abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPostById(String id);
}
