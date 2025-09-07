import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/book/domain/entity/book_entity.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';

class UpdateBook {
  final BookRepository repo;

  UpdateBook(this.repo);
  Either<Failure, Book> call(UpdateBookParams params) {
    return repo.updateBook(params.book);
  }
}

class UpdateBookParams extends Equatable {
  final Book book;

  const UpdateBookParams({required this.book});

  @override
  List<Object?> get props => [book];
}
