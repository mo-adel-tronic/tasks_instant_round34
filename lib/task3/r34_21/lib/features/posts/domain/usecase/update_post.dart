import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';

class Updatepost {
  final PostRepository repository;

  Updatepost(this.repository);

  Either<Failure, Post> call(UpdatepostParams params) {
    return repository.updatepost(params.post);
  }
}

class UpdatepostParams extends Equatable {
  final Post post;

  const UpdatepostParams({required this.post});

  @override
  List<Object?> get props => [post];
}