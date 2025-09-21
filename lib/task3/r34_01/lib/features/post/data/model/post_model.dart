import 'package:r34_01/features/post/domain/entity/post_entity.dart';

class PostModel extends Post {
  const PostModel({
    required super.name,
    required super.id,
    required super.description,
    required super.price,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
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

  PostModel copyWith({
    String? name,
    String? id,
    String? description,
    double? price,
  }) {
    return PostModel(
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }
}