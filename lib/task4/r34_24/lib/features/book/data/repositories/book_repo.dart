import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/book/data/datasources/book_remote_datasource.dart';
import 'package:r34_24/features/book/data/models/book_model.dart';
import 'package:r34_24/features/book/domain/entites/book.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';


class BookRepositoryIMPL implements BookRepos {
  final BookRemoteDatasource remoteDatasource;

  BookRepositoryIMPL({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Book>>> getAllBooks() async {
    try {
      final remoteBooks = await remoteDatasource.getAllBooks();
      return Right(remoteBooks);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Book>> getBook(String id) async {
    try {
      final remoteBook = await remoteDatasource.getBook(id);
      return Right(remoteBook);
    } on ServerException {
      return Left(ServerFailure());

    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Book>> CreateBook(Book book) async {
    try {
      final bookModel = BookModel(
        id: book.id,
        title: book.title,
        author: book.author,
        releaseDtae: book.releaseDtae,
      );
      final newBook = await remoteDatasource.CreateBook(bookModel);
      return Right(newBook);
    } on ServerException {
      return Left(ServerFailure());
  
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Book>> updateBook(Book book) async {
    try {
      final bookModel = BookModel(
        id: book.id,
        title: book.title,
        author: book.author,
        releaseDtae: book.releaseDtae,
      );
      final updatedBook = await remoteDatasource.UpdateBook(bookModel);
      return Right(updatedBook);
    } on ServerException {
      return Left(ServerFailure());
  
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBook(String id) async {
    try {
      final result = await remoteDatasource.DeleteBook(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}