import '../model/post_model.dart';
abstract class PostLocalSource {
  Future<List<PostModel>> getCachedPosts();
  Future<void> cachePosts(List<PostModel> posts);
}
