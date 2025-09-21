import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import '../repositories/book_repo.dart';

class GetAllBooks {
  final BookRepos repository;

  GetAllBooks(this.repository);

  Either<Failure, List<Book>> call() {
    return repository.getAllBooks();
  }
}