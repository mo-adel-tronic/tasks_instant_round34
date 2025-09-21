import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/book/data/model/book_model.dart';
import 'package:r34_01/features/book/data/sources/book_remote_datasource.dart';
import 'package:r34_01/features/book/domain/entity/book_entity.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';

class BookRepoImplment implements BookRepository {
  final BookRemoteDataSource remoteDatasource;
  BookRepoImplment({required this.remoteDatasource});

  @override
  Either<Failure, List<Book>> getAllBooks() {
    try {
      final remoteBooks = remoteDatasource.getAllBooks();
      return Right(remoteBooks);
    } on ServerException {
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
  Either<Failure, Book> createBook(Book book) {
    try {
      final bookModel = BookModel(
        name: book.name,
        id: book.id,
        description: book.description,
        price: book.price,
      );
      final newBook = remoteDatasource.createBook(bookModel);
      return Right(newBook);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Book> updateBook(Book book) {
    try {
      final bookModel = BookModel(
        name: book.name,
        id: book.id,
        description: book.description,
        price: book.price,
      );
      final updateBook = remoteDatasource.updateBook(bookModel);
      return Right(updateBook);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteBook(String id) {
    try {
      final result = remoteDatasource.deleteBook(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
