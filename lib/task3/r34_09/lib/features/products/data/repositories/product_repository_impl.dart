import 'package:dartz/dartz.dart';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:task7/features/products/data/datasources/product_remote_datasource.dart';
import 'package:task7/features/products/data/models/product_model.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late final ProductRemoteDatasource remoteDatasource;
  ProductRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    try {
      final productModel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price);
      final newproduct = remoteDatasource.createProduct(productModel);
      return Right(newproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String id) async {
    try {
      final result = remoteDatasource.deleteProduct(id);
      return Right(result as bool);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final remoteProducts = remoteDatasource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    try {
      final remoteproduct = remoteDatasource.getProduct(id);
      return Right(remoteproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProducts(
        Product product) async {
    try {
      final productmodel = ProductModel(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price);
      final updateproduct = remoteDatasource.updateProducts(productmodel);
      return Right(updateproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
