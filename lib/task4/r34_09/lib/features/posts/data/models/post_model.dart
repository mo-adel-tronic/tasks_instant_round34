import 'package:task7/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.content,  
    required super.views,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      title: json['title'],
      content: json['body'],  
      views: json['views'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': content,
      'views': views,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    
     
     
    return {
      'title': title,
      'body': content,
      'userId': int.tryParse(id) ?? 1,  
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? content,
    int? views,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      views: views ?? this.views,
    );
  }
}
