import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;
  GetPost(this.repository);
  Either<Failure, Post> call(GetPostParam params) {
    return repository.getPost(params.id);
  }
}

//create class for parameters that will sent to get Post(to edit in it in any time) (some type of isolation)

class GetPostParam extends Equatable {
  final String id;
  const GetPostParam({required this.id});

  @override
  List<Object?> get props => [id];
}
