import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updateProduct(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products =  [
    const ProductModel(id: '1', name: 'MacBook Pro', price: 1000.0, description: 'MacBook Pro Description'),
    const ProductModel(id: '2', name: 'MacBook Air', price: 1600.0, description: 'MacBook Air Description'),
  ];

  @override
  List<ProductModel> getAllProducts() {
    return _products;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel createProduct(ProductModel product) {
    final newProduct = product.copyWith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _products.add(newProduct);  
    return newProduct;
  }

  @override
  ProductModel updateProduct(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return product;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deleteProduct(String id) {
    final initialLength = _products.length;
    _products.removeWhere((product) => product.id == id);
    return _products.length < initialLength;
  }
}


