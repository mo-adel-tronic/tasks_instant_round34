import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';

class CreatePost {
  final PostRepository repo;

  CreatePost(this.repo);
  Either<Failure, Post> call(CreatePostParams params) {
    return repo.createPost(params.post);
  }
}

class CreatePostParams extends Equatable {
  final Post post;

  const CreatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}
