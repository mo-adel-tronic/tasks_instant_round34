import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/post.dart';
import '../repositories/post_repos.dart';

class GetAllBooks {
  final PostRepository repository;

  GetAllBooks(this.repository);

  Either<Failure, List<Post>> call() {
    return repository.getAllPosts();
  }
}