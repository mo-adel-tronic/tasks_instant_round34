import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class AddPost {
  final PostRepository pr;
  const AddPost({required this.pr});

  Either<Failure,void> call(Post post){
    return pr.addPost(post);
  }
}