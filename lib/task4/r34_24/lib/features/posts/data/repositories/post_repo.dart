import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_24/features/posts/data/models/post_model.dart';
import 'package:r34_24/features/posts/domain/entites/post.dart';
import 'package:r34_24/features/posts/domain/repositories/post_repos.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDatasource;

  PostRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePosts = await remoteDatasource.getAllPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final remotePost = await remoteDatasource.getPost(id);
      return Right(remotePost);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    try {
      final postModel = PostModel(
        id: '', // ID ignored for creation
        title: post.title,
        content: post.content,
        publisherId: post.publisherId,
      );
      final newPost = await remoteDatasource.createPost(postModel);
      return Right(newPost);
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
        content: post.content,
        publisherId: post.publisherId,
      );
      final updatedPost = await remoteDatasource.updatePost(postModel);
      return Right(updatedPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await remoteDatasource.deletePost(id);
      return result ? Right(true) : Left(NotFoundFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
