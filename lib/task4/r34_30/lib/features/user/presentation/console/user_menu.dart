import 'dart:async';
import 'dart:io';
import 'package:r34_30/features/user/presentation/services/user_cosole_service.dart';

class UserMenu {
  final UserConsoleService _userService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  UserMenu(this._userService) {
    _loadingSub = _userService.loadingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _showSpinnerWhileLoading();
      }
    });
  }

  Future<void> showMenu() async {
    subLoop:
    while (true) {
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
          await _userService.displayAllUser();
          break;
        case '2':
          await _viewUser();
          break;
        case '3':
          await _createUser();
          break;
        case '4':
          await _updateUser();
          break;
        case '5':
          await _deleteUser();
          break;
        case '6':
          print('Returning to main menu...');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  Future<void> _viewUser() async {
    print('Enter user ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.displayUser(id);
    } else {
      print('User ID is required.');
    }
  }

  Future<void> _createUser() async {
    print('Enter user name: ');
    final name = stdin.readLineSync();
    print('Enter user email: ');
    final email = stdin.readLineSync();

    if (name != null && name.isNotEmpty && email != null && email.isNotEmpty) {
      await _userService.createUser(name, email);
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _updateUser() async {
    print('Enter user ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new user name: ');
    final name = stdin.readLineSync();
    print('Enter new user email: ');
    final email = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty) {
      await _userService.updateUser(id, name, email);
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _deleteUser() async {
    print('Enter user ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.deleteUser(id);
    } else {
      print('User ID is required.');
    }
  }

  Future<void> _showSpinnerWhileLoading() async {
    const spinnerChars = ['|', '/', '-', '\\'];
    var i = 0;
    while (_isLoading) {
      stdout.write('\rLoading... ${spinnerChars[i % spinnerChars.length]}');
      await Future.delayed(const Duration(milliseconds: 150));
      i++;
    }
    stdout.write('\r');
  }

  void dispose() {
    _loadingSub?.cancel();
    _userService.dispose();
  }
}
