import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/book/domain/repositories/book_repo.dart';
import '../entites/book.dart';

class CreateBook {
  final BookRepos repository;

  CreateBook(this.repository);

  Future<Either<Failure, Book>> call(CreateBookParams params) async {
    return await repository.CreateBook(params.book);
  }
}

class CreateBookParams extends Equatable {
  final Book book;
  const CreateBookParams({required this.book});

  @override
  List<Object?> get props => [book];
}