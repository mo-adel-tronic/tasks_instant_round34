import 'dart:async';
import 'dart:io';
import 'package:r34_24/features/book/presentation/services/book_console_service.dart';

class BookMenu {
  final BookConsoleService _bookConsoleService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading=false;

  BookMenu(this._bookConsoleService){
    _loadingSub = _bookConsoleService.loadingStream.listen((loading){
      _isLoading =loading;
      if(loading){
        _showSpinnerWhileLoading();
      }
    });
  }

  Future<void> showMenu() async{
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
          await _bookConsoleService.displayAllBooks();
          break;

        case '2':
          await _viewBook();
          break;

        case '3':
          await _createBook();
          break;

        case '4':
          await _updateBook();
          break;

        case '5':
         await  _deleteBook();
          break;

        case '6':
          print('Exiting menu..');
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  Future<void> _viewBook() async{
    stdout.write('Enter Book ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _bookConsoleService.displayBook(id);
    }
  }

  Future<void> _createBook() async{
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
      await _bookConsoleService.createBook(title, author, releaseDate);
    } else {
      print(' All filed are required');
    }
  }

  Future <void> _updateBook() async{
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
      await _bookConsoleService.updateBook(id,title, author, releaseDate);
    } else {
      print('All filed are required');
    }
  }

  Future<void> _deleteBook() async{
    stdout.write('Enter Book ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
     await _bookConsoleService.deleteBook(id);
    }
  }
  Future <void> _showSpinnerWhileLoading() async{
    const spinnerChars=['|','/','-','\\'];
    var i =0;
    while(_isLoading){
      stdout.write('\rLoading ${spinnerChars[i % spinnerChars.length]}');
      await Future.delayed(const Duration(milliseconds: 200));
      i++;
    }
    stdout.write('\r');
  }
  void dispose(){
    _loadingSub?.cancel();
    _bookConsoleService.dispose();
  }
}
