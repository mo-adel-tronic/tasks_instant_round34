import 'dart:io';
import 'package:r34_24/features/user/presentation/services/user_console_services.dart';

class UserMenu {
  final UserConsoleService _userConsoleService;

  UserMenu(this._userConsoleService);

  void showMenu() {
    while (true) {
      print('\n------ User Management Menu -----');
      print('1. List all users');
      print('2. View user details');
      print('3. Create new user');
      print('4. Update user');
      print('5. Delete user');
      print('6. Exit');
      stdout.write('Enter your choice (1-6): ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _userConsoleService.displayAllUsers();
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
          print('Exiting User Menu...');
          return;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewUser() {
    stdout.write('Enter user ID: ');
    final id = stdin.readLineSync() ?? '';
    _userConsoleService.displayUser(id);
  }

  void _createUser() {
    stdout.write('Enter name: ');
    final name = stdin.readLineSync() ?? '';
    stdout.write('Enter email: ');
    final email = stdin.readLineSync() ?? '';
    _userConsoleService.createUser(name, email);
  }

  void _updateUser() {
    stdout.write('Enter user ID: ');
    final id = stdin.readLineSync() ?? '';
    stdout.write('Enter new name: ');
    final name = stdin.readLineSync() ?? '';
    stdout.write('Enter new email: ');
    final email = stdin.readLineSync() ?? '';
    _userConsoleService.updateUser(id, name, email);
  }

  void _deleteUser() {
    stdout.write('Enter user ID: ');
    final id = stdin.readLineSync() ?? '';
    _userConsoleService.deleteUser(id);
  }
}
