import '../entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';

abstract class BookRepository {
  Either<Failure, List<Book>> getAllBooks();
  Either<Failure, Book> getBook(String id);
  Either<Failure, Book> createBook(Book book);
  Either<Failure, Book> updateBook(Book book);
  Either<Failure, bool> deleteBook(String id);
}
