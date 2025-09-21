import 'package:r34_01/features/book/domain/entity/book_entity.dart';

class BookModel extends Book {
  const BookModel({
    required super.name,
    required super.id,
    required super.description,
    required super.price,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'price': price};
  }

  BookModel copyWith({
    String? name,
    String? id,
    String? description,
    double? price,
  }) {
    return BookModel(
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }
}
