import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';

class Deletepost {
  final PostRepository repository;

  Deletepost(this.repository);

  Either<Failure, bool> call(DeletepostParams params) {
    return repository.deletepost(params.id);
  }
}

class  DeletepostParams extends Equatable {
  final String id;

  const DeletepostParams({required this.id});

  @override
  List<Object?> get props => [id];
}