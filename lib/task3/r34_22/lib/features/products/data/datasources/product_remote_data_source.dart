import 'package:r34_22/core/error/exceptions.dart';
import 'package:r34_22/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updateProduct(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products = [
   const ProductModel(id: "1", name: "product 1", description: "descreption 1", price: 10.0),
   const ProductModel(id: "2", name: "product 2", description: "descreption 2", price: 10.0)

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
    final newProduct = product.copywith(id: DateTime.now().millisecondsSinceEpoch.toString());
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
