import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/book/domain/entity/book_entity.dart';
import 'package:r34_01/features/book/domain/repository/book_repository.dart';

class GetBook {
  final BookRepository repo;

  GetBook(this.repo);
  Either<Failure, Book> call(GetBookParams params) {
    return repo.getBook(params.id);
  }
}

class GetBookParams extends Equatable {
  final String id;
  const GetBookParams({required this.id});

  @override
  List<Object?> get props => [id];
}
