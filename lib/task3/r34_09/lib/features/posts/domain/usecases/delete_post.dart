import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);
  Future<Either<Failure, Post>> call(DeletePostparams params) {
    return repository.deletePost(params.id);
  }
}

class DeletePostparams extends Equatable{
  final String id;
    const DeletePostparams({required this.id});
  @override
  List<Object?> get props => [id];
}
