import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/post/data/model/post_model.dart';
import 'package:r34_01/features/post/data/sources/post_remote_datasource.dart';
import 'package:r34_01/features/post/domain/entity/post_entity.dart';
import 'package:r34_01/features/post/domain/repository/post_repository.dart';

class PostRepoImplment implements PostRepository {
  final PostRemoteDataSource remoteDatasource;
  PostRepoImplment({required this.remoteDatasource});

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
        name: post.name,
        id: post.id,
        description: post.description,
        price: post.price,
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
        name: post.name,
        id: post.id,
        description: post.description,
        price: post.price,
      );
      final updatePost = remoteDatasource.updatePost(postModel);
      return Right(updatePost);
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
