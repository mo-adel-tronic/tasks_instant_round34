import 'package:r34_02/core/error/messages.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/usecases/create_product.dart';
import 'package:r34_02/features/products/domain/usecases/delete_product.dart';
import 'package:r34_02/features/products/domain/usecases/get_all_product.dart';
import 'package:r34_02/features/products/domain/usecases/get_product.dart';
import 'package:r34_02/features/products/domain/usecases/update_product.dart';

class ProductConsoleService with MapFailurMessages {
  final GetAllProduct getAllProductsUseCase;
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
    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      products,
    ) {
      if (products.isEmpty) {
        print("No Products till now");
      } else {
        print("\n=====PRODUCTS====");
        for (final product in products) {
          print("ID: ${product.id}");
          print("Name: ${product.name}");
          print("Price: \$${product.price.toStringAsFixed(2)}");
          print("Description: ${product.description}");
          print("------");
        }
      }
    });
  }

  void displayProduct(String id) {
    final result = getProductUseCase(GetProductParam(id: id));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      product,
    ) {
      print("ID: ${product.id}");
      print("Name: ${product.name}");
      print("Price: \$${product.price.toStringAsFixed(2)}");
      print("Description: ${product.description}");
      print("------");
    });
  }

  void createProduct(String name, double price, String description) {
    final product = Product(
      id: '',
      name: name,
      price: price,
      description: description,
    );
    final result = createProductUseCase(CreateProductParam(product: product));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      newProduct,
    ) {
      print("\nProduct is created successfully with details :\n");

      print("ID: ${newProduct.id}");
      print("Name: ${newProduct.name}");
      print("Price: \$${newProduct.price.toStringAsFixed(2)}");
      print("Description: ${newProduct.description}");
    });
  }

  void updateProduct(String id, String name, double price, String description) {
    final product = Product(
      id: id,
      name: name,
      price: price,
      description: description,
    );
    final result = updateProductUseCase(UpdateProductParam(product: product));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      newProduct,
    ) {
      print("\nProduct is updated successfully with details :\n");

      print("ID: ${newProduct.id}");
      print("Name: ${newProduct.name}");
      print("Price: \$${newProduct.price.toStringAsFixed(2)}");
      print("Description: ${newProduct.description}");
    });
  }

  void deleteProduct(String id) {
    final result = deleteProductUseCase(DeleteProductParam(id: id));
    result.fold(
      (failure) => print("Error is ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "Product is deleted successfully"
            : "Product with id $id was not found",
      ),
    );
  }
}
