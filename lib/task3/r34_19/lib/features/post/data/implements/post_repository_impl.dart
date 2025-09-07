import '../../domain/entity/post.dart';
import '../../domain/repository/post_repository.dart';
import '../model/post_model.dart';
import '../sources/post_local_source.dart';
class PostRepositoryImpl implements PostRepository {
  final PostLocalSource localSource;
  PostRepositoryImpl(this.localSource);
  @override
  Future<Post> getPostById(String id) async {
    final all = await localSource.getCachedPosts();
    return all.firstWhere((e) => e.id == id, orElse: () => PostModel(id: id, title: 'Unknown', body: ''));
  }
  @override
  Future<List<Post>> getPosts() async {
    final list = await localSource.getCachedPosts();
    if(list.isEmpty){
      final seed = [PostModel(id: '1', title: 'Hello', body: 'Post 1'), PostModel(id: '2', title: 'Second', body: 'Post 2')];
      await localSource.cachePosts(seed);
      return seed;
    }
    return list;
  }
}
