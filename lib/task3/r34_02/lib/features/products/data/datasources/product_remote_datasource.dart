import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  ProductModel createProduct(ProductModel model);
  ProductModel updateProduct(ProductModel model);
  bool deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products = [
    ProductModel(id: "1", name: "p1", price: 20, description: "description1"),
    ProductModel(id: "2", name: "p2", price: 20, description: "description2"),
    ProductModel(id: "3", name: "p3", price: 20, description: "description3"),
    ProductModel(id: "4", name: "p4", price: 20, description: "description4"),
    ProductModel(id: "5", name: "p5", price: 20, description: "description5"),
  ];

  @override
  List<ProductModel> getAllProducts() {
    return _products;
  }

  @override
  ProductModel getProduct(String id) {
    try {
      return _products.firstWhere((p) => p.id == id); //or use orElse
    } catch (e) {
      throw ServerException(); //Your exception
    }
  }

  @override
  ProductModel createProduct(ProductModel model) {
    /*create new product with data:
     newId = DateTime.now()..
     newPrice = model.price
    */
    final ProductModel newProduct = model.copyWith(
      newId: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _products.add(newProduct);
    return newProduct;
  }

  @override
  ProductModel updateProduct(ProductModel model) {
    final int productIndex = _products.indexWhere((p) => p.id == model.id);
    if (productIndex != -1) {
      _products[productIndex] = model; //update data

      /*final ProductModel updatedProduct = model.copyWith(
      newName: model.name ,
      newDescription: model.description ,
      newPrice: model.price
    );*/
      //return updatedProduct;
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deleteProduct(String id) {
    final oldLength = _products.length;
    _products.removeWhere((p) => id == p.id);
    return _products.length < oldLength;
  }
}
