import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String body;
  final int views;
  final List<String> tags;
  final int userId;

  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.views,
    required this.tags,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, title, body, views, tags, userId];
}
