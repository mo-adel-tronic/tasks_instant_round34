import 'package:r34_16/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      title: (json['title'] ?? '') as String,
      body: (json['body'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {
      'title': title,
      'body': body,
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: content ?? this.body,
    );
  }
}