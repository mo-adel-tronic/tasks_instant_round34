import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class GetAllPost {
  final PostRepository repository;

  GetAllPost(this.repository);

  //Call Method
  /*Should Called Call to use it in presentation like:
  GetAllPost gp = GetAllPost(repository);
  gp(); instead of gp.call()
  
   */
  Either<Failure, List<Post>> call() {
    return repository.getAllPosts();
  }
}
