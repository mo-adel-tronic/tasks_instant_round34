import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);

  Either<Failure, bool> call(String id) {
    return repository.deletePost(id);
  }
}