
import 'dart:async';

import 'package:r34_24/core/error/messages.dart';
import 'package:r34_24/features/book/domain/entites/book.dart';
import 'package:r34_24/features/book/domain/usescases/create_book.dart';
import 'package:r34_24/features/book/domain/usescases/delete_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_all_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_book.dart';
import 'package:r34_24/features/book/domain/usescases/uptade_book.dart';

class BookConsoleService with MapFailureMessages {
  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream => _loadingController.stream;

  void _setloading(bool v) => _loadingController.add(v);

  final GetAllBooks getAllBooksUseCase;
  final GetBook getBookUseCase;
  final CreateBook createBookUseCase;
  final UpdateBook updateBookUseCase;
  final DeleteBook deleteBookUseCase;

  BookConsoleService({
    required this.getAllBooksUseCase,
    required this.getBookUseCase,
    required this.createBookUseCase,
    required this.updateBookUseCase,
    required this.deleteBookUseCase,
  });

  void dispose(){
    _loadingController.close();
  }

  Future<void> displayAllBooks() async {
    _setloading(true);
    final result = await getAllBooksUseCase();
    _setloading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (books) {
        if (books.isEmpty) {
          print('No books found.');
        } else {
          print("\n====== All Books ======");
          for (final book in books) {
            print('ID: ${book.id}');
            print('Title: ${book.title}');
            print('Author: ${book.author}');
            print('Release date: ${book.releaseDtae}');
            print('--------------------');
          }
        }
      },
    );
  }

  Future<void> displayBook(String id) async{
        _setloading(true);
    final result = await getBookUseCase(GetBookParams(id: id));
        _setloading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (book) {
        print("\n====== Book Details ======");
        print('ID: ${book.id}');
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Release date: ${book.releaseDtae}');
      },
    );
  }

  Future<void> createBook(String title, String author, int releaseDate) async{
    final book = Book(
      id: '',
      title: title,
      author: author,
      releaseDtae: releaseDate,
    );
        _setloading(true);
    final result = await createBookUseCase(CreateBookParams(book: book));
        _setloading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newBook) => print('Book created successfully with ID: ${newBook.id}'),
    );
  }

  Future <void> updateBook(String id,String title, String author, int releaseDate) async{
    final book = Book(
      id: id,
      title: title,
      author: author,
      releaseDtae: releaseDate,
    );
        _setloading(true);

    final result = await updateBookUseCase(UpdateBookParams(book: book));
        _setloading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (_) => print('Book updated successfully'),
    );
  }

  Future<void> deleteBook(String id) async{
        _setloading(true);

    final result = await deleteBookUseCase(DeleteBookParams(id: id));
        _setloading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) =>
          print(success ? 'Book deleted successfully' : 'Book not found'),
    );
  }
}
