import 'dart:async';
import 'package:task3/core/error/messages.dart';
import 'package:task3/features/products/domain/entities/product.dart';
import 'package:task3/features/products/domain/usecase/create_product.dart';
import 'package:task3/features/products/domain/usecase/delete_product.dart';
import 'package:task3/features/products/domain/usecase/get_all_product.dart';
import 'package:task3/features/products/domain/usecase/get_product.dart';
import 'package:task3/features/products/domain/usecase/update_product.dart';

class ProductConsoleService with MapFailureMessages {
  final _loadingController = StreamController<bool>.broadcast();

  Stream<bool> get loadingStream => _loadingController.stream;

  void _setLoading(bool v) => _loadingController.add(v);

  final GetAllProducts getAllProductsUseCase;
  final GetProduct getProductUseCase;
  final CreateProduct createProductUseCase;
  final UpdateProduct updateProductUseCase;
  final DeleteProduct deleteProductUseCase;

  ProductConsoleService({
    required this.getAllProductsUseCase,
    required this.getProductUseCase,
    required this.createProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
  });

  void dispose() {
    _loadingController.close();
  }

  Future<void> displayAllProduct() async {
    _setLoading(true);
    final Product = await getAllProductsUseCase();
    _setLoading(false);
    Product.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      Products,
    ) {
      if (Products.isEmpty) {
        print('No Products found.');
      } else {
        print('\n== ProductS ===');
        for (final Product in Products) {
          print('ID: ${Product.id}');
          print('name: ${Product.name}');
          print('Email: ${Product.description}');
          print('price: ${Product.price}');
          print('--');
        }
      }
    });
  }

  Future<void> displayProduct(String id) async {
    _setLoading(true);
    final result = await getProductUseCase(GetProductParams(id: id));
    _setLoading(false);
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      Product,
    ) {
      print('\n== Product DETAILS ===');
      print('ID: ${Product.id}');
      print('name: ${Product.name}');
      print('description: ${Product.description}');
      print('price: ${Product.price}');
    });
  }

  Future<void> createProduct(String name, String description, double price) async {
    final product = Product(id: '', name: name, description: description, price: price);
    _setLoading(true);
    final result = await createProductUseCase(
      CreateProductParams(product: product),
    );
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newProduct) =>
          print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  Future<void> updateProduct(String id, String name, String description, double price) async {
    final product = Product(id: '', name: name, description: description, price: price);
    _setLoading(true);
    final result = await updateProductUseCase(
      UpdateProductParams(product: product),
    );
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  Future<void> deleteProduct(String id) async {
    _setLoading(true);
    final result = await deleteProductUseCase(DeleteProductParams(id: id));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) =>
          print(success ? 'Product deleted successfully' : 'Product not found'),
    );
  }
}
