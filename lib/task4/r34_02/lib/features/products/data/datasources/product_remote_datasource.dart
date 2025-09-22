import 'package:r34_02/core/constants/url_constants.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/network/api_provider.dart';
import 'package:r34_02/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel model);
  Future<ProductModel> updateProduct(ProductModel model);
  Future<bool> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final APIProvider apiProvider;
  ProductRemoteDataSourceImpl({required this.apiProvider});

  static const String _baseUrl =
      "${URLConstants.baseURL}${URLConstants.productsEndPoint}";

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final data = await apiProvider.get(_baseUrl); //get data
      final List productsJson =
          data["products"] as List; //get list from it (casting)
      return productsJson
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      final data = await apiProvider.get("$_baseUrl/$id");
      return ProductModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> createProduct(ProductModel model) async {
    try {
      final data = await apiProvider.post(
        "$_baseUrl/add",
        body: model.toJsonCreate(),
      );
      return ProductModel.fromJson(data as Map<String, dynamic>); //casting
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel model) async {
    try {
      final data = await apiProvider.put(
        "$_baseUrl/${model.id}",
        body: model.toJsonCreate(),
      );
      return ProductModel.fromJson(data as Map<String, dynamic>); //casting
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    try {
      await apiProvider.delete("$_baseUrl/$id");
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}
