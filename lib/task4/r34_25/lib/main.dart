import 'dart:io';
import 'package:task3/features/posts/presentation/console/post_menu.dart';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';
import 'package:task3/features/products/presentation/console/product_menu.dart';
import 'package:task3/features/products/presentation/services/product_console_service.dart';
import 'package:task3/features/user/presentation/console/user_menu.dart';
import 'package:task3/features/user/presentation/services/use_console_service.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  print('Initializing CRUD Management System...');

  // Initialize dependency injection
  di.init();

  print('System initialized successfully!');

  // Create the main menu
  final productMenu = ProductMenu(di.s1<ProductConsoleService>());
  final userMenu = UserMenu(di.s1<UserConsoleService>());
  final postMenu = PostMenu(di.s1<PostConsoleService>());

  // Start the main menu
  await _showMainMenu(productMenu, userMenu, postMenu);
}

Future<void> _showMainMenu(
  ProductMenu productMenu,
  UserMenu userMenu,
  PostMenu postMenu,
) async {
  while (true) {
    print("\n== MAIN MANAGEMENT SYSTEM ==");
    print('1. Product Services');
    print('2. User Services');
    print('3. Post Services');
    print('4. Exit');
    stdout.write('Enter your choice (1-4): ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await productMenu.showMenu();
        break;
      case '2':
        await userMenu.showMenu();
        break;
      case '3':
        await postMenu.showMenu();
        break;
      case '4':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
