import 'dart:io';

import 'package:task7/features/products/domain/usecases/get_product.dart';
import 'package:task7/features/products/domain/usecases/update_product.dart';
import 'package:task7/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
  final ProductConsoleService _productService;
  ProductMenu(this._productService);

  Future<void> showMenu() async {
    while (true) {
      print("\n=== Product Management System ===");
      print("1. List all products");
      print("2. View product details");
      print("3. Create new product");
      print("4. Update product");
      print("5. Delete product");
      print("6. main menu");
      print("7. Exit");
      stdout.write("Enter your choice (1-7): ");
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await _productService.displayAllProducts();
          break;
        case '2':
          await _viewProduct();
          break;
        case '3':
          await _createProduct();
          break;
        case '4':
          await _updateProduct();
          break;
        case '5':
          await _deleteProduct();
          break;
        case '6':
          return;
        case '7':
          print("Exiting...");
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }

  Future<void> _viewProduct() async {
    stdout.write("Enter product Id: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productService.displayProduct(id);
    } else {
      print("Id is required.");
    }
  }

  Future<void> _createProduct() async {
    stdout.write("Enter product Name: ");
    final name = stdin.readLineSync();
    stdout.write("Enter product description: ");
    final description = stdin.readLineSync();
    stdout.write("Enter product price: ");
    final priceStr = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        await _productService.createProduct(name, description, price);
      } catch (e) {
        print("Invalid price format. Please enter a valid number.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _updateProduct() async {
    stdout.write("Enter product Id to update: ");
    final id = stdin.readLineSync();
    stdout.write("Enter product Name: ");
    final name = stdin.readLineSync();
    stdout.write("Enter product description: ");
    final description = stdin.readLineSync();
    stdout.write("Enter product price: ");
    final priceStr = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        await _productService.updateProduct(id, name, description, price);
      } catch (e) {
        print("Invalid price format. Please enter a valid number.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _deleteProduct() async {
    stdout.write("Enter product Id to delete: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productService.deleteproduct(id);
    } else {
      print("Id is required.");
    }
  }
}
