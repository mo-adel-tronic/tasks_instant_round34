import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';

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
