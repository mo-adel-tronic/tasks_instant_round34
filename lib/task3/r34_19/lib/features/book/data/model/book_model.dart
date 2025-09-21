import '../../domain/entity/book.dart';
class BookModel extends Book {
  BookModel({required String id, required String title, required String author}) : super(id: id, title: title, author: author);
  factory BookModel.fromJson(Map<String,dynamic> json) => BookModel(id: json['id'], title: json['title'], author: json['author']);
  Map<String,dynamic> toJson() => {'id': id, 'title': title, 'author': author};
}
