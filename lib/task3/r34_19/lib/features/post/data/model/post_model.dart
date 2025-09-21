import '../../domain/entity/post.dart';
class PostModel extends Post {
  PostModel({required String id, required String title, required String body}) : super(id: id, title: title, body: body);
  factory PostModel.fromJson(Map<String,dynamic> json) => PostModel(id: json['id'], title: json['title'], body: json['body']);
  Map<String,dynamic> toJson() => {'id': id, 'title': title, 'body': body};
}
