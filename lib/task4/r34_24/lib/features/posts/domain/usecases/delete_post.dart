import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/posts/domain/repositories/post_repos.dart';

class DeletePost {
  final PostRepository repository;

  DeletePost(this.repository);

  Future<Either<Failure, bool>> call(DeletePostParams params) async {
    return await repository.deletePost(params.id);
  }
}

class DeletePostParams extends Equatable {
  final String id;

  const DeletePostParams({required this.id});

  @override
  List<Object?> get props => [id];
}