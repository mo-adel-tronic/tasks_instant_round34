import 'package:dartz/dartz.dart';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task7/features/posts/data/models/post_model.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDatasource;

  PostRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    try {
      final postModel = PostModel(
        id: '',  
        title: post.title,
        content: post.content,
        views: post.views,
      );
      final newPost = await remoteDatasource.createPost(postModel);
      return Right(newPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await remoteDatasource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
    try {
      final remotePosts = await remoteDatasource.getAllPost();
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
        views: post.views,
      );
      final updatedPost = await remoteDatasource.updatePost(postModel);
      return Right(updatedPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
