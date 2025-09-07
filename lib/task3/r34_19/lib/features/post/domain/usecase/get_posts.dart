import '../repository/post_repository.dart';
import '../entity/post.dart';
class GetPosts {
  final PostRepository repository;
  GetPosts(this.repository);
  Future<List<Post>> call() async => repository.getPosts();
}
