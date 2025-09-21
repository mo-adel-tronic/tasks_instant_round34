import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class UpdatePost {
  final PostRepository pr;
  const UpdatePost({required this.pr});

  Either<Failure,void> call(Post post){
    return pr.updatePost(post);
  }
}