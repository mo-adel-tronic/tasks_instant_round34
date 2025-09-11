import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/entites/post.dart';
import 'package:r34_22/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

class CreatePost {
  final PostRepository repository;
  CreatePost(this.repository);
  Either<Failure, Product> call(createPostParams params) {
    return repository.createPost(params.post);
  }
}

class createPostParams extends Equatable {
  final Post post;
  const createPostParams({required this.post});
  List<Object?> get props => [post];
}
