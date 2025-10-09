import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../repositories/book_repo.dart';

class DeleteBook {
  final BookRepos repository;

  DeleteBook(this.repository);

  Future<Either<Failure, bool>> call(DeleteBookParams params) async {
    return await repository.deleteBook(params.id);
  }
}

class DeleteBookParams extends Equatable {
  final String id;
  const DeleteBookParams({required this.id});

  @override
  List<Object?> get props => [id];
}