import 'package:task7/core/error/failures.dart';
import 'package:task7/core/error/messages.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:task7/features/products/domain/usecases/create_product.dart';
import 'package:task7/features/products/domain/usecases/delete_product.dart';
import 'package:task7/features/products/domain/usecases/get_all_products.dart';
import 'package:task7/features/products/domain/usecases/get_product.dart';
import 'package:task7/features/products/domain/usecases/update_product.dart';
import 'package:dartz/dartz.dart';

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

  Future<void> displayAllProducts() async {
    print("تم الدخول");
    final result = await getAllProductsUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (products) {
        if (products.isEmpty) {
          print('No products found.');
          return;
        } 
        print('\n=== PRODUCTS ===');
        for (final product in products) {
          print('ID: ${product.id}');
          print('Name: ${product.name}');
          print('Description: ${product.description}');
          print('Price: \$${product.price.toStringAsFixed(2)}');
          print('---');
        }
      },
    );
  }

  Future<void> displayProduct(String id) async {
    final result = await getProductUseCase(getProductparams(id: id));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (product) {
        print('\n=== PRODUCT DETAILS ===');
        print('ID: ${product.id}');
        print('Name: ${product.name}');
        print('Description: ${product.description}');
        print('Price: \$${product.price.toStringAsFixed(2)}');
      },
    );
  }

  Future<void> createProduct(String name, String description, double price) async {
    final product = Product(
      id: '', 
      name: name,
      description: description,
      price: price,
    );

    final result =
        await createProductUseCase(createProductparams(product: product));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newProduct) =>
          print('Product created successfully with ID: ${newProduct.id}'),
    );
  }

  Future<void> updateProduct(
      String id, String name, String description, double price) async {
    final product = Product(
      id: id,
      name: name,
      description: description,
      price: price,
    );

    final result =
        await updateProductUseCase(UpdateProductparams(product: product));

    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedProduct) => print('Product updated successfully'),
    );
  }

  Future<void> deleteproduct(String id) async {
    final result = await deleteProductUseCase(DeleteProductparams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(
        success ? 'Product deleted successfully' : 'Product not found',
      ),
    );
  }
}
