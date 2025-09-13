import 'package:r34_00/features/post/domain/entity/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.tags,
    required super.views,
    required super.userId,
  });


    factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
    id : json['id'],
    title : json['title'],
    body : json['body'],
    tags : json['tags'].cast<String>(),
    views : json['views'],
    userId : json['userId']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = super.id;
    data['title'] = super.title;
    data['body'] = super.body;
    data['tags'] = super.tags;
    data['views'] = super.views;
    data['userId'] = super.userId;
    return data;
  }
}
