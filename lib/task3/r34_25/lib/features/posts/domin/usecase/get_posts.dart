import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';

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
  List<Object?> get props => [id];
}
