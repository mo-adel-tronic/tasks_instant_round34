import '../model/book_model.dart';
import '../sources/book_local_source.dart';
class BookLocalSourceImpl implements BookLocalSource {
  final List<BookModel> _store = [];
  @override
  Future<void> cacheBooks(List<BookModel> books) async {
    _store.clear();
    _store.addAll(books);
  }
  @override
  Future<List<BookModel>> getCachedBooks() async => _store;
}
