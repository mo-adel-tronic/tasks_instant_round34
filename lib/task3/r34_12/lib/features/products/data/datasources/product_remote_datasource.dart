import 'package:r34_12/core/constants/url.dart';
import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/network/api_provider.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<bool> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiProvider apiProvider;
  static const _baseUrl =
      URLConstants.baseUrl + URLConstants.productsEndpoint;

  ProductRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final json = await apiProvider.get('$_baseUrl');

      final List productsJson = json['products'] as List;
      return productsJson
          .map((p) => ProductModel.fromJson(p as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      final json = await apiProvider.get('$_baseUrl/$id');
      return ProductModel.fromJson(json as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    try {
      final body = product.toJsonForCreate();
      final json = await apiProvider.post('$_baseUrl/add', body: body);
      return ProductModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      final body = product.toJson();
      final json =
          await apiProvider.put('$_baseUrl/${product.id}', body: body);
      return ProductModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    try {
      await apiProvider.delete('$_baseUrl/$id');
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}
