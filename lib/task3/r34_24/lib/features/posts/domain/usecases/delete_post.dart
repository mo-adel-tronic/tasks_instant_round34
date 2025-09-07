import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../repositories/post_repos.dart';

class DeletePost {
  final PostRepository repository;

  DeletePost(this.repository);

  Either<Failure, bool> call(String id) {
    return repository.deletePost(id);
  }
}

class DeletePostParams extends Equatable {
  final String id;

  const DeletePostParams({required this.id});

  @override
  List<Object?> get props => [id];
}