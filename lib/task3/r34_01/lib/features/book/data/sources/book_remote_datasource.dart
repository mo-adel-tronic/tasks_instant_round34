import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/features/book/data/model/book_model.dart';

abstract class BookRemoteDataSource {
  List<BookModel> getAllBooks();
  BookModel getBook(String id);
  BookModel createBook(BookModel book);
  BookModel updateBook(BookModel book);
  bool deleteBook(String id);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final List<BookModel> _books = [
     BookModel(
      name: 'Book 1',
      id: '1',
      description: 'description 1',
      price: 10.0,
    ),
     BookModel(
      name: 'Book 2',
      id: '2',
      description: 'description 2',
      price: 20.0,
    ),
  ];

  @override
  List<BookModel> getAllBooks() {
    return _books;
  }

  @override
  BookModel getBook(String id) {
    try {
      return _books.firstWhere((book) => book.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  BookModel updateBook(BookModel book) {
    final index = _books.indexWhere((b) => b.id == book.id);
    if (index != -1) {
      _books[index] = book;
      return book;
    } else {
      throw ServerException();
    }
  }

  @override
  BookModel createBook(BookModel book) {
    final newBook = book.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _books.add(newBook);
    return newBook;
  }

  @override
  bool deleteBook(String id) {
    final initialLength = _books.length;
    _books.removeWhere((book) => book.id == id);
    return _books.length < initialLength;
  }
}
