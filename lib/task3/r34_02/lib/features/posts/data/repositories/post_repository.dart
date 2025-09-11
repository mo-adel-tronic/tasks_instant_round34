import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_02/features/posts/data/models/post_model.dart';
import 'package:r34_02/features/posts/domain/entities/post.dart';
import 'package:r34_02/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  //return Post if success or failur if failed
  @override
  Either<Failure, List<Post>> getAllPosts() {
    try {
      return Right(postRemoteDataSource.getAllPosts());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Post> getPost(String id) {
    try {
      return Right(postRemoteDataSource.getPost(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Post> createPost(Post post) {
    final model = PostModel(
      id: post.id,
      title: post.title,
      numOfLikes: post.numOfLikes,
      text: post.text,
    );

    try {
      return Right(postRemoteDataSource.createPost(model));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Post> updatePost(Post post) {
    final model = PostModel(
      id: post.id,
      title: post.title,
      numOfLikes: post.numOfLikes,
      text: post.text,
    );
    try {
      return Right(postRemoteDataSource.updatePost(model));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, bool> deletePost(String id) {
    try {
      return Right(postRemoteDataSource.deletePost(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
