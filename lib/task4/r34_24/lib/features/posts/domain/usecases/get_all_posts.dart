import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/post.dart';
import '../repositories/post_repos.dart';

class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Future <Either<Failure, List<Post>>> call() async{
    return await repository.getAllPosts();
  }
}