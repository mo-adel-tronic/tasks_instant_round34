import 'dart:async';
import 'dart:io';
import 'package:r34_02/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
  final ProductConsoleService _productConsoleService;
  Timer? _loadingTimer;

  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  ProductMenu(this._productConsoleService) {
    // Listen to loading stream
    _loadingSub = _productConsoleService.loadingStream.listen((loading) {
      _isLoading = loading; // get the value from stream
      if (loading) {
        _startLoadingAnimation();
        //_showSpinner();
      } else {
        _stopLoadingAnimation();
        print("\n✅ Done.\n");
      }
    });
  }

  Future<void> showMenu() async {
    while (true) {
      print("\n===== PRODUCT MANAGEMENT SYSTEM =====");
      print("1. List All Products");
      print("2. View Product Details");
      print("3. Create New Product");
      print("4. Update Product");
      print("5. Delete Product");
      print("6. Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          await _productConsoleService.displayAllProducts();
          break;
        case '2':
          await _viewProductMenu();
          break;
        case '3':
          await _createProductMenu();
          break;
        case '4':
          await _updateProductMenu();
          break;
        case '5':
          await _deleteProductMenu();
          break;
        case '6':
          return;
        default:
          print("Invalid choice, please try again");
      }
    }
  }

  Future<void> _viewProductMenu() async {
    print("\n===== PRODUCT DETAILS =====");
    print("Enter Product ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productConsoleService.displayProduct(id);
    }
  }

  Future<void> _createProductMenu() async {
    print("\n===== CREATE PRODUCT =====");

    print("Enter Product Name:");
    final name = stdin.readLineSync();
    print("Enter Product Description:");
    final description = stdin.readLineSync();
    print("Enter Product Price:");
    final priceStr = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        double price = double.parse(priceStr);
        await _productConsoleService.createProduct(name, price, description);
      } catch (e) {
        print("Price format is not valid");
      }
    } else {
      print("All fields are required, please try again.");
    }
  }

  Future<void> _updateProductMenu() async {
    print("\n===== UPDATE PRODUCT =====");
    print("Enter Product ID:");
    final id = stdin.readLineSync();
    print("Enter Product Name:");
    final name = stdin.readLineSync();
    print("Enter Product Description:");
    final description = stdin.readLineSync();
    print("Enter Product Price:");
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
        double price = double.parse(priceStr);
        await _productConsoleService.updateProduct(
          id,
          name,
          price,
          description,
        );
      } catch (e) {
        print("Price format is not valid");
      }
    } else {
      print("All fields are required, please try again.");
    }
  }

  Future<void> _deleteProductMenu() async {
    print("\n===== DELETE PRODUCT =====");
    print("Enter Product ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _productConsoleService.deleteProduct(id);
    }
  }

  Future<void> _showSpinner() async {
    while (_isLoading) {
      stdout.write("\rloading ...");
      await Future.delayed(const Duration(microseconds: 150));
    }
    stdout.write("\r");
  }

  void dispose() {
    _loadingSub?.cancel();
    _productConsoleService.dispose(); // call: _loadingController.close();
  }

  // 🔹 Animated loader
  void _startLoadingAnimation() {
    int dotCount = 0;
    _loadingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      dotCount = (dotCount + 1) % 4; // cycle 0..3
      stdout.write("\r⏳ Loading${'.' * dotCount}   ");
    });
  }

  void _stopLoadingAnimation() {
    _loadingTimer?.cancel();
    _loadingTimer = null;
    stdout.write("\r                          \r"); // clear line
  }
}
