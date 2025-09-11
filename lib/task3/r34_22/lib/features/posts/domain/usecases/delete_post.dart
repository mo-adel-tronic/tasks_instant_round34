import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);
  Either<Failure, Product> call(DeletePostparams params) {
    return repository.deletepost(params.id);
  }
}

class DeletePostparams extends Equatable{
  final String id;
    const DeletePostparams({required this.id});
  @override
  List<Object?> get props => [id];
}