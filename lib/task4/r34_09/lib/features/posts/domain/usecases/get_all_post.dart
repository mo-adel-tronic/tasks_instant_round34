import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';

class GetAllPost {
  final PostRepository repository;
  GetAllPost(this.repository);
     Future<Either<Failure, List<Post>>> call() {
    return repository.getAllPost();
  }
}
