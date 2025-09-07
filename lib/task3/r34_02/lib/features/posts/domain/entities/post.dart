import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String text;
  final int numOfLikes;
  const Post({
    required this.id,
    required this.title,
    required this.text,
    required this.numOfLikes,
  });

  @override
  List<Object?> get props => [text, numOfLikes, title];
}
