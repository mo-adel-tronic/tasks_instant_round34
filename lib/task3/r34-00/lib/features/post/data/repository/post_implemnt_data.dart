import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/exceptions.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/data/source/post_data_source.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class PostImplemntData extends PostRepository {

  final PostDataSource pds;
  PostImplemntData({required this.pds});

  @override
  Either<Failure, void> addPost({required Post post}) {
    try {
      return Right(pds.addPost(post: post));
    } on ServerException {
      return Left(ServerFailure());
    } on CasheException {
      return Left(CasheFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, void> deletePost({required int id}) {
    try {
      return Right(pds.deletePost(id: id));
    } on ServerException {
      return Left(ServerFailure());
    } on CasheException {
      return Left(CasheFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, List<Post>> getAllPosts() {
    try {
      return Right(pds.getAllPosts());
    } on ServerException {
      return Left(ServerFailure());
    } on CasheException {
      return Left(CasheFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }


@override
Either<Failure, Post> getPost({required int id, required int userId}) {
  try {
    return Right(pds.getPost(id: id, userId: userId));
  } on ServerException {
    return Left(ServerFailure());
  } on CasheException {
    return Left(CasheFailure());
  } catch (e) {
    return Left(UnexpectedFailure());
  }
}

@override
Either<Failure, Post> updatePost({required Post post}) {
  try {
    return Right(pds.updatePost(post: post));
  } on ServerException {
    return Left(ServerFailure());
  } on CasheException {
    return Left(CasheFailure());
  } catch (e) {
    return Left(UnexpectedFailure());
  }
}
}