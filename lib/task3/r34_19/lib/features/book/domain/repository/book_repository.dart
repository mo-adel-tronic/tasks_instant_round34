import '../entity/book.dart';
abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<Book> getBookById(String id);
}
