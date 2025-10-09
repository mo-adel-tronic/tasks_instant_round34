import 'package:dartz/dartz.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/posts/domain/entities/post.dart';
import 'package:task4/features/posts/domain/repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
