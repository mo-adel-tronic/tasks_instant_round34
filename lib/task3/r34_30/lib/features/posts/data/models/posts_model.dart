import 'package:task3/features/posts/domin/entities/posts.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.name,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      name: json['name'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'body': body,
    };
  }
  PostModel copyWith({
    String? id,
    String? name,
    String? body,
  }) {
    return PostModel(
        id: id ?? this.id,
        name: name ?? this.name,
        body: body ?? this.body,
      );
  }
}