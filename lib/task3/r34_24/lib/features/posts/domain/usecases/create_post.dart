import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/posts/domain/repositories/post_repos.dart';
import '../entites/post.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Either<Failure, Post> call(CreatePostParams params) {
    return repository.createPost(params.post);
  }
}

class CreatePostParams extends Equatable {
  final Post post;

  const CreatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}