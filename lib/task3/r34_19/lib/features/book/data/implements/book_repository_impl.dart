import '../../domain/entity/book.dart';
import '../../domain/repository/book_repository.dart';
import '../model/book_model.dart';
import '../sources/book_local_source.dart';
class BookRepositoryImpl implements BookRepository {
  final BookLocalSource localSource;
  BookRepositoryImpl(this.localSource);
  @override
  Future<Book> getBookById(String id) async {
    final all = await localSource.getCachedBooks();
    return all.firstWhere((e) => e.id == id, orElse: () => BookModel(id: id, title: 'Unknown', author: 'Unknown'));
  }
  @override
  Future<List<Book>> getBooks() async {
    final list = await localSource.getCachedBooks();
    if(list.isEmpty){
      final seed = [BookModel(id: '1', title: '1984', author: 'Orwell'), BookModel(id: '2', title: 'Clean Code', author: 'Martin')];
      await localSource.cacheBooks(seed);
      return seed;
    }
    return list;
  }
}
