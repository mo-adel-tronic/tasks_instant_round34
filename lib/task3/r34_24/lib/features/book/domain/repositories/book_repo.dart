import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import 'package:dartz/dartz.dart';
abstract class BookRepos {
  Either<Failure,List<Book>> getAllBooks();
  Either<Failure,Book> getBook(String id);
  Either<Failure, Book> CreateBook(Book book);
  Either<Failure, Book> updateBook(Book book);
  Either<Failure, bool> deleteBook(String id);


}