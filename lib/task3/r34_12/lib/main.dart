import 'package:r34_12/features/products/presentation/console/product_menu.dart';
import 'package:r34_12/features/products/presentation/services/product_console_service.dart';
import 'package:r34_12/features/users/presentation/console/user_menu.dart';
import 'package:r34_12/features/users/presentation/services/user_console_service.dart';
import 'package:r34_12/features/posts/presentation/console/post_menu.dart';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';
import 'injection_container.dart' as di;
import 'dart:io';

void main() {
  print('Initializing CRUD Management System...');
  
  // Initialize dependency injection
  di.init();
  
  print('System initialized successfully!');
  
  // Create the main menu
  final productMenu = ProductMenu(di.sl<ProductConsoleService>());
  final userMenu = UserMenu(di.sl<UserConsoleService>());
  final postMenu = PostMenu(di.sl<PostConsoleService>());

  //Start the main menu
  _showMainMenu(productMenu, userMenu, postMenu);
}

void _showMainMenu(ProductMenu productMenu, UserMenu userMenu, PostMenu postMenu) {
  while (true) {
    print("\n== MAIN MANAGEMENT SYSTEM ==");
    print('1. Product Services');
    print('2. User Services');
    print('3. Post Services');
    print('4. Exit');
    print('Enter your choice (1-4): ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        productMenu.showMenu();
        break;
      case '2':
        userMenu.showMenu();
        break;
      case '3':
        postMenu.showMenu();
        break;
      case '4':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}