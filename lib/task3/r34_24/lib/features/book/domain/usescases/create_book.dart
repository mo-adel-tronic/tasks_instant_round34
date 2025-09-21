import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';
import '../entites/book.dart';

class CreateBook {
  final BookRepos repository;

  CreateBook(this.repository);

  Either<Failure, Book> call(CreateBookparams params) {
    return repository.CreateBook(params.book);
  }
}
class CreateBookparams extends Equatable{
  final Book book;
  const CreateBookparams({required this.book});
  @override
  List <Object?>get props =>[book];
  }