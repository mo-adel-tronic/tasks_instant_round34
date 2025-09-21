import 'package:dart_either/src/dart_either.dart';
import 'package:r34_00/core/errors/exceptions.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/data/source/post_data_source.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';
import 'package:r34_00/features/post/domain/repository/post_repository.dart';

class PostImplemntData extends PostRepository{
  final PostDataSource pds;
   PostImplemntData({required this.pds});

  @override
  Either<Failure, void> addPost(Post post) {
    try{
      return Right(pds.addPost(post));
    }on ServerException{
      return Left(ServerFailure());
    }on CashException{
      return Left(CasheFailure());
    }catch(e){
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, void> deletePost(int id) {
    try{
      return Right(pds.deletePost(id));
    }on ServerException{
      return Left(ServerFailure());
    }on CashException{
      return Left(CasheFailure());
    }catch(e){
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, List<Post>> getAllPosts() {
    try{
      return Right(pds.getAllPosts());
    }on ServerException{
      return Left(ServerFailure());
    }on CashException{
      return Left(CasheFailure());
    }catch(e){
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Post> getPost(int id, int userId) {
    try{
      return Right(pds.getPost(id, userId));
    }on ServerException{
      return Left(ServerFailure());
    }on CashException{
      return Left(CasheFailure());
    }catch(e){
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, void> updatePost(Post post) {
    try{
      return Right(pds.updatePost(post));
    }on ServerException{
      return Left(ServerFailure());
    }on CashException{
      return Left(CasheFailure());
    }catch(e){
      return Left(UnexpectedFailure());
    }
  }
  
}