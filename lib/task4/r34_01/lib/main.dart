import 'dart:io';
import 'package:r34_01/features/book/presentation/console/book_menu.dart';
import 'package:r34_01/features/post/presentation/console/post_menu.dart';
import 'package:r34_01/features/user/presentation/console/user_menu.dart';
import 'package:r34_01/injection_container.dart';

void main() {
  print('Initializing CRUD Management System...');

  // Initialize dependency injection
  init();

  print('System initialized successfully!');

  //Start the main menu
  _showMainMenu();
}

Future<void> _showMainMenu() async {
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
        await _handleProductMenu();
        break;
      case '2':
        await _handleUserMenu();
        break;
      case '3':
        await _handlePostMenu();
        break;
      case '4':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

Future<void> _handleProductMenu() async {
  final productMenu = s1<ProductMenu>();
  try {
    await productMenu.showMenu();
  } finally {
    productMenu.dispose();
  }
}

Future<void> _handleUserMenu() async {
  final userMenu = s1<UserMenu>();
  try {
    await userMenu.showMenu();
  } finally {
    userMenu.dispose();
  }
}

Future<void> _handlePostMenu() async {
  final postMenu = s1<PostMenu>();
  try {
    await postMenu.showMenu();
  } finally {
    postMenu.dispose();
  }
}