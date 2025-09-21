import 'package:r34_01/features/book/domain/entity/book_entity.dart';
import 'package:r34_01/features/book/domain/usecase/create_book.dart';
import 'package:r34_01/features/book/domain/usecase/delete_book.dart';
import 'package:r34_01/features/book/domain/usecase/get_all_books.dart';
import 'package:r34_01/features/book/domain/usecase/get_book.dart';
import 'package:r34_01/features/book/domain/usecase/update_book.dart';
import 'package:r34_01/core/error/messages.dart';

class BookConsoleService with FailureMessages {
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
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      books,
    ) {
      if (books.isEmpty) {
        print("No Books found.");
      } else {
        print("\n===BOOKS===");
        for (final book in books) {
          print("ID: ${book.id}");
          print("Name: ${book.name}");
          print("Description: ${book.description}");
          print("Price: \$${book.price.toStringAsFixed(2)}");
          print("-----");
        }
      }
    });
  }

  void displayBook(String id) {
    final result = getBookUseCase(GetBookParams(id: id));
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      book,
    ) {
      print("\n===BOOKS===");
      print("ID: ${book.id}");
      print("Name: ${book.name}");
      print("Description: ${book.description}");
      print("Price: \$${book.price.toStringAsFixed(2)}");
      print("-----");
    });
  }

  void createBook(String name, String description, double price) {
    final book = Book(
      id: '',
      name: name,
      description: description,
      price: price,
    );
    final result = createBookUseCase(CreateBookParams(book: book));
    result.fold(
      (failuer) => print('Error:${mapFailureToMessage(failuer)}'),
      (newBook) => print('Book created successfully with ID:${newBook.id}'),
    );
  }

  void updateBook(String id, String name, String description, double price) {
    final book = Book(
      id: id,
      name: name,
      description: description,
      price: price,
    );
    final result = updateBookUseCase(UpdateBookParams(book: book));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (updatedBook) => print('Book updated successfully'),
    );
  }

  void deleteBook(String id) {
    final result = deleteBookUseCase(DeleteBookParams(id: id));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (success) => print(success? 'Book deleted successfully' : 'Book not found'),
    );
  }
}
