import 'package:task3/core/error/messages.dart';
import 'package:task3/features/product/domin/entities/product.dart';
import 'package:task3/features/product/domin/usecase/create_product.dart';
import 'package:task3/features/product/domin/usecase/delete_product.dart';
import 'package:task3/features/product/domin/usecase/get_all_product.dart';
import 'package:task3/features/product/domin/usecase/get_product.dart';
import 'package:task3/features/product/domin/usecase/update_product.dart';

class ProductConsoleService with MapFailureMessages {
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

  void displayAllProduct() {
    final product = getAllProductsUseCase();
    product.fold((Failure) => print('Error: ${mapFailureMessages(Failure)}'), (
      products,
    ) {
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
    });
  }

  void displayProduct(String id) {
    final result = getProductUseCase(GetProductParams(id: id));
    result.fold((failure) => print('Error: ${mapFailureMessages(failure)}'), (
      product,
    ) {
      print('\n== PRODUCT DETAILS ===');
      print('ID: ${product.id}');
      print('Name: ${product.name}');
      print('Description: ${product.description}');
      print('Price: \$${product.price.toStringAsFixed(2)}');
    });
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
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newProduct) =>
          print('Product created successfully with ID: ${newProduct.id}'),
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
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  void deleteProduct(String id) {
    final result = deleteProductUseCase(DeleteProductParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) =>
          print(success ? 'Product deleted successfully' : 'Product not found'),
    );
  }
}
