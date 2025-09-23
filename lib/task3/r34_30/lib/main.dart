import 'dart:io';
import 'package:task3/features/posts/presentation/console/post_menu.dart';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';
import 'package:task3/features/product/presentation/console/product_menu.dart';
import 'package:task3/features/product/presentation/services/product_console_service.dart';
import 'package:task3/features/user/presentation/console/user_menu.dart';
import 'package:task3/features/user/presentation/services/user_console_service.dart';
import 'package:task3/injection_container.dart';

void main() {
  print('Initializing CRUD Management System...');

  init();

  print('System initialized successfully!');

  final productMenu = ProductMenu(k1<ProductConsoleService>());
  final userMenu = UserMenu(k1<UserConsoleService>());
  final postMenu = PostMenu(k1<PostConsoleService>());

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
