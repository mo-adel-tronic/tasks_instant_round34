
import 'package:r34_24/core/error/messages.dart';
import 'package:r34_24/features/book/domain/entites/book.dart';
import 'package:r34_24/features/book/domain/usescases/create_book.dart';
import 'package:r34_24/features/book/domain/usescases/delete_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_all_book.dart';
import 'package:r34_24/features/book/domain/usescases/get_book.dart';
import 'package:r34_24/features/book/domain/usescases/uptade_book.dart';

class BookConsoleService with MapFailureMessages {
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

  void displayAllBooks() {
    final result = getAllBooksUseCase();
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
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

  void displayBook(String id) {
    final result = getBookUseCase(GetBookParams(id: id));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (book) {
        print("\n====== Book Details ======");
        print('ID: ${book.id}');
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Release date: ${book.releaseDtae}');
      },
    );
  }

  void createBook(String title, String author, int releaseDate) {
    final book = Book(
      id: '',
      title: title,
      author: author,
      releaseDtae: releaseDate,
    );
    final result = createBookUseCase(CreateBookparams(book: book));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (newBook) => print('Book created successfully with ID: ${newBook.id}'),
    );
  }

  void updateBook(String id,String title, String author, int releaseDate) {
    final book = Book(
      id: id,
      title: title,
      author: author,
      releaseDtae: releaseDate,
    );
    final result = updateBookUseCase(UptadeBookParams(book: book));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (_) => print('Book updated successfully'),
    );
  }

  void deleteBook(String id) {
    final result = deleteBookUseCase(id);
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (success) =>
          print(success ? 'Book deleted successfully' : 'Book not found'),
    );
  }
}
