import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/exceptions.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/product/data/datasource/product_remote_datasource.dart';
import 'package:r34_30/features/product/data/models/product_model.dart';
import 'package:r34_30/features/product/domin/entities/product.dart';
import 'package:r34_30/features/product/domin/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    try {
      final remoteProduct = await remoteDataSource.getProduct(id);
      return Right(remoteProduct);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    try {
      final productModel = ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
      );
      final newProduct = await remoteDataSource.createProduct(productModel);
      return Right(newProduct);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    try {
      final productModel = ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
      );
      final addedProduct = await remoteDataSource.createProduct(productModel);
      return Right(addedProduct);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    try {
      final productmodel = ProductModel(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
      );
      final updateproduct = await remoteDataSource.updateProduct(productmodel);
      return Right(updateproduct);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String id) async {
    try {
      final result = await remoteDataSource.deleteProduct(id);
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
