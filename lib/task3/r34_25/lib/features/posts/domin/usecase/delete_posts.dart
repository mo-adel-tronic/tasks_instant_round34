import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';

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

