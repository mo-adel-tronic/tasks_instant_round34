// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository repository;
  DeletePost(this.repository);
  Either<Failure, bool> call(DeletePostParam params) {
    return repository.deletePost(params.id);
  }
}

//create class for parameters that will sent to delete Post(to edit in it in any time) (some type of isolation)
/*
If I want to delete with email
I will send email in params object and change DeletePostParam class ,  deletePost  method and repository
 */
class DeletePostParam extends Equatable {
  final String id;
  const DeletePostParam({required this.id});

  @override
  List<Object?> get props => [id];
}
