import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';

class DeletePost {
  final PostRepository repo;
  DeletePost(this.repo);

  Either<Failure, bool> call(DeletePostParams params) {
    return repo.deletePost(params.id);
  }
}

class DeletePostParams extends Equatable {
  final String id;

  const DeletePostParams({required this.id});

  @override
  List<Object?> get props => [id];
}
