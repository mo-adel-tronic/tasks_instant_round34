import 'package:equatable/equatable.dart';
class Book extends Equatable{
  final String id;
  final String title;
  final String author;
  final int releaseDtae;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.releaseDtae,
  });

  @override
  List<Object?> get props => [id, title, author, releaseDtae];
}