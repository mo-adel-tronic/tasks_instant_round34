import 'dart:io';

import 'package:task3/features/user/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userService;

  UserMenu(this._userService);

  void showMenu() {
    subLoop: while (true) {
      print("\n== USER MANAGEMENT SYSTEM ==");
      print('1. List all users');
      print('2. View user details');
      print('3. Create new user');
      print('4. Update user');
      print('5. Delete user');
      print('6. Back to main menu');
      print('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _userService.displayAllUser();
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
          print('Returning to main menu...');
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
    } else {
      print('User ID is required.');
    }
  }

  void _createUser() {
    print('Enter user name: ');
    final name = stdin.readLineSync();
    print('Enter user email: ');
    final email = stdin.readLineSync();

    if (name != null && name.isNotEmpty && email != null && email.isNotEmpty) {
      _userService.createUser(name, email);
    } else {
      print('All fields are required.');
    }
  }

  void _updateUser() {
    print('Enter user ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new user name: ');
    final name = stdin.readLineSync();
    print('Enter new user email: ');
    final email = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        name != null && name.isNotEmpty &&
        email != null && email.isNotEmpty) {
      _userService.updateUser(id, name, email);
    } else {
      print('All fields are required.');
    }
  }

  void _deleteUser() {
    print('Enter user ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userService.deleteUser(id);
    } else {
      print('User ID is required.');
    }
  }
}