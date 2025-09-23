import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import '../repositories/book_repo.dart';

class GetBook {
  final BookRepos repository;

  GetBook(this.repository);

  Either<Failure, Book> call(GetBookParams params) {
    return repository.getBook(params.id);
  }
}
  class GetBookParams extends Equatable{
    final String id;
    const GetBookParams({required this.id});
    @override
    List<Object?> get props =>[id];
  
}