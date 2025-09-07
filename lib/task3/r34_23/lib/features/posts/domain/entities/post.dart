import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String content;
  final String userId;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, title, content, userId];
}