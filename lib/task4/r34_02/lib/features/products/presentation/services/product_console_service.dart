import 'dart:async';

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

  // 🔹 Loading state stream
  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream =>
      _loadingController.stream; //return the output from the stream controller

  void _setLoading(bool v) => _loadingController.add(
    v,
  ); //add bool to controller sink ==  _loadingController.sink.add

  Future<void> displayAllProducts() async {
    _setLoading(true); //add true to sink
    final result = await getAllProductsUseCase(); // get data
    _setLoading(false); // add false to sink
    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      products,
    ) {
      if (products.isEmpty) {
        print("⚠️ No products found.");
      } else {
        print("\n===== PRODUCTS =====");
        for (final p in products) {
          print("ID: ${p.id}");
          print("Name: ${p.name}");
          print("Price: \$${p.price}");
          print("Description: ${p.description}");
          print("------");
        }
      }
    });

    _setLoading(false);
  }

  Future<void> displayProduct(String id) async {
    _setLoading(true);
    final result = await getProductUseCase(GetProductParam(id: id));
    _setLoading(false);

    result.fold(
      (failure) {
        print("Error is ${mapFailurToMssage(failure)}");
      },
      (product) {
        print("ID: ${product.id}");
        print("Name: ${product.name}");
        print("Price: \$${product.price.toStringAsFixed(2)}");
        print("Description: ${product.description}");
        print("------");
      },
    );
  }

  Future<void> createProduct(
    String name,
    double price,
    String description,
  ) async {
    _setLoading(true);
    final product = Product(
      id: "",
      name: name,
      price: price,
      description: description,
    );
    final result = await createProductUseCase(
      CreateProductParam(product: product),
    );
    _setLoading(false);

    result.fold(
      (failure) {
        print("Error is ${mapFailurToMssage(failure)}");
      },
      (newProduct) {
        print("\nProduct created successfully:\n");
        print("ID: ${newProduct.id}");
        print("Name: ${newProduct.name}");
        print("Price: \$${newProduct.price.toStringAsFixed(2)}");
        print("Description: ${newProduct.description}");
      },
    );
  }

  Future<void> updateProduct(
    String id,
    String name,
    double price,
    String description,
  ) async {
    _setLoading(true);
    final product = Product(
      id: id,
      name: name,
      price: price,
      description: description,
    );
    final result = await updateProductUseCase(
      UpdateProductParam(product: product),
    );
    _setLoading(false);

    result.fold(
      (failure) {
        print("Error is ${mapFailurToMssage(failure)}");
      },
      (updatedProduct) {
        print("\nProduct updated successfully:\n");
        print("ID: ${updatedProduct.id}");
        print("Name: ${updatedProduct.name}");
        print("Price: \$${updatedProduct.price.toStringAsFixed(2)}");
        print("Description: ${updatedProduct.description}");
      },
    );
  }

  Future<void> deleteProduct(String id) async {
    _setLoading(true);
    final result = await deleteProductUseCase(DeleteProductParam(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print("Error is ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "Product deleted successfully"
            : "Product with id $id not found",
      ),
    );
  }

  // 🔹 Close stream when done
  void dispose() {
    _loadingController.close(); // clean our memory
  }
}
