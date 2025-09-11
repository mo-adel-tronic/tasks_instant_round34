import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/exceptions.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/products/data/datasources/product_remote_data_source.dart';
import 'package:r34_22/features/products/data/models/product_model.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';
import 'package:r34_22/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Product>> getallproduct() {
    try {
      final remoteProducts = remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> getproduct(String id) {
    try {
      final remoteProduct = remoteDataSource.getProduct(id);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> createproduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final newProduct =
          remoteDataSource.createProduct(productModel);
      return Right(newProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> updateproduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final updatedProduct =
          remoteDataSource.updateProduct(productModel);
      return Right(updatedProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteproduct (String id) {
    try {
      final result = remoteDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
  @override
  Either<Failure, Product> createProduct(Product product) {
    throw UnimplementedError();
  }
  
  @override
  Either<Failure, Product> deleteProduct(String id) {
    throw UnimplementedError();
  }
  
  @override
  Either<Failure, List<Product>> getAllProducts() {
    throw UnimplementedError();
  }
  
  @override
  Either<Failure, Product> getProduct(String id) {
    throw UnimplementedError();
  }
  
  @override
  Either<Failure, Product> updateProducts(String id, Product product) {
    throw UnimplementedError();
  }
}