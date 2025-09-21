import 'package:r34_16/core/error/failures.dart';
import 'package:r34_16/features/posts/domain/entities/post.dart';
import 'package:r34_16/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPost {
  final PostRepository repository;

  GetPost(this.repository);

  Either<Failure, Post> call(GetPostParams params) {
    return repository.getPost(params.id);
  }
}

class GetPostParams extends Equatable {
  final String id;

  const GetPostParams({required this.id});

  @override
  List<Object> get props => [id];
}