import 'package:r34_02/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.text,
    required super.numOfLikes,
    required super.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      text: json['text'],
      numOfLikes: json['numOfLikes'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'numOfLikes': numOfLikes, 'title': title};
  }

  PostModel copyWith({
    String? newId,
    String? newtext,
    int? newNumOfLikes,
    String? newtitle,
  }) {
    return PostModel(
      id: newId ?? id,
      text: newtext ?? text,
      numOfLikes: newNumOfLikes ?? numOfLikes,
      title: newtitle ?? title,
    );
  }
}
