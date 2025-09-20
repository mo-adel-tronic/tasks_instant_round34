import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/exceptions.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/posts/data/datasource/posts_remote_datasource.dart';
import 'package:r34_30/features/posts/data/models/posts_model.dart';
import 'package:r34_30/features/posts/domin/entities/posts.dart';
import 'package:r34_30/features/posts/domin/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostRepository {
  final PostsRemoteDataSource remoteDataSource;

  PostsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePost = await remoteDataSource.getAllPost();
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
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final remotepost = await remoteDataSource.getPost(id);
      return Right(remotepost);
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
  Future<Either<Failure, PostModel>> createPost(Post post) async {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        body: post.body,
      );
      final newpost = await remoteDataSource.createPost(postModel);
      return Right(newpost);
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
      final productmodel = PostModel(
        id: post.id,
        title: post.title,
        body: post.body,
      );
      final updateproduct = await remoteDataSource.updatePost(productmodel);
      return Right(updateproduct);
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
