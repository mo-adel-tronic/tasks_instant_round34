import 'package:r34_12/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.description,
  });

  // from json to object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'], 
      title: json['title'],
      description: json['description'],
    );
  }

  // from object to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

 PostModel postModel = const PostModel(
  id: '1', 
  title: 'Title 1',
  description: 'Description 1',
);

void main() {
  print(postModel.copyWith());
}