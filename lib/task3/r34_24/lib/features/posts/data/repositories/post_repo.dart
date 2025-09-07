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
  Either<Failure, List<Post>> getAllPosts() {
    try {
      final remotePosts = remoteDatasource.getAllPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> getPost(String id) {
    try {
      final remotePost = remoteDatasource.getPost(id);
      return Right(remotePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> createPost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
        publisherId: post.publisherId,
      );

      final newPost = remoteDatasource.createPost(postModel);
      return Right(newPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> updatePost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
        publisherId: post.publisherId,
      );

      final updatedPost = remoteDatasource.updatePost(postModel);
      return Right(updatedPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deletePost(String id) {
    try {
      final result = remoteDatasource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
