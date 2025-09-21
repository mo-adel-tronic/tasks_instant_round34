import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:r34_12/features/posts/data/models/post_model.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:r34_12/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePosts = await remoteDataSource.getAllPosts();
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final remotePost = await remoteDataSource.getPost(id);
      return Right(remotePost);
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
        content: post.content,
        
      );
      final newPost = await remoteDataSource.createPost(postModel);
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
        
      );
      final updatedPost = await remoteDataSource.updatePost(postModel);
      return Right(updatedPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String id) async {
    try {
      final result = await remoteDataSource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}