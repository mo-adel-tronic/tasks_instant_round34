import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';

class DeleteBook {
  final BookRepository repo;
  DeleteBook(this.repo);

  Either<Failure, bool> call(DeleteBookParams params) {
    return repo.deleteBook(params.id);
  }
}

class DeleteBookParams extends Equatable {
  final String id;

  const DeleteBookParams({required this.id});

  @override
  List<Object?> get props => [id];
}
