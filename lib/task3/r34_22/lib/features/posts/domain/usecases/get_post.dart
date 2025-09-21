

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

class GetPost {
  final PostRepository repository;

  GetPost(this.repository);

  Either<Failure, List<Product>> call(GetPostParams params) {
    return repository.getAllPosts();
  }
}

class GetPostParams extends Equatable {
  final String id;

  const GetPostParams({required this.id});

  @override
  List<Object?> get props => [id];  
}