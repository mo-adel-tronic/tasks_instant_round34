import 'dart:io';

import 'package:task7/main.dart';
import 'package:task7/features/users/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userService;
  UserMenu(this._userService);

  Future<void> showMenu() async {
    while (true) {
      print("\n=== user Management System ===");
      print("1. List all users");
      print("2. View user details");
      print("3. Create new user");
      print("4. Update user");
      print("5. Delete user");
      print("6. main menu");
      print("7. Exit");
      stdout.write("Enter your choice (1-7): ");
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await _userService.displayAllusers();
          break;
        case '2':
          await _viewuser();
          break;
        case '3':
          await _createuser();
          break;
        case '4':
          await _updateuser();
          break;
        case '5':
          await _deleteuser();
          break;
        case '6':
           return;
        case '7':
          print("Exiting...");
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }

  Future<void> _viewuser() async {
    stdout.write("Enter user Id: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.displayuser(id);
    } else {
      print("Id is required.");
    }
  }

  Future<void> _createuser() async {
    stdout.write("Enter user Name: ");
    final name = stdin.readLineSync();
    stdout.write("Enter user email: ");
    final email = stdin.readLineSync();
    stdout.write("Enter user password: ");
    final password = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      try {
        await _userService.createuser(name, email, password);
      } catch (e) {
        print("Invalid price format. Please enter a valid password.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _updateuser() async {
    stdout.write("Enter user Id to update: ");
    final id = stdin.readLineSync();
    stdout.write("Enter user Name: ");
    final name = stdin.readLineSync();
    stdout.write("Enter user email: ");
    final email = stdin.readLineSync();
    stdout.write("Enter user password: ");
    final password = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      try {
        await _userService.updateuser(id, name, email, password);
      } catch (e) {
        print("Invalid price format. Please enter a valid number.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _deleteuser() async {
    stdout.write("Enter user Id to delete: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.deleteuser(id);
    } else {
      print("Id is required.");
    }
  }
}
