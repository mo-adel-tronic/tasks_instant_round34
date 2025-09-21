import 'dart:io';
import 'package:r34_23/features/users/presentation/services/user_console_services.dart';

class UserMenu {
  final UserConsoleServices _userServices;

  UserMenu(this._userServices);

  void showMenu() {
    subloop:while (true) {
      print("\n=== User Management System ===");
      print("1. List all users");
      print("2. View user details");
      print("3. Create new user");
      print("4. Update user");
      print("5. Delete user");
      print("6. Exit");
      print("Enter your choice (1-6): ");

      final choice = stdin.readLineSync();
      switch (choice) {
        case "1":
          _userServices.displayAllUsers();
          break;
        case "2":
          _viewUser();
          break;
        case "3":
          _createUser();
          break;
        case "4":
          _updateUser();
          break;
        case "5":
          _deleteUser();
          break;
        case "6":
          print("Goodbye");
          break subloop;
        default:
          print("Invalid choice, please try again.");
      }
    }
  }

  void _viewUser() {
    print("Enter user ID: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userServices.displayUser(id);
    }
  }

  void _createUser() {
    print("Enter user name: ");
    final name = stdin.readLineSync();
    print("Enter user email: ");
    final email = stdin.readLineSync();

    if (name != null && name.isNotEmpty && email != null && email.isNotEmpty) {
     try{
      _userServices.createUser(name, email);
     }catch(e){
        print('invalid price format.please enter the valid number');
     }
    } else {
      print("All fields are required.");
    }
  }

  void _updateUser() {
    print("Enter the ID of the user to update: ");
    final id = stdin.readLineSync();
    print("Enter new user name: ");
    final name = stdin.readLineSync();
    print("Enter new user email: ");
    final email = stdin.readLineSync();

    if (id != null &&id.isNotEmpty && name != null && name.isNotEmpty && email != null && email.isNotEmpty) {
      try{
      _userServices.updateUser(id, name, email);
      }catch(e){
          print('invalid price format.please enter the valid number');
      }
    } else {
      print("All fields are required.");
    }
  }

  void _deleteUser() {
    print("Enter user ID to delete: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _userServices.deleteUser(id);
    }
  }
}