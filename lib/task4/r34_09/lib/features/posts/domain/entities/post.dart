import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String content;
  final int views;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.views,
  });

  @override
  List<Object?> get props => [id, title, content, views];
}
