import '../../domain/entites/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.content,
    required super.publisherId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      publisherId: json['publisherId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'publisherId': publisherId,
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
    String? publisherId,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      publisherId: publisherId ?? this.publisherId,
    );
  }
}
