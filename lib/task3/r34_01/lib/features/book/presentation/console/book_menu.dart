import 'dart:io';

import 'package:r34_01/features/book/presentation/services/book_console_service.dart';

class BookMenu {
  final BookConsoleService _bookService;
  BookMenu(this._bookService);
  void showMenu() {
    subLoop:
    while (true) {
      print('\n===BOOK MANGEMENT SYSTEM===');
      print('1. List all books');
      print('2. View book details');
      print('3. Create new book');
      print('4. Update book');
      print('5. Delete book');
      print('6. Exit');
      print('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _bookService.displayAllBooks();
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
          print('Goodbye!');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewBook() {
    print('Enter book ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _bookService.displayBook(id);
    }
  }

  void _createBook() {
    print('Enter book name: ');
    final name = stdin.readLineSync();
    print('Enter book description: ');
    final description = stdin.readLineSync();
    print('Enter book price: ');
    final priceStr = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _bookService.createBook(name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _updateBook() {
    print('Enter book ID: ');
    final id = stdin.readLineSync();
    print('Enter book name: ');
    final name = stdin.readLineSync();
    print('Enter book description: ');
    final description = stdin.readLineSync();
    print('Enter book price: ');
    final priceStr = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _bookService.updateBook(id, name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _deleteBook() {
    print('Enter book ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _bookService.deleteBook(id);
    }
  }
}
