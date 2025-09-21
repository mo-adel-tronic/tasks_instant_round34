import 'package:r34_06/core/error/messages.dart';
import 'package:r34_06/features/products/domain/entities/product.dart';
import 'package:r34_06/features/products/domain/usecases/create_product.dart';
import 'package:r34_06/features/products/domain/usecases/delete_product.dart';
import 'package:r34_06/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_06/features/products/domain/usecases/get_product.dart';
import 'package:r34_06/features/products/domain/usecases/update_product.dart';

class ProductConsoleService with FailureMessages {
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

  void displayAllProducts() {
    final result = getAllProductsUseCase();
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

  void displayProduct(String id) {
    final result = getProductUseCase(GetProductParams(id: id));
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

  void createProduct(String name, String description, double price) {
    final product = Product(
      id: '',
      name: name,
      description: description,
      price: price,
    );

    final result = createProductUseCase(CreateProductParams(product: product));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newProduct) => print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  void updateProduct(String id, String name, String description, double price) {
    final product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );

    final result = updateProductUseCase(UpdateProductParams(product: product));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  void deleteProduct(String id) {
    final result = deleteProductUseCase(DeleteProductParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'Product deleted successfully' : 'Product not found'),
    );
  }
}