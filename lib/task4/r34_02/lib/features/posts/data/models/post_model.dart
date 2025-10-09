import 'package:r34_02/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.views,
    required super.tags,
    required super.userId,
  });

  /// Convert from JSON → PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      views: json['views'] ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList() ??
          [],
      userId: json['userId'] ?? 0,
    );
  }

  /// Convert to JSON (for update, full object)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'views': views,
      'tags': tags,
      'userId': userId,
    };
  }

  /// Convert to JSON (for create – exclude `id`)
  Map<String, dynamic> toJsonCreate() {
    return {
      'title': title,
      'body': body,
      'views': views,
      'tags': tags,
      'userId': userId,
    };
  }

  /// CopyWith for immutability
  PostModel copyWith({
    String? newId,
    String? newTitle,
    String? newBody,
    int? newViews,
    List<String>? newTags,
    int? newUserId,
  }) {
    return PostModel(
      id: newId ?? id,
      title: newTitle ?? title,
      body: newBody ?? body,
      views: newViews ?? views,
      tags: newTags ?? tags,
      userId: newUserId ?? userId,
    );
  }
}
