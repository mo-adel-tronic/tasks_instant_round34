import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class GetPost {
  final PostRepository pr;
  const GetPost({required this.pr});

  Either<Failure ,Post> call({required int id ,required int userId}){
    return pr.getPost(id:id , userId:userId);
  }
}