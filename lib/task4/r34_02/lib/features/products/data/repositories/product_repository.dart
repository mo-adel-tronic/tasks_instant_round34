import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_02/features/products/data/models/product_model.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  //return product if success or failur if failed
  @override
  Either<Failure, List<Product>> getAllProducts() {
    try {
      return Right(productRemoteDataSource.getAllProducts());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Product> getProduct(String id) {
    try {
      return Right(productRemoteDataSource.getProduct(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Product> createProduct(Product product) {
    final pm = ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
    );

    try {
      return Right(productRemoteDataSource.createProduct(pm));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, Product> updateProduct(Product product) {
    final pm = ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
    );
    try {
      return Right(productRemoteDataSource.updateProduct(pm));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Either<Failure, bool> deleteProduct(String id) {
    try {
      return Right(productRemoteDataSource.deleteProduct(id));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
