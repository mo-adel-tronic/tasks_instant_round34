import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/post.dart';
import '../repositories/post_repos.dart';

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
