import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/exceptions.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';
import 'package:r34_23/features/products/data/datasources/product_remote_data_source.dart';
import 'package:r34_23/features/products/data/models/product_model.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<Product>> getallproduct() {
    try {
      final remoteProducts = remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Product> getproduct(String id) {
    try {
      final remoteProduct = remoteDataSource.getProduct(id);
      return Right(remoteProduct);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Product> createproduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        descreption: product.descreption,
        price: product.price,
      );
      final newProduct =
          remoteDataSource.createProduct(productModel);
      return Right(newProduct);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, Product> updateproduct(Product product) {
    try {
      final productModel = ProductModel(
        id: product.id,
        name: product.name,
        descreption: product.descreption,
        price: product.price,
      );
      final updatedProduct =
          remoteDataSource.updateProduct(productModel);
      return Right(updatedProduct);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Either<Failure, bool> deleteproduct (String id) {
    try {
      final result = remoteDataSource.deleteProduct(id);
      return Right(result);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }
}