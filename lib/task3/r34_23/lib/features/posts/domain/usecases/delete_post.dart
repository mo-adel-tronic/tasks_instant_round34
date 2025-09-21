import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);

  Either<Failure, bool> call(Deletepostparams prams) {
    return repository.deletePost(prams.id);
  }
}
class Deletepostparams extends Equatable{
  final String id;
  Deletepostparams(this.id);
  @override
  List<Object?> get props=>[id];
}