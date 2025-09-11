import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/entites/post.dart';
import 'package:r34_22/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

class UpdatePost {
  final PostRepository repository;

  UpdatePost(this.repository);

  Either<Failure, Product> call(UpdatePostParams params) {
    return repository.updatepost(params.post);
  }
}

class UpdatePostParams extends Equatable {
  final Post post;

  const UpdatePostParams({required this.post});

  @override
  List<Object?> get props => [post];
}