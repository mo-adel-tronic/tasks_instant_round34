import 'package:task7/core/error/exceptions.dart';
import 'package:task7/features/products/data/models/product_model.dart';
import 'package:task7/features/products/domain/entities/product.dart';

abstract class ProductRemoteDatasource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updateProducts(ProductModel product);
  ProductModel deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final List<ProductModel> _products = [
      ProductModel(id: '1', name: 'mobile', description: 'apple', price: 5),
      ProductModel(id: '2', name: 'laptop', description: 'dell', price: 10),
  ];

  @override
  ProductModel createProduct(ProductModel product) {
    final newProduct =
        product.copywith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _products.add(newProduct);
    return newProduct;
  }

  @override
  ProductModel deleteProduct(String id) {
    try {
      final product = _products.firstWhere((p) => p.id == id);
      _products.remove(product);
      return product;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  List<ProductModel> getAllProducts() {
    return _products;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel updateProducts(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }
}
