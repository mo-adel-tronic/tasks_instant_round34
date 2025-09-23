import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeletePost {
  final PostRepository repository;

  DeletePost(this.repository);

  Either<Failure, bool> call(DeletePostParams params) {
    return repository.deletePost(params.id);
  }
}

class DeletePostParams extends Equatable {
  final String id;

  const DeletePostParams({required this.id});

  @override
  List<Object?> get props => [id];
}