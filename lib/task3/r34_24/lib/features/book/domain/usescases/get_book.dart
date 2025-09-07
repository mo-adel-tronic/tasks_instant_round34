import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import '../repositories/book_repo.dart';

class GetBook {
  final BookRepos repository;

  GetBook(this.repository);

  Either<Failure, Book> call(String id) {
    return repository.getBook(id);
  }
}