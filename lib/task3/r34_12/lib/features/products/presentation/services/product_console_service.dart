import 'dart:async';

import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/usecases/create_product.dart';
import 'package:r34_12/features/products/domain/usecases/delete_product.dart';
import 'package:r34_12/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_12/features/products/domain/usecases/get_product.dart';
import 'package:r34_12/features/products/domain/usecases/update_product.dart';

class ProductConsoleService with FailureMessages {
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

  Future<void> displayAllProducts() async {
    _setLoading(true);
    final result = await getAllProductsUseCase();
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (products) {
        if (products.isEmpty) {
          print('No products found.');
        } else {
          print('\n== PRODUCTS ===');
          for (final product in products) {
            print('ID: ${product.id}');
            print('Name: ${product.name}');
            print('Description: ${product.description}');
            print('Price: \$${product.price.toStringAsFixed(2)}');
            print('--');
          }
        }
      },
    );
  }

  Future<void> displayProduct(String id) async {
    _setLoading(true);
    final result = await getProductUseCase(GetProductParams(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (product) {
        print('\n== PRODUCT DETAILS ===');
        print('ID: ${product.id}');
        print('Name: ${product.name}');
        print('Description: ${product.description}');
        print('Price: \$${product.price.toStringAsFixed(2)}');
      },
    );
  }

  Future<void> createProduct(String name, String description, double price) async {
    final product = Product(
      id: '', // السيرفر هو اللي هيولد ID
      name: name,
      description: description,
      price: price,
    );

    _setLoading(true);
    final result = await createProductUseCase(CreateProductParams(product: product));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newProduct) => print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  Future<void> updateProduct(String id, String name, String description, double price) async {
    final product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );

    _setLoading(true);
    final result = await updateProductUseCase(UpdateProductParams(product: product));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedProduct) => print('Product updated successfully: ${updatedProduct.name}'),
    );
  }

  Future<void> deleteProduct(String id) async {
    _setLoading(true);
    final result = await deleteProductUseCase(DeleteProductParams(id: id));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'Product deleted successfully' : 'Product not found'),
    );
  }
}
