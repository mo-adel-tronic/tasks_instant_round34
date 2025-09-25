import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import 'package:dartz/dartz.dart';
abstract class BookRepos {
  Future<Either<Failure, List<Book>>> getAllBooks();
  Future<Either<Failure, Book>> getBook(String id);
  Future<Either<Failure, Book>> CreateBook(Book book);
  Future<Either<Failure, Book>> updateBook(Book book);
  Future<Either<Failure, bool>> deleteBook(String id);


}