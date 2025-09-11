import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Product>> getAllProducts() {
    try {
      final remoteProducts = remoteDataSource.getAllProduct();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> getProduct(String id) {
    try {
      final remoteProduct = remoteDataSource.getProduct(id);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> updateProduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final updatedProduct = remoteDataSource.updateProduct(productModel);
      return Right(updatedProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> createProduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final createdProduct = remoteDataSource.createProduct(productModel);
      return Right(createdProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteProduct(String id) {
    try {
      final result = remoteDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}