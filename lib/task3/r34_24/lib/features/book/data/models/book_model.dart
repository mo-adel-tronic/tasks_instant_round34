import 'package:r34_24/features/book/domain/entites/book.dart'; // hwa hwa entitiy b inherit meno
class BookModel extends Book{

  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.releaseDtae,
  });
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      releaseDtae: json['releaseDate'] as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'releaseDate': releaseDtae,
    };
  }
  BookModel copywith({
    String? id,
    String? title,
    String? author,
    int? releaseDtae,

  }){
    return BookModel(id: id?? this.id, title: title?? this.title, author: author?? this.author, releaseDtae: releaseDtae?? this.releaseDtae);
  }
}