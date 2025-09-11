import 'package:equatable/equatable.dart';

class Post extends Equatable{
    final String id;
  final String title;
  final String content;
  final DateTime createAt;

  const Post({required this.id, required this.title, required this.content, required this.createAt});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id,title,content,createAt];
  
 

}