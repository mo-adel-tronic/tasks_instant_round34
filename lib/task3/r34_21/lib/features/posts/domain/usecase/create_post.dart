import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';


class Createpost {
  final PostRepository repository;

  Createpost(this.repository);

  Either<Failure, Post> call(CreatepostParams params) {
    return repository.createpost(params.post);
  }
}

class CreatepostParams extends Equatable {
  final Post post;

  const CreatepostParams({required this.post});

  @override
  List<Object?> get props => [post];
}