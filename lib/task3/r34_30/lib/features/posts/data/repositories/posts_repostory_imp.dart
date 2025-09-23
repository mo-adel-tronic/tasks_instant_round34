import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exceptions.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/data/datasource/posts_remote_datasource.dart';
import 'package:task3/features/posts/data/models/posts_model.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostRepository {
  final PostsRemoteDataSource remoteDataSource;

  PostsRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Post>> getAllPosts() {
    try {
      final remotepost = remoteDataSource.getAllPost();
      return Right(remotepost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> getPost(String id) {
    try {
      final remotepost = remoteDataSource.getPost(id);
      return Right(remotepost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, PostModel> createPost(Post post) {
    try {
      final postModel = PostModel(
        id: post.id,
        name: post.name,
        body: post.body,
      );
      final newpost = remoteDataSource.createPost(postModel);
      return Right(newpost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Post> updatePost(Post post) {
    try {
      final productmodel = PostModel(
        id: post.id,
        name: post.name,
        body: post.body,
      );
       final updateproduct = remoteDataSource.updatePost(productmodel);
       return Right(updateproduct);
     } on ServerException {
       return Left(ServerFailure());
     }
   }
    
    @override
    Either<Failure, bool> deletePost(String id) {
      try {
        final result = remoteDataSource.deletePost(id);
        return Right(result);
      } on ServerException {
       return Left(ServerFailure());
      }
    }
}
