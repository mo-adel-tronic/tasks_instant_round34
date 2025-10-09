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

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final products = await productRemoteDataSource.getAllProducts();
      return Right(products);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    try {
      final product = await productRemoteDataSource.getProduct(id);
      return Right(product);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    final pm = ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
    );

    try {
      final created = await productRemoteDataSource.createProduct(pm);
      return Right(created);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    final pm = ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
    );

    try {
      final updated = await productRemoteDataSource.updateProduct(pm);
      return Right(updated);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String id) async {
    try {
      final result = await productRemoteDataSource.deleteProduct(id);
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
