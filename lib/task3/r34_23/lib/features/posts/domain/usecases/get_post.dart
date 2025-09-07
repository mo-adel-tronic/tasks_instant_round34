import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/entities/post.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;
  GetPost(this.repository);

  Either<Failure, Post> call(GetPostParams params) {
    return repository.getPost(params.id);
  }
}

class GetPostParams extends Equatable {
  final String id;
  const GetPostParams(this.id);

  @override
  List<Object?> get props => [id];
}