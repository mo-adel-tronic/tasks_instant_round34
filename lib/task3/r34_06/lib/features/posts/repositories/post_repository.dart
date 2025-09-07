import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import '../entities/post.dart';

abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  //why Either from dartz library?  getAllPost will return List of Post or failur

  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, bool> deletePost(String id);
}

//implement them in data layer

//implement class use case for every method to use it only in presentation layer
//Create use case for  getPost , use case for createPost , ...
