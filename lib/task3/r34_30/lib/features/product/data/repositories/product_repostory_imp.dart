import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exceptions.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/product/data/datasource/product_remote_datasource.dart';
import 'package:task3/features/product/data/models/product_model.dart';
import 'package:task3/features/product/domin/entities/product.dart';
import 'package:task3/features/product/domin/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Product>> getAllProducts() {
    try {
      final remoteProducts = remoteDataSource.getAllProducts();
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
  Either<Failure, Product> createProduct(Product product) {
    try {
      final newProduct = Product(
        id: product.id,
        name: product.name,
        price: product.price,
        description: product.description,
      );
      return Right(newProduct);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Product> addProduct(Product product) {
      try {
        final productModel = ProductModel(
          id: product.id,
          name: product.name,
          price: product.price,
          description: product.description,
        );
        final addedProduct = remoteDataSource.createProduct(productModel);
        return Right(addedProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

  @override
  Either<Failure, Product> updateProduct(Product product) {
    try {
      final productmodel = ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
      );
      final updateproduct = remoteDataSource.updateProduct(productmodel);
      return Right(updateproduct);
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
