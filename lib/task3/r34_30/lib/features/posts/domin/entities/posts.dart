import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String name;
  final String body;

  const Post({
    required this.id,
    required this.name,
    required this.body,
  });

  @override
  List<Object?> get props => [id, name, body];
}