import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String description;
  

 const Post({
    required this.id,
    required this.title,
    required this.description,
    
  });

  @override
  List<Object?> get props => [id, description, title];
}