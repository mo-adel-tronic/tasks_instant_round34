// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class CreatePost {
  final PostRepository repository;
  CreatePost(this.repository);
  Either<Failure, Post> call(CreatePostParam params) {
    return repository.createPost(params.post);
  }
}

//create class for parameters that will sent to create Post(to edit in it in any time) (some type of isolation)

class CreatePostParam extends Equatable {
  final Post post;
  const CreatePostParam({required this.post});

  @override
  List<Object?> get props => [post];
}
