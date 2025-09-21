import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';
import '../entites/book.dart';

class UpdateBook {
  final BookRepos repository;

  UpdateBook(this.repository);

  Either<Failure, Book> call(UptadeBookParams params) {
    return repository.updateBook(params.book);
  }
}
class UptadeBookParams extends Equatable{
  final Book book;
  const UptadeBookParams({required this.book});
  @override
  List <Object?>get props =>[book];
  }