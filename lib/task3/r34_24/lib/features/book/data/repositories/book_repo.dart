import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/book/data/datasources/book_remote_datasource.dart';
import 'package:r34_24/features/book/data/models/book_model.dart';
import 'package:r34_24/features/book/domain/entites/book.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';


class BookRepositoryIMPL implements BookRepos{
  final BookRemoteDatasource remoteDatasource;
  BookRepositoryIMPL({required this.remoteDatasource});
  @override
  Either<Failure, List<Book>> getAllBooks() {
    try{
      final remoteBook = remoteDatasource.getAllBooks();
      return Right(remoteBook);
    }on ServerException{
      return Left(ServerFailure());
    }
  }
  @override
  Either<Failure, Book> getBook(String id) {
   try {
      final remoteBook = remoteDatasource.getBook(id);
      return Right(remoteBook);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  @override
  Either<Failure, Book> CreateBook(Book book) {
    try {
      final bookModel = BookModel(
        id: book.id,
        title: book.title,
        author: book.author,
        releaseDtae: book.releaseDtae,
      );

      final newBook = remoteDatasource.CreateBook(bookModel);
      return Right(newBook);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Book> updateBook(Book book) {
    try {
      final bookModel = BookModel(
        id: book.id,
        title: book.title,
        author: book.author,
        releaseDtae: book.releaseDtae,
      );

      final updatedBook = remoteDatasource.UpdateBook(bookModel);
      return Right(updatedBook);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteBook(String id) {
    try {
      final result = remoteDatasource.DeleteBook(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
