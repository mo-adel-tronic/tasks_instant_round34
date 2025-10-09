import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/posts/domain/entities/post.dart';
import 'package:task4/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Future<Either<Failure, Post>> call(CreatePostParams params) async {
    return await repository.createPost(params.post);
  }
}

class CreatePostParams extends Equatable {
  final Post post;

  const CreatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}
