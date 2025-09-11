import 'package:r34_12/core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  List<ProductModel> getAllProduct();
   ProductModel getProduct(String id);
   ProductModel addProduct(ProductModel product);
   ProductModel updateProduct(ProductModel product);
   ProductModel createProduct(ProductModel product);
   bool deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDataSource{
  final List<ProductModel> _products=[
     ProductModel(  id: '1', name: 'product 1', description: 'Description 1', price: 10.0,),
     ProductModel(  id: '2', name: 'product 2', description: 'Description 2', price: 20.0,),

  ];
  @override
  List<ProductModel> getAllProduct() {
    return _products;
  }

  @override
  ProductModel getProduct(String id){
    try{
      return _products.firstWhere((Product)=> Product.id == id);
    }catch (e) {
      throw ServerException();
    }
  }

  @override
  ProductModel addProduct(ProductModel product) {
    _products.add(product);
    return product;
  }

  @override
  ProductModel createProduct(ProductModel product){
    final newProduct = product.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString());
    _products.add(newProduct);
    return newProduct;
  }
  
  @override
  ProductModel updateProduct(ProductModel product){
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1){
      _products[index] = product;
      return product;
    }else{
      throw ServerException();
    }
  }

  @override
  bool deleteProduct(String id){
    final initialLength = _products.length;
    _products.removeWhere((Product) => Product.id == id);
    return _products.length < initialLength;
  }  
}