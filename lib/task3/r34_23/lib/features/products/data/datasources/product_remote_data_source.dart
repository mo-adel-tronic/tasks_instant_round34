import 'package:r34_23/core/error/exceptions.dart';
import 'package:r34_23/features/products/data/models/product_model.dart';


abstract class ProductRemoteDataSource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel product);
  ProductModel updateProduct(ProductModel product);
  bool deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products = [
   const ProductModel(id: "1", name: "Samsung a55", descreption: "Android", price: 20000.0),
   const ProductModel(id: "2", name: "iPhone 13", descreption: "iOS", price: 30000.0)
    
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
      throw Serverexception();
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
      throw Serverexception();
    }
  }

  @override
  bool deleteProduct(String id) {
    final initialLength = _products.length;
    _products.removeWhere((product) => product.id == id);
    return _products.length < initialLength;
  }
}


