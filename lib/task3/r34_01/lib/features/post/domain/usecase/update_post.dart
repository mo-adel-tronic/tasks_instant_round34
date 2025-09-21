import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';

class UpdatePost {
  final PostRepository repo;

  UpdatePost(this.repo);
  Either<Failure, Post> call(UpdatePostParams params) {
    return repo.updatePost(params.post);
  }
}

class UpdatePostParams extends Equatable {
  final Post post;

  const UpdatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}
