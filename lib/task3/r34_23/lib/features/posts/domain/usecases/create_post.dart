import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/entities/post.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;
  CreatePost(this.repository);

  Either<Failure, Post> call(CreatePostParams params) {
    return repository.createPost(params.post);
  }
}

class CreatePostParams extends Equatable {
  final Post post;
  const CreatePostParams(this.post);

  @override
  List<Object?> get props => [post];
}