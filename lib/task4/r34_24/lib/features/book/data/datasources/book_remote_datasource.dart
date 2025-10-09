import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/network/api_provider.dart';
import '../models/book_model.dart';

abstract class BookRemoteDatasource {
  Future<List<BookModel>> getAllBooks();
  Future<BookModel> getBook(String id);
  Future<BookModel> CreateBook(BookModel book);
  Future<BookModel> UpdateBook(BookModel book);
  Future<bool> DeleteBook(String id);
}

class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  final ApiProvider apiProvider;
  static const _baseurl = 'https://dummyjson.com/c/b84b-f321-4172-9793';

  BookRemoteDatasourceImpl({required this.apiProvider});

  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      final json = await apiProvider.get('$_baseurl?limit=30');
      final List booksJson = json['books'] as List;
      return booksJson
          .map((p) => BookModel.fromJson(p as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<BookModel> getBook(String id) async {
    try {
      final json = await apiProvider.get('$_baseurl?limit=30');
      final List booksJson = json['books'] as List;

      final bookJson = booksJson.firstWhere(
        (b) => b['id'].toString() == id,
        orElse: () => throw NotFoundException(),
      );

      return BookModel.fromJson(bookJson as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<BookModel> CreateBook(BookModel book) async {
    try {
      final body = book.toJsonForCreate();
      final json = await apiProvider.post('$_baseurl/add', body: body);
      return BookModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<BookModel> UpdateBook(BookModel book) async {
    try {
      final body = book.toJson();
      final json = await apiProvider.put('$_baseurl/${book.id}', body: body);
      return BookModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> DeleteBook(String id) async {
    try {
      await apiProvider.delete('$_baseurl/$id');
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}
