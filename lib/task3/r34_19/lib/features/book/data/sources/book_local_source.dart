import '../model/book_model.dart';
abstract class BookLocalSource {
  Future<List<BookModel>> getCachedBooks();
  Future<void> cacheBooks(List<BookModel> books);
}
