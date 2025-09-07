import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_21/core/error/failures.dart';
import 'package:r34_21/features/posts/domain/entities/posts.dart';
import 'package:r34_21/features/posts/domain/repositories/posts_repository.dart';


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
  List<Object?> get props => [post];
}