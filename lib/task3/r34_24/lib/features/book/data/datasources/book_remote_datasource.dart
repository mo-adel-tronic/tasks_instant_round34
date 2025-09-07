import 'package:r34_24/core/error/exception.dart';
import '../models/book_model.dart';

abstract class BookRemoteDatasource {
  List<BookModel> getAllBooks();
  BookModel getBook(String id);
  BookModel CreateBook(BookModel book);
  BookModel UpdateBook(BookModel book);
  bool DeleteBook(String id);
  }
class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  final List<BookModel> _books = [
    const BookModel(id: '1', title: 'title 1', author: 'author 1', releaseDtae: 2025),
    const BookModel(id: '2', title: 'title 2', author: 'author 2', releaseDtae: 2023),
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
  BookModel CreateBook(BookModel book){
    final newProduct = book.copywith(id: DateTime.now().millisecondsSinceEpoch.toString()); 
    _books.add(newProduct);
    return newProduct;
  }

  @override
  BookModel UpdateBook(BookModel book) {
    final index = _books.indexWhere((b) => b.id == book.id);
    if (index != -1) {
    _books[index] = book;
    return book;
    }else{
      throw ServerException();
    }
  }

  @override
  bool DeleteBook(String id) {
    final intialLength=_books.length;
    _books.removeWhere((book) => book.id == id);
    return _books.length<intialLength;
  }
}

  