import 'dart:io';

import 'package:r34_01/features/user/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userService;
  UserMenu(this._userService);
  void showMenu() {
    subLoop: while (true) {
      print('\n===USER MANGEMENT SYSTEM===');
      print('1. List all users');
      print('2. View user deaols');
      print('3. Create new user');
      print('4. Update user');
      print('5. Delete user');
      print('6. Exit');
      print('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _userService.displayAllUsers();
          break;
        case '2':
          _viewUser();
          break;
        case '3':
          _createUser();
          break;
        case '4':
          _updateUser();
          break;
        case '5':
          _deleteUser();
          break;
        case '6':
          print('Goodbye!');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewUser() {
    print('Enter user ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userService.displayUser(id);
    }
  }

  void _createUser() {
    print('Enter post name: ');
    final name = stdin.readLineSync();
    print('Enter post description: ');
    final description = stdin.readLineSync();
    print('Enter post price: ');
    final priceStr = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _userService.createUser(name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _updateUser() {
    print('Enter book ID: ');
    final id = stdin.readLineSync();
    print('Enter book name: ');
    final name = stdin.readLineSync();
    print('Enter book description: ');
    final description = stdin.readLineSync();
    print('Enter book price: ');
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
        _userService.updateUser(id, name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _deleteUser() {
    print('Enter user ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userService.deleteUser(id);
    }
  }
}
