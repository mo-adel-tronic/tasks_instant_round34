import 'dart:io';
import 'package:r34_06/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
  final ProductConsoleService _productService;

  ProductMenu(this._productService);

  void showMenu() {
    subLoop: while (true) {
      print("\n== PRODUCT MANAGEMENT SYSTEM ==");
      print('1. List all products');
      print('2. View product details');
      print('3. Create new product');
      print('4. Update product');
      print('5. Delete product');
      print('6. Back to main menu');
      print('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _productService.displayAllProducts();
          break;
        case '2':
          _viewProduct();
          break;
        case '3':
          _createProduct();
          break;
        case '4':
          _updateProduct();
          break;
        case '5':
          _deleteProduct();
          break;
        case '6':
          print('Returning to main menu...');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewProduct() {
    print('Enter product ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _productService.displayProduct(id);
    } else {
      print('Product ID is required.');
    }
  }

  void _createProduct() {
    print('Enter product name: ');
    final name = stdin.readLineSync();
    print('Enter product description: ');
    final description = stdin.readLineSync();
    print('Enter product price: ');
    final priceStr = stdin.readLineSync();

    if (name != null && name.isNotEmpty &&
        description != null && description.isNotEmpty &&
        priceStr != null && priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _productService.createProduct(name, description, price);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _updateProduct() {
    print('Enter product ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new product name: ');
    final name = stdin.readLineSync();
    print('Enter new product description: ');
    final description = stdin.readLineSync();
    print('Enter new product price: ');
    final priceStr = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        name != null && name.isNotEmpty &&
        description != null && description.isNotEmpty &&
        priceStr != null && priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _productService.updateProduct(id, name, description, price);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _deleteProduct() {
    print('Enter product ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _productService.deleteProduct(id);
    } else {
      print('Product ID is required.');
    }
  }
}