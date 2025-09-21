import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/datasources/product_remote_datasource.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';


//again hassan did extends not implements
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
      name: product.name,
      description: product.description,
      price: product.price,
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
Future<Either<Failure, Product>> updateProduct(Product product) async {
  try {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
    );
    final updatedProduct = await remoteDataSource.updateProduct(productModel);
    return Right(updatedProduct);
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