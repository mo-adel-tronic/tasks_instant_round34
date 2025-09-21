import 'dart:io';
import 'dart:async';
import 'package:r34_12/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
  final ProductConsoleService _productService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  ProductMenu(this._productService) {
    _loadingSub = _productService.loadingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _showSpinnerWhileLoading();
      }
    });
  }

  Future<void> showMenu() async {
    menuLoop: while (true) {
      print("\n== PRODUCT MANAGEMENT SYSTEM ==");
      print('1. List all products');
      print('2. View product details');
      print('3. Create new product');
      print('4. Update product');
      print('5. Delete product');
      print('6. Back to main menu');
      stdout.write('Enter your choice (1-6): ');

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
          print('Returning to main menu...');
          break menuLoop; 
        default:
          print('Invalid choice. Please try again.');
      }
    }

    await _loadingSub?.cancel(); 
    _productService.dispose();
  }

  Future<void> _viewProduct() async {
    stdout.write('Enter product ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productService.displayProduct(id);
    } else {
      print('Product ID is required.');
    }
  }

  Future<void> _createProduct() async {
    stdout.write('Enter product name: ');
    final name = stdin.readLineSync();
    stdout.write('Enter product description: ');
    final description = stdin.readLineSync();
    stdout.write('Enter product price: ');
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
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _updateProduct() async {
    stdout.write('Enter product ID to update: ');
    final id = stdin.readLineSync();
    stdout.write('Enter new product name: ');
    final name = stdin.readLineSync();
    stdout.write('Enter new product description: ');
    final description = stdin.readLineSync();
    stdout.write('Enter new product price: ');
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
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _deleteProduct() async {
    stdout.write('Enter product ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productService.deleteProduct(id);
    } else {
      print('Product ID is required.');
    }
  }

  void _showSpinnerWhileLoading() {
    print("Loading... Please wait.");
  }
}
