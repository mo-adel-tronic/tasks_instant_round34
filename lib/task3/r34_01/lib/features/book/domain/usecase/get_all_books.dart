import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';
import '../entity/book_entity.dart';
import '../repository/book_repository.dart';

class GetAllBooks {
  final BookRepository repo;
  GetAllBooks(this.repo);

  Either<Failure, List<Book>> call() {
    return repo.getAllBooks();
  }
}
