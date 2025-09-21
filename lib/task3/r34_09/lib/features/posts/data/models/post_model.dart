import 'dart:ffi';

import 'package:task7/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required super.id,
      required super.title,
      required super.content,
      required super.createAt});

  factory PostModel.fromJson(Map<String, dynamic> json) {


      return PostModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createAt: json['createAt']);
  }

    Map<String, dynamic> json() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createAt': createAt,
    };
  }

    PostModel copywith({
    String? id,
    String? title,
    String? content,
    int? createAt,
  }) {
    return PostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createAt: createAt ?? this.createAt);
  }
}
