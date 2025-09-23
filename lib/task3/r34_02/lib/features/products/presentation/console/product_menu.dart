import 'dart:io';

import 'package:r34_02/features/products/presentation/services/product_console_service.dart';

class ProductMenu {
  final ProductConsoleService _productConsoleService;

  ProductMenu(this._productConsoleService);
  void showMenu() {
    while (true) {
      print("\n===== PRODUCT MANAGEMENT SYSTEM =====");
      print("1.List All Products");
      print("2.View Product Details");
      print("3.Create New Product");
      print("4.Update Product");
      print("5.Delete Product");
      print("6.Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          _productConsoleService.displayAllProducts();
          break;
        case '2':
          _viewProductMenu();
        case '3':
          _createProductMenu();
        case '4':
          _updateProductMenu();
        case '5':
          _deleteProductMenu();
        case '6':
          return; //should be exit(0) , but we will use return because we will have outer loop(so we will exit from this nested loop)
        default:
          print("invalid choise, please try again");
      }
    }
  }

  void _viewProductMenu() {
    //_viewProduct is private now
    print("\n===== PRODUCT DETAILS =====");
    print("Enter Product ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _productConsoleService.displayProduct(id);
    }
  }

  void _createProductMenu() {
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
        _productConsoleService.createProduct(name, price, description);
      } catch (e) {
        print("Price Format is not valid");
      }
    } else {
      print("All Fields are required,please");
    }
  }

  void _updateProductMenu() {
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
        _productConsoleService.updateProduct(id, name, price, description);
      } catch (e) {
        print("Price Format is not valid");
      }
    } else {
      print("All Fields are required,please");
    }
  }

  void _deleteProductMenu() {
    //_viewProduct is private now
    print("\n===== UPDATE PRODUCT =====");

    print("Enter Product ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _productConsoleService.deleteProduct(id);
    }
  }
}
