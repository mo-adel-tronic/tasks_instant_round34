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

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final posts = await postRemoteDataSource.getAllPosts();
      return Right(posts);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final post = await postRemoteDataSource.getPost(id);
      return Right(post);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    final model = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
      tags: post.tags,
      views: post.views,
      userId: post.userId,
    );

    try {
      final created = await postRemoteDataSource.createPost(model);
      return Right(created);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post post) async {
    final model = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
      tags: post.tags,
      views: post.views,
      userId: post.userId,
    );

    try {
      final updated = await postRemoteDataSource.updatePost(model);
      return Right(updated);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await postRemoteDataSource.deletePost(id);
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
