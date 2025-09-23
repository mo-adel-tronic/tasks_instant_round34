import 'dart:io';
import 'package:r34_24/features/book/presentation/services/book_console_service.dart';

class BookMenu {
  final BookConsoleService _bookConsoleService;

  BookMenu(this._bookConsoleService);

  void showMenu() {
    while (true) {
      print('\n------ Book Management Menu -----');
      print('1. List all books');
      print('2. View book details');
      print('3. Create new Book');
      print('4. Update book');
      print('5. Delete book');
      print('6. Exit');
      stdout.write('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _bookConsoleService.displayAllBooks();
          break;

        case '2':
          _viewBook();
          break;

        case '3':
          _createBook();
          break;

        case '4':
          _updateBook();
          break;

        case '5':
          _deleteBook();
          break;

        case '6':
          print('Exiting menu..');
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewBook() {
    stdout.write('Enter Book ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _bookConsoleService.displayBook(id);
    }
  }

  void _createBook() {
    stdout.write('Enter Book Title: ');
    final title = stdin.readLineSync();

    stdout.write('Enter Author: ');
    final author = stdin.readLineSync();

    stdout.write('Enter Release Date (year as number): ');
    final releaseDate = int.tryParse(stdin.readLineSync() ?? '');

    if (title != null &&
        author != null &&
        releaseDate != null &&
        title.isNotEmpty &&
        author.isNotEmpty) {
      _bookConsoleService.createBook(title, author, releaseDate);
    } else {
      print(' All filed are required');
    }
  }

  void _updateBook() {
    stdout.write('Enter Book ID: ');
    final id = stdin.readLineSync();

    stdout.write('Enter Book Title: ');
    final title = stdin.readLineSync();

    stdout.write('Enter Author: ');
    final author = stdin.readLineSync();

    stdout.write('Enter New Release Date (year): ');
    final releaseDate = int.tryParse(stdin.readLineSync() ?? '');

    if (id != null &&
        title != null &&
        author != null &&
        releaseDate != null &&
        title.isNotEmpty &&
        author.isNotEmpty) {
      _bookConsoleService.updateBook(id,title, author, releaseDate);
    } else {
      print('All filed are required');
    }
  }

  void _deleteBook() {
    stdout.write('Enter Book ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _bookConsoleService.deleteBook(id);
    } else {
      print('All filed are required');
    }
  }
}
