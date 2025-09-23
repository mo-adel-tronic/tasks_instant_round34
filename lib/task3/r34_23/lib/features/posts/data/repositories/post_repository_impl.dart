import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/exceptions.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/entities/post.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_23/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:r34_23/features/posts/data/models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Post>> getAllPosts() {
    try {
      final remotePosts = remoteDataSource.getAllPosts();
      return Right(remotePosts);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Post> getPost(String id) {
    try {
      final remotePost = remoteDataSource.getPost(id);
      return Right(remotePost);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Post> createPost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
        
      );
      final newPost = remoteDataSource.createPost(postModel);
      return Right(newPost);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Post> updatePost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        title: post.title,
        content: post.content,
        
      );
      final updatedPost = remoteDataSource.updatePost(postModel);
      return Right(updatedPost);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, bool> deletePost(String id) {
    try {
      final result = remoteDataSource.deletePost(id);
      return Right(result);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }
}