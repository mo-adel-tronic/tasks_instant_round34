// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository repository;
  UpdatePost(this.repository);
  Either<Failure, Post> call(UpdatePostParam params) {
    return repository.updatePost(params.post);
  }
}

//Update class for parameters that will sent to Update Post(to edit in it in any time) (some type of isolation)

class UpdatePostParam extends Equatable {
  final Post post;
  const UpdatePostParam({required this.post});

  @override
  List<Object?> get props => [post];
}
