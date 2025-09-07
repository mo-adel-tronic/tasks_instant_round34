import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';

class GetPost {
  final PostRepository repo;

  GetPost(this.repo);

  Either<Failure, Post> call(GetPostParams params) {
    return repo.getPost(params.id);
  }
}

class GetPostParams extends Equatable {
  final String id;

  const GetPostParams({required this.id});

  @override
  List<Object> get props => [id];
}
