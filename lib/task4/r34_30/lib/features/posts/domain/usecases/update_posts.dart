import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/posts/domain/entities/post.dart';
import 'package:task4/features/posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository repository;

  UpdatePost(this.repository);

  Future<Either<Failure, Post>> call(UpdatePostParams params) async {
    return await repository.updatePost(params.post);
  }
}

class UpdatePostParams extends Equatable {
  final Post post;

  const UpdatePostParams({required this.post});

  @override
  List<Object> get props => [post];
}
