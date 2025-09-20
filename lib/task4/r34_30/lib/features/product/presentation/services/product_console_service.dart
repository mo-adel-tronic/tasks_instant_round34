import 'dart:async';
import 'package:r34_30/core/error/messages.dart';
import 'package:r34_30/features/product/domin/entities/product.dart';
import 'package:r34_30/features/product/domin/usecase/create_product.dart';
import 'package:r34_30/features/product/domin/usecase/delete_product.dart';
import 'package:r34_30/features/product/domin/usecase/get_all_product.dart';
import 'package:r34_30/features/product/domin/usecase/get_product.dart';
import 'package:r34_30/features/product/domin/usecase/update_product.dart';

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
    final product = await getAllProductsUseCase();
    _setLoading(false);
    product.fold((Failure) => print('Error: ${mapFailureMessages(Failure)}'), (
      products,
    ) {
      if (products.isEmpty) {
        print('No products found.');
      } else {
        print('\n== PRODUCTS ===');
        for (final product in products) {
          print('ID: ${product.id}');
          print('title: ${product.title}');
          print('Description: ${product.description}');
          print('Price: \$${product.price.toStringAsFixed(2)}');
          print('--');
        }
      }
    });
  }

  Future<void> displayProduct(String id) async {
    _setLoading(true);
    final result = await getProductUseCase(GetProductParams(id: id));
    _setLoading(false);
    result.fold((failure) => print('Error: ${mapFailureMessages(failure)}'), (
      product,
    ) {
      print('\n== PRODUCT DETAILS ===');
      print('ID: ${product.id}');
      print('title: ${product.title}');
      print('Description: ${product.description}');
      print('Price: \$${product.price.toStringAsFixed(2)}');
    });
  }

  Future<void> createProduct(
    String title,
    String description,
    double price,
  ) async {
    final product = Product(
      id: '',
      title: title,
      description: description,
      price: price,
    );
    _setLoading(true);
    final result = await createProductUseCase(
      CreateProductParams(product: product),
    );
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newProduct) =>
          print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  Future<void> updateProduct(
    String id,
    String title,
    String description,
    double price,
  ) async {
    final product = Product(
      id: id,
      title: title,
      description: description,
      price: price,
    );
    _setLoading(true);
    final result = await updateProductUseCase(
      UpdateProductParams(product: product),
    );
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  Future<void> deleteProduct(String id) async {
    _setLoading(true);
    final result = await deleteProductUseCase(DeleteProductParams(id: id));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) =>
          print(success ? 'Product deleted successfully' : 'Product not found'),
    );
  }
}
