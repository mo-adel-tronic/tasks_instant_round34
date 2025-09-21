import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdatePost {
  final PostRepository repository;

  UpdatePost(this.repository);

  Either<Failure, Post> call(UpdatePostParams params) {
    return repository.updatePost(params.post);
  }
}

class UpdatePostParams extends Equatable {
  final Post post;

  const UpdatePostParams({required this.post});

  @override
  List<Object> get props => [post];
}