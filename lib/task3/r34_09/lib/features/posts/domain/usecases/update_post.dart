import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository repository;
  UpdatePost(this.repository);
  Future<Either<Failure, Post>> call(UpdatePostparams params) {
    return repository.updatePost(  params.post);
  }
}

class UpdatePostparams extends Equatable {
   final Post post;

  const UpdatePostparams({ required this.post});
  @override
  List<Object?> get props => [id, post];
}
