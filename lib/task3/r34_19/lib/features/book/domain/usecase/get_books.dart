import '../repository/book_repository.dart';
import '../entity/book.dart';
class GetBooks {
  final BookRepository repository;
  GetBooks(this.repository);
  Future<List<Book>> call() async => repository.getBooks();
}
