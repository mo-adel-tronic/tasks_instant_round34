import 'package:r34_12/core/error/exception.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';



abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<bool> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products = [
    const ProductModel(id: '1', name: 'product 1', description: 'description 1', price: 10.0),
    const ProductModel(id: '2', name: 'product 2', description: 'description 2', price: 20.0),
  ];

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return _products;
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      final product = _products.firstWhere((product) => product.id == id);
      return product;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    final newProduct = product.copywith(id: DateTime.now().millisecondsSinceEpoch.toString()); 
    _products.add(newProduct);
    return newProduct;
  }

  @override 
  Future<ProductModel> updateProduct(ProductModel product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final initialLength = _products.length;
    _products.removeWhere((product) => product.id == id);
    return _products.length < initialLength;
  }
}