import '../model/post_model.dart';
import '../sources/post_local_source.dart';
class PostLocalSourceImpl implements PostLocalSource {
  final List<PostModel> _store = [];
  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    _store.clear();
    _store.addAll(posts);
  }
  @override
  Future<List<PostModel>> getCachedPosts() async => _store;
}
