import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/post/domain/repositories/post_repos.dart';
import '../entites/post.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Either<Failure, Post> call(Post post) {
    return repository.addPost(post);
  }
}

class CreatePostParams extends Equatable {
  final Post post;

  const CreatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}
