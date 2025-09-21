import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<bool> deleteProduct(String id);
}
