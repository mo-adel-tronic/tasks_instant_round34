import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class DeletePost {
  final PostRepository pr;
  const DeletePost({required this.pr});

  Either<Failure,void> call(int id){
    return pr.deletePost(id);
  }
}