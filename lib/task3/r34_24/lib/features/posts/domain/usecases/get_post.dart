import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/post.dart';
import '../repositories/post_repos.dart';

class GetBook {
  final PostRepository repository;

  GetBook(this.repository);

  Either<Failure, Post> call(String id) {
    return repository.getPost(id);
  }
}