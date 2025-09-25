import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/book.dart';
import '../repositories/book_repo.dart';

class GetBook {
  final BookRepos repository;

  GetBook(this.repository);

  Future<Either<Failure, Book>> call(GetBookParams params) async {
    return await repository.getBook(params.id);
  }
}

class GetBookParams extends Equatable {
  final String id;
  const GetBookParams({required this.id});

  @override
  List<Object?> get props => [id];
}