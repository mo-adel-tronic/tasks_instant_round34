import 'package:dartz/dartz.dart';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task7/features/posts/data/models/post_model.dart';
import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:task7/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  late final PostRemoteDatasource remoteDatasource;
  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    try {
      final postModel = PostModel(
          id: post.id,
          title: post.title,
          content: post.content,
          createAt: post.createAt);
      final newproduct = remoteDatasource.createPost(postModel);
      return Right(newproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> deletePost(String id) async {
    try {
      final result = remoteDatasource.deletePost(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
    try {
      final remotepost = remoteDatasource.getAllPost();
      return Right(remotepost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(String id) async {
    try {
      final remotepost = remoteDatasource.getPost(id);
      return Right(remotepost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(String id, Post post) async {
    try {
      final productmodel = PostModel(id: post.id, title: post.title, content: post.content, createAt: post.createAt);
      final updateproduct = remoteDatasource.updatePost(productmodel);
      return Right(updateproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
