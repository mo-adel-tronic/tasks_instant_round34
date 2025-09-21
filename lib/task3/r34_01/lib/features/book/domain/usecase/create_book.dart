import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/book/domain/entity/book_entity.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';

class CreateBook {
  final BookRepository repo;

  CreateBook(this.repo);
  Either<Failure, Book> call(CreateBookParams params) {
    return repo.createBook(params.book);
  }
}

class CreateBookParams extends Equatable {
  final Book book;

  const CreateBookParams({required this.book});

  @override
  List<Object?> get props => [book];
}
