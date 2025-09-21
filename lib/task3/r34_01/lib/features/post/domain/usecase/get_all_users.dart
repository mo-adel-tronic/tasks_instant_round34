import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';
import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class GetAllPosts {
  final PostRepository repo;
  GetAllPosts(this.repo);

  Either<Failure, List<Post>> call() {
    return repo.getAllPosts();
  }
}
