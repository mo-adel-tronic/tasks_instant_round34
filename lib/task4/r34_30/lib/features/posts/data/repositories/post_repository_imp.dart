import 'package:dartz/dartz.dart';
import 'package:task4/core/error/exceptions.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task4/features/posts/data/models/post_model.dart';
import 'package:task4/features/posts/domain/entities/post.dart';
import 'package:task4/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePosts = await remoteDataSource.getAllPosts();
      return Right(remotePosts);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final remotePost = await remoteDataSource.getPost(id);
      return Right(remotePost);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        body: post.body,
      );
      final newPost = await remoteDataSource.createPost(postModel);
      return Right(newPost);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post post) async {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        body: post.body,
      );
      final updatedPost = await remoteDataSource.updatePost(postModel);
      return Right(updatedPost);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await remoteDataSource.deletePost(id);
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}